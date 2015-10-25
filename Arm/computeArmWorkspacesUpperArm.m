% function [P,CH]=computeArmWorkspacesUpperArm...
% (P,robot,human,CHmessage,Cmessage,resolution,Details,notation)
% ----
% (robot,human,CHmessage,Cmessage,resolution,details)
%
%   robot - robot object
%   qz - joint coordinate vector zero pose(1xn vector)
%   qindex - index (1x2 vector) for the two joint variables
%                 to be varied in the plot, e.g. [2 3]. Number
%                 between 1 and n.
%   frame - Frame whos origin will be ploted.
%                 Number between 1 and n.
%   resolution - Resolution (1x2 vector) of the grid
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

function [P,CH]=computeArmWorkspacesUpperArm...
    (P,robot,human,CHmessage,Cmessage,resolution,Details,notation)

R=resolution;
nr=robot.n;
nh=human.n;

[RobotCH_Upperarm] = ...
    getWorkspacePositions(robot,0*pi/180*ones(1,nr),1:nr,3,...
    [R R R 1 1 1 1],CHmessage,notation);

[HumanCH_Upperarm] = ...
    getWorkspacePositions(human,0*pi/180*ones(1,nh),1:nh,3,...
    [R R R 1 1 1 1],CHmessage,notation);

Uoptions.useisconvex=0; 

IntersectionCH_Upperarm = intersect(HumanCH_Upperarm,RobotCH_Upperarm);
UnionCH_Upperarm = union([HumanCH_Upperarm,RobotCH_Upperarm],Uoptions);

if size(UnionCH_Upperarm,2)==2
UnionPoints1_Upperarm = extreme(UnionCH_Upperarm(1));
UnionPoints2_Upperarm = extreme(UnionCH_Upperarm(2));
UnionPoints_Upperarm = [UnionPoints1_Upperarm;UnionPoints2_Upperarm];
VolumeUnionUpperarm = volumeCH(UnionPoints_Upperarm);
else
[VolumeUnionUpperarm]=volume(UnionCH_Upperarm);
end

CH.Upperarm = UnionCH_Upperarm;

detailsflag = strcmp(Details,'ON');

[VolumeIntersectionUpperarm]=volume(IntersectionCH_Upperarm);
[VolumeRobotUpperarm]=volume(RobotCH_Upperarm);
[VolumeHumanUpperarm]=volume(HumanCH_Upperarm);

if detailsflag == 1;
    
disp('#### Upperarm ####');
disp('Intersection Volume:')
disp(VolumeIntersectionUpperarm);
disp('Union Volume:')
disp(VolumeUnionUpperarm);
disp('Robot Volume:')
disp(VolumeRobotUpperarm);
disp('Human Volume:')
disp(VolumeHumanUpperarm);

end
   
P.Upperarm=VolumeIntersectionUpperarm/VolumeUnionUpperarm;  

if detailsflag == 1;
    
disp('% for Upperarm:')
disp(P.Upperarm)

end

TF = strcmp(Cmessage,'ON');

if TF == 1;
        Fig1='Comparison Between Human and Robot Workspaces (Upperarm)';
        figure('Name',Fig1,'NumberTitle','off')
        plot(RobotCH_Upperarm);
        hold on
        plot(HumanCH_Upperarm,'K');
        view([-60 40]);
end

end




