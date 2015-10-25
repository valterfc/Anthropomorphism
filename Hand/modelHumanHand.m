% function [humanhand,humanfingers,humanpalm]=modelHumanHand(p) 
% ----
% Creates the model of the human hand
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

function [humanhand,humanfingers,humanpalm]=modelHumanHand(p)  

humanhand={};
humanfingers={};
humanpalm={};

% Human parametric model

[Fingers,Palm]=setParametricModel('Buchholz',p);

% Palm bones (metacarpal bones) angles 

IA=acosd(Fingers{1}.y/Fingers{1}.metacarpal);
MA=acosd(Fingers{2}.y/Fingers{2}.metacarpal);
RA=-acosd(Fingers{3}.y/Fingers{3}.metacarpal);
PA=-acosd(Fingers{4}.y/Fingers{4}.metacarpal);
TA=acosd(Fingers{5}.y/Fingers{5}.metacarpal);

% Finger base frames angles
   
TBFA=0;
IBFA=0;
MBFA=-3;
RBFA=-4;
PBFA=-8;

dh='standard';

% Whole fingers
    
% Index 
ibody(1)=Link([IA*pi/180 0 0 -pi/2 0 IA*pi/180],dh);
ibody(2)=Link([0 0 Fingers{1}.metacarpal pi/2 0 0],dh);
ibody(3)=Link([IBFA*pi/180 0 0 -pi/2 0 IBFA*pi/180],dh);
ibody(4)=Link([0 0 Fingers{1}.proximal 0 0 0],dh);
ibody(5)=Link([0 0 Fingers{1}.middle 0 0 0],dh);
ibody(6)=Link([0 0 Fingers{1}.distal 0 0 0],dh);

humanindex = SerialLink(ibody,'name','Human Index','qlim',...
    [-1*pi/180,0*pi/180; 0*pi/180,10*pi/180; -13*pi/180,42*pi/180;...
    0*pi/180,80*pi/180; 0*pi/180,100*pi/180; -10*pi/180,90*pi/180]);

% Middle 
mbody(1)=Link([MA*pi/180 0 0 -pi/2 0 MA*pi/180],dh);
mbody(2)=Link([0 0 Fingers{2}.metacarpal pi/2 0 0],dh);
mbody(3)=Link([MBFA*pi/180 0 0 -pi/2 0 MBFA*pi/180],dh);
mbody(4)=Link([0 0 Fingers{2}.proximal 0 0 0],dh);
mbody(5)=Link([0 0 Fingers{2}.middle 0 0 0],dh);
mbody(6)=Link([0 0 Fingers{2}.distal 0 0 0],dh);

humanmiddle = SerialLink(mbody,'name','Human Middle','qlim',...
    [0*pi/180,1*pi/180; 0*pi/180,1*pi/180; -13*pi/180,42*pi/180;...
    0*pi/180,80*pi/180; 0*pi/180,100*pi/180; -10*pi/180,90*pi/180]);

% Ring 
rbody(1)=Link([RA*pi/180 0 0 -pi/2 0 RA*pi/180],dh);
rbody(2)=Link([0 0 Fingers{3}.metacarpal pi/2 0 0],dh);
rbody(3)=Link([RBFA*pi/180 0 0 -pi/2 0 RBFA*pi/180],dh);
rbody(4)=Link([0 0 Fingers{3}.proximal 0 0 0],dh);
rbody(5)=Link([0 0 Fingers{3}.middle 0 0 0],dh);
rbody(6)=Link([0 0 Fingers{3}.distal 0 0 0],dh);

humanring = SerialLink(rbody,'name','Human Ring','qlim',...
    [-3.5*pi/180,3.5*pi/180; 0*pi/180,20*pi/180; -14*pi/180,20*pi/180;...
    0*pi/180,80*pi/180; 0*pi/180,100*pi/180; -20*pi/180,90*pi/180]);

