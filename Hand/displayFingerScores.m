% function displayFingerScores(Data)
% ----
% Displays finger scores
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

function displayFingerScores(Data)

disp('%%%%%%%%%%%%%%')
disp('%% ---- Final Scores ---- %%')
disp('%%%%%%%%%%%%%%')

% Index percentages
disp('(%) of humanlikeness for index proximal:');
disp(Data.PI.Proxi)
disp('(%) of humanlikeness for index intermediate:');
disp(Data.PI.Inter)
disp('(%) of humanlikeness for index distal:');
disp(Data.PI.Distal)
disp('Total (%) of humanlikeness for index:');
disp(Data.PI.Finger)
disp('%%%%');

% Middle percentages 
disp('(%) of humanlikeness for middle proxi:');
disp(Data.PM.Proxi);
disp('(%) of humanlikeness for middle inter:');
disp(Data.PM.Inter);
disp('(%) of humanlikeness for middle distal:');
disp(Data.PM.Distal);
disp('Total (%) of humanlikeness for middle:');
disp(Data.PM.Finger);
disp('%%%%');

% Ring percentages 
disp('(%) of humanlikeness for ring proxi:');
disp(Data.PR.Proxi);
disp('(%) of humanlikeness for ring inter:');
disp(Data.PR.Inter);
disp('(%) of humanlikeness for ring distal:');
disp(Data.PR.Distal);
disp('Total (%) of humanlikeness for ring:');
disp(Data.PR.Finger);
disp('%%%%');

% Pinky percentages 
disp('(%) of humanlikeness for pinky proxi:');
disp(Data.PP.Proxi);
disp('(%) of humanlikeness for pinky inter:');
disp(Data.PP.Inter);
disp('(%) of humanlikeness for pinky distal:');
disp(Data.PP.Distal);
disp('Total (%) of humanlikeness for pinky:');
disp(Data.PP.Finger);
disp('%%%%');

% Thumb percentages 
disp('(%) of humanlikeness for thumb proxi:');
disp(Data.PT.Proxi);
disp('(%) of humanlikeness for thumb distal:');
disp(Data.PT.Distal);
disp('Total (%) of humanlikeness for thumb:');
disp(Data.PT.Finger);
disp('%%%%');

end