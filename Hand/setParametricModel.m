% function [Finger]=setParametricModel(study,p)
% ----
% Sets parametric model
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

function [Fingers,Palm]=setParametricModel(study,p)

Fingers{1}.name='Human Index';
Fingers{2}.name='Human Middle';
Fingers{3}.name='Human Ring';
Fingers{4}.name='Human Pinky';
Fingers{5}.name='Human Thumb';

if strcmp(study,'Buchholz')==1

Fingers{1}.proximal=0.245*p.HL; % Index
Fingers{1}.middle=0.143*p.HL;
Fingers{1}.distal=0.097*p.HL;
Fingers{1}.metacarpal=0.463*p.HL;

Fingers{2}.proximal=0.266*p.HL; % Middle 
Fingers{2}.middle=0.170*p.HL;
Fingers{2}.distal=0.108*p.HL;
Fingers{2}.metacarpal=0.446*p.HL;

Fingers{3}.proximal=0.244*p.HL; % Ring
Fingers{3}.middle=0.165*p.HL;
Fingers{3}.distal=0.107*p.HL;
Fingers{3}.metacarpal=0.421*p.HL;

Fingers{4}.proximal=0.204*p.HL; % Pinky
Fingers{4}.middle=0.117*p.HL;
Fingers{4}.distal=0.093*p.HL;
Fingers{4}.metacarpal=0.414*p.HL;

Fingers{5}.proximal=0.196*p.HL; % Thumb
Fingers{5}.distal=0.158*p.HL;
Fingers{5}.metacarpal=0.251*p.HL;
Fingers{5}.carpal=0.118*p.HL;
% Palm distances to metacarpal bones 

Palm.base = 0;

% Positions of finger base frames 

Fingers{1}.x = -0.251*p.HB;
Fingers{1}.y = 0.447*p.HL;

Fingers{2}.x = 0.0*p.HB;
Fingers{2}.y = 0.446*p.HL;

Fingers{3}.x =  0.206*p.HB;
Fingers{3}.y = 0.409*p.HL;

Fingers{4}.x = 0.402*p.HB;
Fingers{4}.y = 0.368*p.HL;

Fingers{5}.x = -0.196*p.HB;
Fingers{5}.y = 0.073*p.HL;

elseif strcmp(study,'Other')==1
    
Fingers{1}.proximal=0.15*p.HL; % Index
Fingers{1}.middle=0.15*p.HL;
Fingers{1}.distal=0.15*p.HL;
Fingers{1}.metacarpal=0.4*p.HL;

Fingers{2}.proximal=0.15*p.HL; % Middle 
Fingers{2}.middle=0.15*p.HL;
Fingers{2}.distal=0.15*p.HL;
Fingers{2}.metacarpal=0.4*p.HL;

Fingers{3}.proximal=0.15*p.HL; % Ring
Fingers{3}.middle=0.15*p.HL;
Fingers{3}.distal=0.15*p.HL;
Fingers{3}.metacarpal=0.4*p.HL;

Fingers{4}.proximal=0.15*p.HL; % Pinky
Fingers{4}.middle=0.15*HL;
Fingers{4}.distal=0.15*p.HL;
Fingers{4}.metacarpal=0.4*p.HL;

Fingers{5}.proximal=0.15*p.HL; % Thumb
Fingers{5}.distal=0.15*p.HL;
Fingers{5}.metacarpal=0.4*p.HL;

% Palm distances to metacarpal bones 

Palm.base = 0.15*p.HL;

% Positions of finger base frames 

Fingers{1}.x = -0.1*p.HB;
Fingers{1}.y = 0.4*p.HL;

Fingers{2}.x = 0.0*p.HB;
Fingers{2}.y = 0.4*p.HL;

Fingers{3}.x =  0.2*p.HB;
Fingers{3}.y = 0.4*p.HL;

Fingers{4}.x = 0.4*p.HB;
Fingers{4}.y = 0.4*p.HL;

Fingers{5}.x = -0.2*p.HB;
Fingers{5}.y = 0*p.HL;

end