% Pinky 
pbody(1)=Link([PA*pi/180 0 0 -pi/2 0 PA*pi/180],dh);
pbody(2)=Link([0 0 Fingers{4}.metacarpal pi/2 0 0],dh);
pbody(3)=Link([PBFA*pi/180 0 0 -pi/2 0 PBFA*pi/180],dh);
pbody(4)=Link([0 0 Fingers{4}.proximal 0 0 0],dh);
pbody(5)=Link([0 0 Fingers{4}.middle 0 0 0],dh);
pbody(6)=Link([0 0 Fingers{4}.distal 0 0 0],dh);

humanpinky = SerialLink(pbody,'name', ...
    'Human Pinky','qlim',...
    [-6.5*pi/180,6.5*pi/180; 0*pi/180, ...
    28*pi/180; -19*pi/180,33*pi/180;...
    0*pi/180,80*pi/180; 0*pi/180, ...
    100*pi/180; -30*pi/180,90*pi/180]);

% Thumb 
tbody(1)=Link([TA*pi/180 0 Palm.base -pi/2 0 TA*pi/180],dh);
tbody(2)=Link([0 0 Fingers{5}.metacarpal pi/2 0 0],dh);
tbody(3)=Link([TBFA*pi/180 0 0 -pi/2 0 TBFA*pi/180],dh);
tbody(4)=Link([0 0 Fingers{5}.proximal pi/2 0 0],dh);
tbody(5)=Link([0 0 Fingers{5}.distal -pi/2 0 0],dh);

humanthumb = SerialLink(tbody,'name', ...
    'Human Thumb','qlim',...
    [-30*pi/180,30*pi/180;-25*pi/180, ...
    35*pi/180;-60*pi/180,0*pi/180;...
    -15*pi/180,55*pi/180; ...
    -80*pi/180,15*pi/180]);

humanhand{1}=humanindex;
humanhand{2}=humanmiddle;
humanhand{3}=humanring;
humanhand{4}=humanpinky;
humanhand{5}=humanthumb;

% Fingers
    
% Index
ifinger(1)=Link([IBFA*pi/180 0 0 -pi/2 0 IBFA*pi/180],dh);
ifinger(2)=Link([0 0 Fingers{1}.proximal 0 0 0],dh);
ifinger(3)=Link([0 0 Fingers{1}.middle 0 0 0],dh);
ifinger(4)=Link([0 0 Fingers{1}.distal 0 0 0],dh);

indexfinger = SerialLink(ifinger,'name', ...
    'Human Index Finger','qlim',...
    [-13*pi/180,42*pi/180;0*pi/180, ...
    80*pi/180; 0*pi/180,100*pi/180; 
     -10*pi/180,90*pi/180]);

% Middle 
mfinger(1)=Link([MBFA*pi/180 0 0 -pi/2 0 MBFA*pi/180],dh);
mfinger(2)=Link([0 0 Fingers{2}.proximal 0 0 0],dh);
mfinger(3)=Link([0 0 Fingers{2}.middle 0 0 0],dh);
mfinger(4)=Link([0 0 Fingers{2}.distal 0 0 0],dh);

middlefinger = SerialLink(mfinger,'name', ...
    'Human Middle Finger','qlim',...
    [-13*pi/180,42*pi/180; 0*pi/180, ...
    80*pi/180; 0*pi/180,100*pi/180;...
     -10*pi/180,90*pi/180]);

% Ring 
rfinger(1)= ...
    Link([RBFA*pi/180 0 0 -pi/2 0  RBFA*pi/180],dh);
rfinger(2)=Link([0 0 Fingers{3}.proximal 0 0 0],dh);
rfinger(3)=Link([0 0 Fingers{3}.middle 0 0 0],dh);
rfinger(4)=Link([0 0 Fingers{3}.distal 0 0 0],dh);

ringfinger = SerialLink(rfinger,'name','Human Ring Finger','qlim',...
    [-14*pi/180,20*pi/180; 0*pi/180,80*pi/180; 0*pi/180,100*pi/180;-20*pi/180,90*pi/180]);

