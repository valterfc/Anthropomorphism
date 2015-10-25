% function [Percentage,CH]=getThumbWorkspaces(robot,human,p)
% ----
% Gets thumb workspaces
% robot - robot object
% qz - joint coordinate vector zero pose(1xn vector)
% qindex - index (1x2 vector) for the two joint 
%              variables in the plot, e.g. [2 3]
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

function [Percentage,CH]=getThumbWorkspaces(robot,human,p)

R=p.resolution;
nr=robot.n;
nh=human.n;

% Robot 

[RobotCH_Proxi] = ...
    plotFingerPositions(robot,0*pi/180*ones(1,nr),1:nr,nr-1,...
    [ones(1,nr-4) R R 1 1],p.ch,p.notation);
[RobotCH_Distal] = ...
    plotFingerPositions(robot,0*pi/180*ones(1,nr),1:nr,nr,...
    [ones(1,nr-4) R 1 1 R],p.ch,p.notation);

% Human 

[HumanCH_Proxi] = ...
    plotFingerPositions(human,0*pi/180*ones(1,nh),1:nh,nh-1,...
    [ones(1,nr-4) R R 1 1],p.ch,p.notation);
[HumanCH_Distal] = ...
    plotFingerPositions(human,0*pi/180*ones(1,nh),1:nh,nh,...
    [ones(1,nr-4) R 1 1 R],p.ch,p.notation);

% Compute intersection of convex hulls

Uoptions.useisconvex=0; 

IntersectionCH_Proxi = intersect(HumanCH_Proxi,RobotCH_Proxi);
IntersectionCH_Distal = intersect(HumanCH_Distal,RobotCH_Distal);
UnionCH_Proxi = union([HumanCH_Proxi,RobotCH_Proxi],Uoptions);
UnionCH_Distal = union([HumanCH_Distal RobotCH_Distal],Uoptions);

if size(UnionCH_Proxi,2)==2
UnionPoints1_Proxi = extreme(UnionCH_Proxi(1));
UnionPoints2_Proxi = extreme(UnionCH_Proxi(2));
UnionPoints_Proxi = [UnionPoints1_Proxi;UnionPoints2_Proxi];
VolumeUnionProxi = volumeCH(UnionPoints_Proxi);
else
[VolumeUnionProxi]=volume(UnionCH_Proxi);
end

if size(UnionCH_Distal,2)==2
UnionPoints1_Distal = extreme(UnionCH_Distal(1));
UnionPoints2_Distal = extreme(UnionCH_Distal(2));
UnionPoints_Distal = [UnionPoints1_Distal;UnionPoints2_Distal];
VolumeUnionDistal = volumeCH(UnionPoints_Distal);
else
[VolumeUnionDistal]=volume(UnionCH_Distal);
end

CH.Proxi = UnionCH_Proxi;
CH.Distal = UnionCH_Distal;

% Display results for proxi intersection 

[VolumeIntersectionProxi]=volume(IntersectionCH_Proxi);
[VolumeRobotProxi]=volume(RobotCH_Proxi);
[VolumeHumanProxi]=volume(HumanCH_Proxi);

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

% Display results for distal intersection 

[VolumeIntersectionDistal]=volume(IntersectionCH_Distal);
[VolumeRobotDistal]=volume(RobotCH_Distal);
[VolumeHumanDistal]=volume(HumanCH_Distal);

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
   
Percentage.Proxi=VolumeIntersectionProxi/VolumeUnionProxi;  
Percentage.Distal=VolumeIntersectionDistal/VolumeUnionDistal;

if strcmp(p.details,'ON')==1;
    
disp('####');
disp('Percentages of Humanlikeness:');
disp('Percentage of HumanLikeness for Proxi Phalanx Workspace:')
disp(Percentage.Proxi)
disp('Percentage of HumanLikeness for Distal Phalanx Workspace:')
disp(Percentage.Distal)

end

if strcmp(p.compare,'ON')== 1;
           
        % Plots 
        
        % Comparison for proxi 
        Fig3='Comparison Between Human and Robot Workspaces (Proxi)';
        figure('Name',Fig3,'NumberTitle','off')
        plot(RobotCH_Proxi);
        hold on
        plot(HumanCH_Proxi,'K');
        axis equal
        
        % Comparison for distal 
        Fig1='Comparison Between Human and Robot Workspaces (Distal)';
        figure('Name',Fig1,'NumberTitle','off')
        plot(RobotCH_Distal);
        hold on
        plot(HumanCH_Distal,'K');
        axis equal
       
end

end




