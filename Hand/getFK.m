% function Ti=getFK(robot,q,notation) 
% ----
% Gets forward kinematics
% robot - robot object                                         
% q  - joint coordinates vector (1xn vector)                
% Ti - struct of transformation matrices   
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

function Ti=getFK(robot,q,notation)

% Load robot model 

n=robot.n;

% Solve forward kinematics 

DHMatrix=zeros(n,4);

for i=1:n
DHMatrix(i,:)= ...
    [q(i)+robot.links(i).theta robot.links(i).d ...
     robot.links(i).a robot.links(i).alpha];
end

for i=1:n
T{i}=dh2t(DHMatrix(i,:),notation);
end

for i=2:n
Ti{i}=eye(4,4);
end

Ti{1}=robot.base*T{1};

for i=2:n
    for k=2:i
    Ti{i}=Ti{i}*T{k};
    end
    Ti{i}=Ti{1}*Ti{i};
end