% Pinky 
pfinger(1)=Link([PBFA*pi/180 0 0 -pi/2 0 PBFA*pi/180],dh);
pfinger(2)=Link([0 0 Fingers{4}.proximal 0 0 0],dh);
pfinger(3)=Link([0 0 Fingers{4}.middle 0 0 0],dh);
pfinger(4)=Link([0 0 Fingers{4}.distal 0 0 0],dh);

pinkyfinger = SerialLink(pfinger,'name','Human Pinky Finger','qlim',...
    [-19*pi/180,33*pi/180; 0*pi/180,80*pi/180; 0*pi/180,100*pi/180;-30*pi/180,90*pi/180]);

% Thumb 
tfinger(1)=Link([0 0 Fingers{5}.metacarpal pi/2 0 0],dh);
tfinger(2)=Link([TBFA*pi/180 0 0 -pi/2 0 TBFA*pi/180],dh);
tfinger(3)=Link([0 0 Fingers{5}.proximal pi/2 0 0],dh);
tfinger(4)=Link([0 0 Fingers{5}.distal -pi/2 0 0],dh);

thumbfinger = SerialLink(tfinger,'name','Human Thumb Finger','qlim',...
    [-25*pi/180,35*pi/180;-60*pi/180,0*pi/180; -15*pi/180,55*pi/180;-80*pi/180,15*pi/180]);
 
humanfingers{1}=indexfinger;
humanfingers{2}=middlefinger;
humanfingers{3}=ringfinger;
humanfingers{4}=pinkyfinger;
humanfingers{5}=thumbfinger;

% Index base 
ibase(1)=Link([IA*pi/180 0 0 -pi/2 0 IA*pi/180],dh);
ibase(2)=Link([0 0 Fingers{1}.metacarpal pi/2 0 0],dh);

indexbase = SerialLink(ibase,'name','Human Index Base','qlim',...
    [-1*pi/180,0*pi/180; 0*pi/180,10*pi/180;]);

% Middle base
mbase(1)=Link( ...
    [MA*pi/180 0 0 -pi/2 0 MA*pi/180],dh);
mbase(2)=Link([0 0 Fingers{2}.metacarpal pi/2 0 0],dh);

middlebase = SerialLink(mbase,'name','Human Middle Base','qlim',...
    [0*pi/180,1*pi/180; 0*pi/180,1*pi/180;]);

% Ring base
rbase(1)=Link([RA*pi/180 0 0 -pi/2 0 RA*pi/180],dh);
rbase(2)=Link([0 0 Fingers{3}.metacarpal pi/2 0 0],dh);

ringbase=SerialLink(rbase,'name','Human Ring Base','qlim',...
    [-3.5*pi/180,3.5*pi/180; 0*pi/180,20*pi/180;]);

% Pinky base
pbase(1)=Link([PA*pi/180 0 0 -pi/2 0 PA*pi/180],dh);
pbase(2)=Link([0 0 Fingers{4}.metacarpal pi/2 0 0],dh);

pinkybase = SerialLink(pbase,'name','Human Pinky Base','qlim',...
    [-6.5*pi/180,6.5*pi/180; 0*pi/180,28*pi/180;]);

% Thumb base
tbase(1)=Link([TA*pi/180 0 Palm.base -pi/2 0 TA*pi/180],dh);
tbase(2)=Link([0 0 Fingers{5}.metacarpal pi/2 0 0],dh);
tbase(3)=Link([TBFA*pi/180 0 0 -pi/2 0 TBFA*pi/180],dh);

thumbbase = SerialLink(tbase,'name', ...
    'Human Thumb Base','qlim',...
    [-30*pi/180,30*pi/180; -25*pi/180,35*pi/180; ...
    -60*pi/180,0*pi/180]);

humanpalm{1}=indexbase;
humanpalm{2}=middlebase;
humanpalm{3}=ringbase;
humanpalm{4}=pinkybase;
humanpalm{5}=thumbbase;

end



