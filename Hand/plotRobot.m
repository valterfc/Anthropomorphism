% function plotRobot(robot,q) 
% ----
% Faciliates plot of a robot hand model
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

function plotRobot(robot,q)

% Check parameters 

n = robot.n;

[r,c] = size(q);
if ((r ~= 1) || (c ~= n))
    error('q has wrong dimensions');
end

% Plot robot 

robot.plot(q);

axis([-15 15 -15 15 -15 15]);

grid off; % Choices are: on | off

xlabel('X');
ylabel('Y');
zlabel('Z');