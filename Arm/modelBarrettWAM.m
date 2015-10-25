% function [barrettwam,links]=modelBarrettWAM(sizemode)
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

function [barrettwam,links]=modelBarrettWAM(sizemode)

% Barrett WAM Kinematics 

%% US Citizens | Men: 176.3 cm | Women: 162.2 cm | 20 years old and over  
HH=((176.3+162.2)/2); %% Human Height

sm = strcmp(sizemode,'Actual');

if(sm==0)
l1=0; %% 31
l2=55;
l3=30;
l4=6+0.108*HH;

lt=(l1+l2+l3+l4);
l1=l1/lt; l2=l2/lt; l3=l3/lt; l4=l4/lt;
else
l1=0; l2=55; l3=30; l4=6+0.108*HH;
end

links=[l1 l2 l3 l4];

%##################################################%
%%%%           theta  d      a   alpha          %%%% 
RL(1) = Link([ 0      l1     0   0    ],'modified');
RL(2) = Link([ 0      0      0  -pi/2 ],'modified');
RL(3) = Link([ 0      l2     0   pi/2 ],'modified'); 
RL(4) = Link([ 0.045  0      0  -pi/2 ],'modified');
RL(5) = Link([ -0.045 l3     0   pi/2 ],'modified');
RL(6) = Link([ 0      0      0  -pi/2 ],'modified');
RL(7) = Link([ 0      l4     0   pi/2 ],'modified');

% barrettwam = SerialLink(RL,'name','WAM','qlim',...
%                         [-150*pi/180,150*pi/180;-113*pi/180,113*pi/180;... 
%                           -157*pi/180,157*pi/180;-50*pi/180,180*pi/180;... 
%                           -273*pi/180,71*pi/180; -90*pi/180,90*pi/180;...
%                           -172*pi/180,172*pi/180]);
                       
barrettwam = SerialLink(RL,'name','WAM','qlim', ...
                          [-61*pi/180,150*pi/180; -48*pi/180,113*pi/180;... 
                           -97*pi/180,34*pi/180;  0*pi/180,142*pi/180;... 
                           -77*pi/180,71*pi/180; -90*pi/180,90*pi/180; ...
                           -90*pi/180,90*pi/180]);
                       
% humanarm = SerialLink(HL,'name','Human Arm','qlim',...
%                      [-61*pi/180,188*pi/180; -48*pi/180,134*pi/180;... 
%                       -97*pi/180,34*pi/180;    0*pi/180,142*pi/180;...
%                       -77*pi/180,133*pi/180; -90*pi/180,90*pi/180;...
%                       -90*pi/180,90*pi/180]);

%%%%%%%%% Joint Limits %%%%%%%%% 
%% J	  (+deg)	  (-deg)
%% 1	2.6  (150)	-2.6  (-150)
%% 2	2.0  (113)	-2.0  (-113)
%% 3	2.8  (157)	-2.8  (-157)
%% 4	3.1  (180)	-0.9  (-50)
%% 5	1.24 (71)	-4.76 (-273)
%% 6	1.6  (90)	-1.6  (-90)
%% 7	3.0  (172)	-3.0  (-172)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end