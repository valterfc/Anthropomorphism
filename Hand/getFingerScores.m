% function [Data]=getFingerScores()
% ----
% Get hand scores 
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

function [Data]=getFingerScores()

% Comparison of finger base frames workspaces 

% Set parameters
[p,w] = setParameters();
 
% Human hand
[~,humanfingers]=modelHumanHand(p);  

% Robot hand
[~,robotfingers]=setRobotHand(p);

% Compute human and robot fingers workspaces
% without base frames offset
disp('---- Finger scores without base frames ----');
disp('Ready to Quantify Anthropomorphism!');
[Data]=getFingerPCH(robotfingers,humanfingers,p);

% Compute finger scores
[Data]=computeFingerScores(Data,w);

% Display scores
displayFingerScores(Data);

% Plot finger CH
plotFingerCH(robotfingers,humanfingers,Data,p);

end

