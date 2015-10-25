% function [Percentage,CH]=getBaseWorkspaces(human,robot,p)
% ----
% Gets base frames workspaces
% human - human model object
% robot - robot model object
% CHmessage- CH plot option
% resolution - Resolution (1x2 vector) of the grid.
% robotinfo - information regarding the robot model
% robotbases - struct of transformation matrices 
% ----
% OpenBionics | info@openbionics.org
% http://www.openbionics.org
% ----
% Copyright (C) 2015 OpenBionics Initiative (www.openbionics.org)
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [Percentage,CH]=getBaseWorkspaces(human,robot,p)

R=p.resolution;
nfingers=p.nfingers;
notation=p.notation;

RobotPoints=[];
HumanPoints=[];

RobotOrientations=[];
HumanOrientations=[];

for f=1:nfingers
    
    nh=human{f}.n;
    
    [HPoints]=plotBasesPositions ...
        (human{f},(0*pi/180)*ones(1,nh),1:nh,nh, ...
        R*ones(1,nh),notation);
    
    [HOrientations]=plotBasesOrientations ...
        (human{f},(0*pi/180)*ones(1,nh),1:nh,nh, ...
        R*ones(1,nh),notation);
    
    HumanPoints=[HumanPoints;HPoints];
    HumanOrientations= ...
        [HumanOrientations;HOrientations];
    
    if isnumeric(robot{1})~=1
    nr=robot{f}.n;
    
    [RPoints]=plotBasesPositions ...
        (robot{f},(0*pi/180)*ones(1,nr),1:nr,nr, ...
        R*ones(1,nr),notation);
    
    [ROrientations]=plotBasesOrientations ...
        (robot{f},(0*pi/180)*ones(1,nr),1:nr,nr, ...
        R*ones(1,nr),notation);
    
    RobotPoints=[RobotPoints;RPoints];
    RobotOrientations= ...
        [RobotOrientations;ROrientations];
    else
        RobotPoints=[RobotPoints;robot{f}(1:3,4)'];
    RobotOrientations= ...
        [RobotOrientations;tr2eul(robot{f}(1:3,1:3))];
    disp(RobotPoints);
    end
end

Uoptions.useisconvex=0;

% Compare base frames positions 

% Create convex hulls 
[CHRobotP] = polytope(RobotPoints);
[CHHumanP] = polytope(HumanPoints);

% Compute intersection of convex hulls 
IntersectionCHP=intersect(CHHumanP,CHRobotP);
UnionCHP= ...
    union([CHHumanP,CHRobotP],Uoptions);

if size(UnionCHP,2)==2
    UnionPointsP1=extreme(UnionCHP(1));
    UnionPointsP2=extreme(UnionCHP(2));
    UnionPointsP=[UnionPointsP1;UnionPointsP2];
    VolumeUnionP=volumeCH(UnionPointsP);
else
    [VolumeUnionP]=volume(UnionCHP);
end

[VolumeIntersectionP]=volume(IntersectionCHP);
[VolumeRobotP]=volume(CHRobotP);
[VolumeHumanP]=volume(CHHumanP);

Percentage.Positions= ...
    VolumeIntersectionP/VolumeUnionP;

% Compare base frames orientations 

% Create convex hulls
[CHRobotO]=polytope(RobotOrientations);
[CHHumanO]=polytope(HumanOrientations);

% Compute intersection of convex hulls 
IntersectionCHO=intersect(CHHumanO,CHRobotO);
UnionCHO=union(CHHumanO,CHRobotO);

if size(UnionCHO,2)==2
    UnionPointsO1=extreme(UnionCHO(1));
    UnionPointsO2=extreme(UnionCHO(2));
    UnionPointsO=[UnionPointsO1;UnionPointsO2];
    VolumeUnionO=volumeCH(UnionPointsO);
else
    [VolumeUnionO]=volume(UnionCHO);
end

[VolumeIntersectionO]=volume(IntersectionCHO);
[VolumeRobotO]=volume(CHRobotO);
[VolumeHumanO]=volume(CHHumanO);

Percentage.Orientations= ...
VolumeIntersectionO/VolumeUnionO;

CH.P=UnionCHP;
CH.O=UnionCHO;

% Display results

if strcmp(p.details,'ON')==1;
    
    disp('#### ---- Positions ---- ####');
    
    disp('Intersection Volume:')
    disp(VolumeIntersectionP);
    disp('Union Volume:')
    disp(VolumeUnionP);
    disp('Robot Volume:')
    disp(VolumeRobotP);
    disp('Human Volume:')
    disp(VolumeHumanP);
    
    % Compute percentage of humanlikeness 
    disp('--------------------------------------------');
    disp('Humanlikeness % for bases positions:');
    disp(Percentage.Positions);
    disp('--------------------------------------------');
    
    disp('#### ---- Orientations ---- ####');
    
    disp('Intersection Volume:')
    disp(VolumeIntersectionO);
    disp('Union Volume:')
    disp(VolumeUnionO);
    disp('Robot Volume:')
    disp(VolumeRobotO);
    disp('Human Volume:')
    disp(VolumeHumanO);
    
    % Compute percentage of humanlikeness 
    disp('--------------------------------------------');
    disp('Humanlikeness % for bases orientations:');
    disp(Percentage.Orientations);
    disp('--------------------------------------------');
    
end

end

