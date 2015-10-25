% function [Percentage,CHU,Points,CH]=getFingerWorkspaces(robot,human,p)
% ----
% Gets finger workspaces
% robot - robot object
% qz - joint coordinate vector zero pose(1xn vector)
% qindex - index (1x2 vector) for the two joint 
%               variables in the plot, e.g. [2 3]
% frame - Frame whos origin will be ploted
% resolution - Resolution (1x2 vector) of the grid
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

function [Percentage,CHU,Points,CH]=...
    getFingerWorkspaces(robot,human,p)

R=p.resolution;
nr=robot.n;
nh=human.n;

% Robot 

[CH.RProxi,Points.RProxi] = ...
    plotFingerPositions ...
    (robot,0*pi/180*ones(1,nr),1:nr,nr-2,...
    [ones(1,nr-4) R R 1 1],p.ch,p.notation);
[CH.RInter,Points.RInter] = ...
    plotFingerPositions ...
    (robot,0*pi/180*ones(1,nr),1:nr,nr-1,...
    [ones(1,nr-4) R 1 R 1],p.ch,p.notation);
[CH.RDistal,Points.RDistal] = ...
    plotFingerPositions ...
    (robot,0*pi/180*ones(1,nr),1:nr,nr,...
    [ones(1,nr-4) R 1 1 R],p.ch,p.notation);

% Human 

[CH.HProxi,Points.HProxi] = ...
    plotFingerPositions ...
    (human,0*pi/180*ones(1,nh),1:nh,nh-2,...
    [ones(1,nh-4) R R 1 1],p.ch,p.notation);
[CH.HInter,Points.HInter] = ...
    plotFingerPositions ...
    (human,0*pi/180*ones(1,nh),1:nh,nh-1,...
    [ones(1,nh-4) R 1 R 1],p.ch,p.notation);
[CH.HDistal,Points.HDistal] = ...
    plotFingerPositions ...
    (human,0*pi/180*ones(1,nh),1:nh,nh,...
    [ones(1,nh-4) R 1 1 R],p.ch,p.notation);

% Compute intersection of convex hulls

Uoptions.useisconvex=0; 

IntersectionCH_Proxi= ...
    intersect(CH.HProxi,CH.RProxi);
IntersectionCH_Inter= ...
    intersect(CH.HInter,CH.RInter);
IntersectionCH_Distal= ...
    intersect(CH.HDistal,CH.RDistal);
UnionCH_Proxi=union( ...
    [CH.HProxi CH.RProxi],Uoptions);
UnionCH_Inter=union( ...
    [CH.HInter CH.RInter],Uoptions);
UnionCH_Distal=union( ...
    [CH.HDistal CH.RDistal],Uoptions);

if size(UnionCH_Proxi,2)==2
UnionPoints1_Proxi=extreme(UnionCH_Proxi(1));
UnionPoints2_Proxi=extreme(UnionCH_Proxi(2));
UnionPoints_Proxi= ...
    [UnionPoints1_Proxi;UnionPoints2_Proxi];
VolumeUnionProxi= ...
    volumeCH(UnionPoints_Proxi);
else
[VolumeUnionProxi]=volume(UnionCH_Proxi);
end

if size(UnionCH_Inter,2)==2
UnionPoints1_Inter=extreme(UnionCH_Inter(1));
UnionPoints2_Inter=extreme(UnionCH_Inter(2));
UnionPoints_Inter= ...
[UnionPoints1_Inter;UnionPoints2_Inter];
VolumeUnionInter= ...
    volumeCH(UnionPoints_Inter);
else
[VolumeUnionInter]=volume(UnionCH_Inter);
end

if size(UnionCH_Distal,2)==2
UnionPoints1_Distal=extreme(UnionCH_Distal(1));
UnionPoints2_Distal=extreme(UnionCH_Distal(2));
UnionPoints_Distal= ...
    [UnionPoints1_Distal;UnionPoints2_Distal];
VolumeUnionDistal= ...
    volumeCH(UnionPoints_Distal);
else
[VolumeUnionDistal]=volume(UnionCH_Distal);
end

CHU.Proxi = UnionCH_Proxi;
CHU.Inter = UnionCH_Inter;
CHU.Distal = UnionCH_Distal;

% Display results for proxi intersection 

[VolumeIntersectionProxi]= ...
    volume(IntersectionCH_Proxi);
[VolumeRobotProxi]=volume(CH.RProxi);
[VolumeHumanProxi]=volume(CH.HProxi);

if strcmp(p.details,'ON')==1;
    
disp('#### Proximal ####');
disp('Intersection Volume:')
disp(VolumeIntersectionProxi);
disp('Union Volume:')
disp(VolumeUnionProxi);
disp('Robot Volume:')
disp(VolumeRobotProxi);
disp('Human Volume:')
disp(VolumeHumanProxi);

end

% Display results for inter intersection 

[VolumeIntersectionInter]= ...
    volume(IntersectionCH_Inter);
[VolumeRobotInter]=volume(CH.RInter);
[VolumeHumanInter]=volume(CH.HInter);

if strcmp(p.details,'ON')==1;

disp('#### Intermediate ####');
disp('Intersection Volume:')
disp(VolumeIntersectionInter);
disp('Union Volume:')
disp(VolumeUnionInter);
disp('Robot Volume:')
disp(VolumeRobotInter);
disp('Human Volume:')
disp(VolumeHumanInter);

end

% Display results for distal intersection

[VolumeIntersectionDistal]= ...
    volume(IntersectionCH_Distal);
[VolumeRobotDistal]=volume(CH.RDistal);
[VolumeHumanDistal]=volume(CH.HDistal);

if strcmp(p.details,'ON')==1;

disp('#### Distal ####');
disp('Intersection Volume:')
disp(VolumeIntersectionDistal);
disp('Union Volume:')
disp(VolumeUnionDistal);
disp('Robot Volume:')
disp(VolumeRobotDistal);
disp('Human Volume:')
disp(VolumeHumanDistal);

end
   
PercentageFingerProxi= ...
    VolumeIntersectionProxi/VolumeUnionProxi;  
PercentageFingerInter= ...
    VolumeIntersectionInter/VolumeUnionInter;
PercentageFingerDistal= ...
    VolumeIntersectionDistal/VolumeUnionDistal;

if strcmp(p.details,'ON')==1;
    
disp('####');
disp('% of humanlikeness:');
disp('% of humanlikeness for proxi:')
disp(PercentageFingerProxi)
disp('% of humanlikeness for intermediate:')
disp(PercentageFingerInter)
disp('% of humanlikeness for distal:')
disp(PercentageFingerDistal)

end

Percentage.Proxi=PercentageFingerProxi;
Percentage.Inter=PercentageFingerInter;
Percentage.Distal=PercentageFingerDistal;

if strcmp(p.compare,'ON')==1;
    
        % Comparison for proximal
        Fig3='Comparison for proximal';
        figure('Name',Fig3,'NumberTitle','off')
        plot(CH.RProxi);
        hold on
        plot(CH.HProxi,'K');
        axis equal
        
        % Comparison for intermediate
        Fig2='Comparison for intermediate';
        figure('Name',Fig2,'NumberTitle','off')
        plot(CH.RInter);
        hold on
        plot(CH.HInter,'K');
        axis equal
        
        % Comparison for distal 
        Fig1='Comparison for distal';
        figure('Name',Fig1,'NumberTitle','off')
        plot(CH.RDistal);
        hold on
        plot(CH.HDistal,'K');
        axis equal
        
end

end




