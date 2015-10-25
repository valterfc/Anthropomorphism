% function [RobotCH,Points]=getWorkspacePositions
% (robot,qz,qindex,frame,resolution,CHmessage,notation)
% ----
% robot - robot object
% qz - joint coordinate vector zero pose (1xn vector)
% qindex - index (1xn vector) for the n joint variables to be varied
%              in the plot, e.g. [1 2 3].
% frame - frame whos origin will be ploted. Number between 1 and n.
% resolution - resolution (1xn vector) of the joint space.
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

function [RobotCH,Points]=getWorkspacePositions...
    (robot,qz,qindex,frame,resolution,CHmessage,notation)

% Check Parameters 

n = robot.n;

% q 

[r,c] = size(qz);
if ((r ~= 1) || (c ~= n))
    error('q has wrong dimensions');
end

% frame 

if ((frame < 1) || (frame > n))
    error(['frame is not a number between 1 and ' num2str(n)]);
end

q=qz;

% Get limits 

for i=1:n
    qlim(i,:) = robot.links(qindex(i)).qlim;
end

% Create the qa and qb vectors 

for i=1:n
    if (resolution(i) == 1)
        qr(i).values = q(qindex(i));
    else
        qr(i).values = qlim(i,1):((qlim(i,2)-qlim(i,1))/...
            (resolution(i)-1)):qlim(i,2);
    end
end

% Compute Workspace Points 

[a,p,q] = getFramePositions(robot,q,qindex,qr,frame,resolution,notation);

% Remove Zeros 

ind2remove = (a.RobotPoints(:,1) == 0);
a.RobotPoints(ind2remove,:) = [];

ind2remove = (a.RobotPoints(:,1) == 0);
p.RobotPoints(ind2remove,:) = [];

% Include Previous Frame 

if frame==2
    a.RobotPoints=[a.RobotPoints;p.RobotPoints;[0 0 0]];
else
    a.RobotPoints=[a.RobotPoints;p.RobotPoints;]; 
end

a.RobotPoints=unique(a.RobotPoints,'rows');

Points=a.RobotPoints;

% Compute Robot Convex Hull 

[RobotCH] = polytope(a.RobotPoints);

% Plot robot 

TF = strcmp(CHmessage,'ON');

if TF == 1;
    
    Fig1=['Robot Name:' num2str(robot.name) ' Points'];
    figure('Name',Fig1,'NumberTitle','off')
    robot.plot(q,'cylinder',[1 0 0],'noshadow','noname','nobase','nowrist','nojaxes');  
    hold on
    plot3(a.RobotPoints(:,1),a.RobotPoints(:,2),a.RobotPoints(:,3),'-x');
    view([-80 40]);
    axis equal tight;
    
    newrobot = SerialLink(robot,'name','new robot');
    
    Fig2=['Robot Name:' num2str(robot.name) ' Convex Hull'];
    figure('Name',Fig2,'NumberTitle','off')
    plot(RobotCH);
    hold on
    newrobot.plot(q,'cylinder',[0 0 1],'noshadow','noname','nobase','nowrist','nojaxes');
    view([-80 40]);
    axis equal tight;
    
end

end