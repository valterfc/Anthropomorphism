% function [P,CH]=computeArmWorkspacesForearm...
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

function [P,CH]=computeArmWorkspacesForearm...
    (P,robot,human,CHmessage,Cmessage,resolution,Details,notation)

R=resolution;
nr=robot.n;
nh=human.n;

[RobotCH_Forearm] = ...
    getWorkspacePositions(robot,0*pi/180*ones(1,nr),1:nr,5,...
    [1 1 R R R 1 1],CHmessage,notation);

[HumanCH_Forearm] = ...
    getWorkspacePositions(human,0*pi/180*ones(1,nh),1:nh,5,...
    [1 1 R R R 1 1],CHmessage,notation);

Uoptions.useisconvex=0; 

IntersectionCH_Forearm = intersect(HumanCH_Forearm,RobotCH_Forearm);
UnionCH_Forearm = union([HumanCH_Forearm RobotCH_Forearm],Uoptions);

if size(UnionCH_Forearm,2)==2
UnionPoints1_Forearm = extreme(UnionCH_Forearm(1));
UnionPoints2_Forearm = extreme(UnionCH_Forearm(2));
UnionPoints_Forearm = [UnionPoints1_Forearm;UnionPoints2_Forearm];
VolumeUnionForearm = volumeCH(UnionPoints_Forearm);
else
[VolumeUnionForearm]=volume(UnionCH_Forearm);
end

CH.Forearm = UnionCH_Forearm;

detailsflag = strcmp(Details,'OFF');

[VolumeIntersectionForearm]=volume(IntersectionCH_Forearm);
[VolumeRobotForearm]=volume(RobotCH_Forearm);
[VolumeHumanForearm]=volume(HumanCH_Forearm);

if detailsflag == 1;

disp('#### Forearm ####');
disp('Intersection Volume:')
disp(VolumeIntersectionForearm);
disp('Union Volume:')
disp(VolumeUnionForearm);
disp('Robot Volume:')
disp(VolumeRobotForearm);
disp('Human Volume:')
disp(VolumeHumanForearm);

end

P.Forearm=VolumeIntersectionForearm/VolumeUnionForearm;

if detailsflag == 1;
    
disp('% for Forearm:')
disp(P.Forearm)

end

TF = strcmp(Cmessage,'ON');

if TF == 1;
        
        Fig2='Comparison Between Human and Robot Workspaces (Forearm)';
        figure('Name',Fig2,'NumberTitle','off')
        plot(RobotCH_Forearm);
        hold on
        plot(HumanCH_Forearm,'K');
        view([-80 40]);
        axis equal tight
       
end

end




