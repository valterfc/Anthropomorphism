% function [a,p]=getJointOrientations(a,p,i,robot,q,frame,notation)
% ----
% Gets joint orientations
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
 
function [a,p]=getJointOrientations(a,p,i,robot,q,frame,notation)

T = getFK(robot,q,notation);
Ta = T{frame};
rpya=tr2rpy(Ta)';
Tp = T{frame-1};
rpyp=tr2rpy(Tp)';
a.rpysets(i).values=[a.rpysets(i).values;rpya];
p.rpysets(i).values=[p.rpysets(i).values;rpyp];

end