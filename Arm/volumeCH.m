% function [Volume,Area]=volumeCH(X)
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

function [Volume,Area]=volumeCH(X)

[K,Volume]=convhulln(X);

Area = sum(sqrt(sum(( ...
 [X(K(:,1),2).*X(K(:,2),3) - X(K(:,1),3).*X(K(:,2),2) ...
  X(K(:,1),3).*X(K(:,2),1) - X(K(:,1),1).*X(K(:,2),3)  ...
  X(K(:,1),1).*X(K(:,2),2) - X(K(:,1),2).*X(K(:,2),1)] + ...
 [X(K(:,2),2).*X(K(:,3),3) - X(K(:,2),3).*X(K(:,3),2) ...
  X(K(:,2),3).*X(K(:,3),1) - X(K(:,2),1).*X(K(:,3),3)  ...
  X(K(:,2),1).*X(K(:,3),2) - X(K(:,2),2).*X(K(:,3),1)] + ...
 [X(K(:,3),2).*X(K(:,1),3) - X(K(:,3),3).*X(K(:,1),2) ...
  X(K(:,3),3).*X(K(:,1),1) - X(K(:,3),1).*X(K(:,1),3)  ...
  X(K(:,3),1).*X(K(:,1),2) - X(K(:,3),2).*X(K(:,1),1)]).^2,2)))/2;
