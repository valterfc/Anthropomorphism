% function [a,p]=getJointPositions(a,p,i,l,robot,q,frame,notation)
% ----
% a - active joints info (struct)
% p - passive joints info (struct)
% i - number of joint
% l - number of iteration
% robot - robot structure
% q - joint angles vector
% frame - active frame (between 1 and n) 
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

function [a,p]=getJointPositions(a,p,i,l,robot,q,frame,notation)

T = fk(robot,q,notation);
Ta = T{frame};
xyza(1,:,i,l)=transl(Ta)';
Tp = T{frame-1};
xyzp(1,:,i,l)=transl(Tp)';
a.xyzsets(i).values=[a.xyzsets(i).values;xyza(1,:,i,l)];
p.xyzsets(i).values=[p.xyzsets(i).values;xyzp(1,:,i,l)];

end