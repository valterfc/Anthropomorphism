% function [finger]=modelFingerTest(p) 
% ----
% Creates a finger test model
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

function [finger]=modelFingerTest()  

[p]=setParameters();

dh=p.notation;

proximal=4.2; %0.245*p.HL; % Index
middle=3.6; %0.143*p.HL;
distal=2.4; %0.097*p.HL;
      
% Human Finger (Index Parametric Model)
hfinger(1)=Link([0 0 0 0 0 0],dh);
hfinger(2)=Link([0 0 0 -pi/2 0 0],dh);
hfinger(3)=Link([0 0 proximal 0 0 0],dh);
hfinger(4)=Link([0 0 middle 0 0 0],dh);
hfinger(5)=Link([0 0 distal 0 0 0],dh);

finger{1} = SerialLink(hfinger,'name','Human Finger Test','qlim',...
    [0,0;-13*pi/180,42*pi/180;0*pi/180,80*pi/180; 0*pi/180,100*pi/180; -10*pi/180,90*pi/180]);
 
 % Robot Finger
rfinger(1)=Link([0 0 0 0 0 0],dh);
rfinger(2)=Link([0 0 0 -pi/2 0 0],dh);
rfinger(3)=Link([0 0 4 0 0 0],dh);
rfinger(4)=Link([0 0 4 0 0 0],dh);
rfinger(5)=Link([0 0 2 0 0 0],dh);

finger{2} = SerialLink(rfinger,'name','Robot Finger Test','qlim',...
    [0,0;-13*pi/180,42*pi/180;0*pi/180,80*pi/180; 
     0*pi/180,80*pi/180;0*pi/180,80*pi/180]);

end



