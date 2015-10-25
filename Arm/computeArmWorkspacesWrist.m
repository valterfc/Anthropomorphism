% function [P,CH]=computeArmWorkspacesWrist...
% (P,robot,human,CHmessage,Cmessage,resolution,Details,notation)
% ----
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

function [P,CH]=computeArmWorkspacesWrist...
    (P,robot,human,CHmessage,Cmessage,resolution,Details,notation)

R=resolution;
nr=robot.n;
nh=human.n;

 [RobotCH_Wrist] = ...
     getWorkspacePositions(robot,0*pi/180*ones(1,nr),1:nr,7,...
     [1 1 1 1 R R R],CHmessage,notation);

[HumanCH_Wrist] = ...
     getWorkspacePositions(human,0*pi/180*ones(1,nh),1:nh,7,...
     [1 1 1 1 R R R],CHmessage,notation);

Uoptions.useisconvex=0; 

IntersectionCH_Wrist = intersect(HumanCH_Wrist,RobotCH_Wrist);
UnionCH_Wrist = union([HumanCH_Wrist RobotCH_Wrist],Uoptions);

 if size(UnionCH_Wrist,2)==2
 UnionPoints1_Wrist = extreme(UnionCH_Wrist(1));
 UnionPoints2_Wrist = extreme(UnionCH_Wrist(2));
 UnionPoints_Wrist = [UnionPoints1_Wrist;UnionPoints2_Wrist];
 VolumeUnionWrist = volumeCH(UnionPoints_Wrist);
 else
 [VolumeUnionWrist]=volume(UnionCH_Wrist);
 end

CH.Wrist = UnionCH_Wrist;

detailsflag = strcmp(Details,'ON');

[VolumeIntersectionWrist]=volume(IntersectionCH_Wrist);
[VolumeRobotWrist]=volume(RobotCH_Wrist);
[VolumeHumanWrist]=volume(HumanCH_Wrist);

if detailsflag == 1;

disp('#### Wrist ####');
disp('Intersection Volume:')
disp(VolumeIntersectionWrist);
disp('Union Volume:')
disp(VolumeUnionWrist);
disp('Robot Volume:')
disp(VolumeRobotWrist);
disp('Human Volume:')
disp(VolumeHumanWrist);

end
   
P.Wrist=VolumeIntersectionWrist/VolumeUnionWrist;

if detailsflag == 1;
    
disp('% for Wrist:')
disp(P.Wrist)

end

TF = strcmp(Cmessage,'ON');

if TF == 1;
           
        Fig3='Comparison Between Human and Robot Workspaces (Wrist)';
        figure('Name',Fig3,'NumberTitle','off')
        plot(RobotCH_Wrist);
        hold on
        plot(HumanCH_Wrist,'K');
        view([-60 10]);
        axis equal tight
       
end

end




