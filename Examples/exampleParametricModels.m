% function exampleParametricModels()
% ----
% Tests the parametric models
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

 function exampleParametricModels() 
 
 p.HL=input('Enter your hand length in cm:');
 p.HB=input('Enter your hand breadth in cm:');
 
 [Fingers,Palm] = setParametricModel('Buchholz',p);
 
  disp(' ');
 disp('#### Finger Links Lengths ####')
 disp(' ');
 disp('-- Index Finger --');
 disp('Proximal  |  Middle  |  Distal');
 disp([Fingers{1}.proximal Fingers{1}.middle Fingers{1}.distal]);
 disp('-- Middle Finger --');
 disp('Proximal  |  Middle  |  Distal');
 disp([Fingers{2}.proximal Fingers{2}.middle Fingers{2}.distal]);
 disp('-- Ring Finger --');
 disp('Proximal  |  Middle  |  Distal');
 disp([Fingers{3}.proximal Fingers{3}.middle Fingers{3}.distal]);
 disp('-- Pinky Finger --');
 disp('Proximal  |  Middle  |  Distal');
 disp([Fingers{4}.proximal Fingers{4}.middle Fingers{4}.distal]);
 disp('-- Thumb Finger --');
 disp('Proximal  |  Distal');
 disp([Fingers{5}.proximal Fingers{5}.distal]);
 disp(' ');
 disp('#### Finger Bases Positions ####')
 disp(' ');
 disp('--  Index  --');
 disp('        x           y');
 disp([Fingers{1}.x Fingers{1}.y])
 disp('--  Middle  --');
 disp('        x           y');
 disp([Fingers{2}.x Fingers{2}.y])
 disp('--  Ring  --');
 disp('        x           y');
 disp([Fingers{3}.x Fingers{3}.y])
 disp('--  Pinky  --');
 disp('        x           y');
 disp([Fingers{4}.x Fingers{4}.y])
 disp('--  Thumb  --');
 disp('        x           y');
 disp([Fingers{5}.x Fingers{5}.y])
 disp(' ');
 disp('#### Metacarpal Bones ####')
 disp(' ');
 disp('--  Carpo  --');
 disp([Palm.base]); 
 disp('-- Index  --');
 disp([Fingers{1}.metacarpal]); 
 disp('-- Middle  --');
 disp([Fingers{2}.metacarpal]); 
 disp('-- Ring  --');
 disp([Fingers{3}.metacarpal]); 
 disp('-- Pinky  --');
 disp([Fingers{4}.metacarpal]); 
 disp('-- Thumb  --');
 disp([Fingers{5}.metacarpal]); 
 
 end