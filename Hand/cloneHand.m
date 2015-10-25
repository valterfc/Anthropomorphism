% function [newhand,newfingers,newpalm]=cloneHand(p)
% ----
% Clones a hand model
% p - Quantification parameters   
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

function [newhand,newfingers,newpalm]=cloneHand(p)

newhand={};
newfingers={};
newpalm={};

% Create human hand 

[humanhand,humanfingers,humanpalm]= ...
    modelHumanHand(p); 

% Clone human hand

newhand{1}=SerialLink...
    (humanhand{1},'name','Robot Index');
newhand{2}=SerialLink...
    (humanhand{2},'name','Robot Middle');
newhand{3}=SerialLink...
    (humanhand{3},'name','Robot Ring');
newhand{4}=SerialLink...
    (humanhand{4},'name','Robot Pinky');
newhand{5}=SerialLink...
    (humanhand{5},'name','Robot Thumb');

newfingers{1}=SerialLink...
    (humanfingers{1},'name','Robot Index Finger');
newfingers{2}=SerialLink...
    (humanfingers{2},'name','Robot Middle Finger');
newfingers{3}=SerialLink...
    (humanfingers{3},'name','Robot Ring Finger');
newfingers{4}=SerialLink...
    (humanfingers{4},'name','Robot Pinky Finger');
newfingers{5}=SerialLink...
    (humanfingers{5},'name','Robot Thumb Finger');

newpalm{1}=SerialLink...
    (humanpalm{1},'name','Robot Index Palm');
newpalm{2}=SerialLink...
    (humanpalm{2},'name','Robot Middle Palm');
newpalm{3}=SerialLink...
    (humanpalm{3},'name','Robot Ring Palm');
newpalm{4}=SerialLink...
    (humanpalm{4},'name','Robot Pinky Palm');
newpalm{5}=SerialLink...
    (humanpalm{5},'name','Robot Thumb Palm');

end

