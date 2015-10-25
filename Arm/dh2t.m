% function T=dh2t(DH,notation)      
% ----
% DH - DH parameters                                        
% notation - DH notation                                          
% T - Transformation matrix between consecutive frames    
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

function T=dh2t(DH,notation)

th=DH(1);
d=DH(2);
a=DH(3);
alpha=DH(4);

if(strcmp(notation,'standard')==1)
    
    % Matrix for Standard DH Notation 
    
    T=[cos(th),-sin(th)*cos(alpha),sin(th)*sin(alpha),a*cos(th);
        sin(th),cos(th)*cos(alpha),-cos(th)*sin(alpha),a*sin(th);
        0,sin(alpha),cos(alpha),d;
        0,0,0,1];
    
elseif(strcmp(notation,'modified')==1)
    
    % Matrix for Modified DH Notation
    
    T=[cos(th),-sin(th),0,a;
        sin(th)*cos(alpha),cos(th)*cos(alpha),-sin(alpha),-sin(alpha)*d;
        sin(th)*sin(alpha),cos(th)*sin(alpha),cos(alpha),cos(alpha)*d;
        0,0,0,1];
    
end

end
