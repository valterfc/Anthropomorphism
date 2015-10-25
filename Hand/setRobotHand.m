% function [rhand,rfingers,rpalm]=setRobotHand(p)
% ----
% Sets active robot hand
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

function [rhand,rfingers,rpalm]=setRobotHand(p)

% Hypothetical robot hand
if strcmp(p.robothand,'Hypothetical');
    
    p.HL=p.hscale*p.HL;
    p.HB=p.hscale*p.HB;
    [rhand,rfingers,rpalm]=cloneHand(p);
    
% Barrett robot hand
elseif strcmp(p.robothand,'Barrett');
    
    [rhand,rfingers,rpalm]=modelBarrett();
    
% DLRHIT2 robot hand
elseif strcmp(p.robothand,'DLRHIT2');
    
    [rhand,rfingers,rpalm]=modelDLRHIT2();
    
% Shadow robot hand
elseif strcmp(p.robothand,'Shadow');
    
    [rhand,rfingers,rpalm]=modelShadow();
    
% OpenBionics robot hand
elseif strcmp(p.robothand,'OpenBionics');
    
    [rhand,rfingers,rpalm]=modelOpenBionics();
    
end