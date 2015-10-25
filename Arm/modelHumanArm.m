% function [humanarm,links]=modelHumanArm(parameters,sizemode)
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

function [humanarm,links]=modelHumanArm(parameters,sizemode)

%%%% Human Arm Kinematics %%%%

%%%% Human Anthropometry %%%%

HH = parameters.HH; %% Human Height 

%%%% Human Arm Anthropometry Study %%%%

sm = strcmp(sizemode,'Actual');

if(sm==0)
    
%% Winter | BIOMECHANICS AND MOTOR CONTROL OF HUMAN MOVEMENT
a.base=0; %% 0.129*HH
a.upperarm=0.186*HH; 
a.forearm=0.146*HH; 
a.hand=0.108*HH; 

lt=(a.base+a.upperarm+a.forearm+a.hand);

l1=a.base/lt; 
l2=a.upperarm/lt; 
l3=a.forearm/lt; 
l4=a.hand/lt;

else
    
l1=0; 
l2=0.186*HH; 
l3=0.146*HH; 
l4=0.108*HH; 

end

links=[l1 l2 l3 l4];

%################################################%
%%%%           theta  d   a   alpha           %%%%
HL(1) = Link([ 0      l1  0   0    ], 'modified');
HL(2) = Link([ 0      0   0  -pi/2 ], 'modified');
HL(3) = Link([ 0      l2  0   pi/2 ], 'modified');
HL(4) = Link([ 0      0   0  -pi/2 ], 'modified');
HL(5) = Link([ 0      l3  0   pi/2 ], 'modified');
HL(6) = Link([ 0      0   0  -pi/2 ], 'modified');
HL(7) = Link([ 0      l4  0   pi/2 ], 'modified');

humanarm = SerialLink(HL,'name','Human Arm','qlim',...
                     [-61*pi/180,188*pi/180; -48*pi/180,134*pi/180;... 
                      -97*pi/180,34*pi/180;    0*pi/180,142*pi/180;...
                      -77*pi/180,133*pi/180; -90*pi/180,90*pi/180;...
                      -90*pi/180,90*pi/180]);
            
             
%%%%%%%% DH & Joint Limits %%%%%%%%                          
%% i alpha a   d     theta  ll  ul
%% 0 0     0   90    0     -50  180
%% 1 0    -90  0    -90    -30  180
%% 2 0     90  0.27 -90    -110 80
%% 3 0    -90  0     0      0   145
%% 4 0     90  0.22  0     -85  90
%% 5 0    -90  0     90    -45  15
%% 6 0     90  0     90    -85  85
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
