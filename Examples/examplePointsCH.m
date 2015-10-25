% function examplePointsCH() 
% ----
% Tests points and convex hulls computation
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

function examplePointsCH()

% Set parameters
[p] = setParameters();

% Finger test model
[finger]=modelFingerTest(p);  

nr=finger{1}.n;
R=p.resolution;

[CH.Proxi,Points.Proxi] = ...
    plotFingerPositions ...
    (finger{1},0*pi/180*ones(1,nr),1:nr,nr-2,...
    [ones(1,nr-5) 1 R R 1 1],p.ch,p.notation);
[CH.Inter,Points.Inter] = ...
    plotFingerPositions ...
    (finger{1},0*pi/180*ones(1,nr),1:nr,nr-1,...
    [ones(1,nr-5) 1 R 1 R 1],p.ch,p.notation);
[CH.Distal,Points.Distal] = ...
    plotFingerPositions ...
    (finger{1},0*pi/180*ones(1,nr),1:nr,nr,...
    [ones(1,nr-5) 1 R 1 1 R],p.ch,p.notation);

Points.ProxiData=[];
Points.InterData=[];
Points.DistalData=[];

finger1=finger{1};
qd=[0 finger1.qlim(2,2) finger1.qlim(3,2) 0 0];

Ti=getFK(finger{1},[0 0 0 0 0],p.notation);

% Proximal
for i=1:length(Points.Proxi)-1
    Points.ProxiData=[Points.ProxiData;Ti{2}(1:3,4)';Points.Proxi(i,:);Points.Proxi(i+1,:)];
end

figure(1)
plot(finger{1},qd,'noname','nowrist','noshadow','nojaxes');
hold on
plot3(Points.ProxiData(:,1), ...
Points.ProxiData(:,2), ...
Points.ProxiData(:,3));
view([-146 24])

figure(2)
plot(finger{1},qd,'noname','nowrist','noshadow','nojaxes');
hold on
plot(CH.Proxi);
view([-146 24])

% Middle
for i=1:length(Points.Inter)-1
    Points.InterData= ...
        [Points.InterData;Ti{2}(1:3,4)';Points.Inter(i,:);Points.Inter(i+1,:)];
end

qd=[0 finger1.qlim(2,2) 0 finger1.qlim(4,2) 0];

figure(6)
plot(finger{1},qd,'noname','nowrist','noshadow','nojaxes');
hold on
plot3(Points.InterData(:,1), ...
Points.InterData(:,2), ...
Points.InterData(:,3));
view([-146 24])

figure(8)
plot(finger{1},qd,'noname','nowrist','noshadow','nojaxes');
hold on
plot(CH.Inter);
view([-146 24])

% Distal
for i=1:length(Points.Distal)-1
    Points.DistalData=[Points.DistalData;Ti{2}(1:3,4)';Points.Distal(i,:);Points.Distal(i+1,:)];
end

qd=[0 finger1.qlim(2,2) 0 0 finger1.qlim(5,2)];

figure(10)
plot(finger{1},qd,'noname','nowrist','noshadow','nojaxes');
hold on
plot3(Points.DistalData(:,1), ...
Points.DistalData(:,2), ...
Points.DistalData(:,3),'-x');
view([-146 24])

figure(12)
plot(finger{1},qd,'noname','nowrist','noshadow','nojaxes');
hold on
plot(CH.Distal);
view([-146 24])