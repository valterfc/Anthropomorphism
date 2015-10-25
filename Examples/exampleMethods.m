% function exampleMethods() 
% ----
% Tests computational geometry methods
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

function exampleMethods()

clear all; 
close all;
clc;

c=clock;

% Notation
p.notation='standard';
% Human hand length
p.HL=18.6; %cm
% Plot 3D models
p.flag3Dmodels='ON';

% Test finger model
[finger]=modelFingerTest();  

% Number of links
nr=finger{1}.n;

% Plot CH
p.ch='OFF';
% Resolution
p.resolution=8;
R=p.resolution;

% Save file
fid = fopen(sprintf('testMethodsResultsY%dM%dD%dH%d%d.txt',c(1:5)), 'a+');

[HCH.Proxi,HPoints.Proxi]=plotFingerPositions(finger{1},0*pi/180*ones(1,nr),1:nr,nr-2,[ones(1,nr-4) R R 1 1],p.ch,p.notation);
[HCH.Middle,HPoints.Middle]=plotFingerPositions(finger{1},0*pi/180*ones(1,nr),1:nr,nr-1,[ones(1,nr-4) R 1 R 1],p.ch,p.notation);
[HCH.Distal,HPoints.Distal]=plotFingerPositions(finger{1},0*pi/180*ones(1,nr),1:nr,nr,[ones(1,nr-4) R 1 1 R],p.ch,p.notation);

[RCH.Proxi,RPoints.Proxi]=plotFingerPositions(finger{2},0*pi/180*ones(1,nr),1:nr,nr-2,[ones(1,nr-4) R R 1 1],p.ch,p.notation);
[RCH.Middle,RPoints.Middle]=plotFingerPositions(finger{2},0*pi/180*ones(1,nr),1:nr,nr-1,[ones(1,nr-4) R 1 R 1],p.ch,p.notation);
[RCH.Distal,RPoints.Distal]=plotFingerPositions(finger{2},0*pi/180*ones(1,nr),1:nr,nr,[ones(1,nr-4) R 1 1 R],p.ch,p.notation);
    
scoreCHP=volume(intersect(HCH.Proxi,RCH.Proxi))/volume(union(HCH.Proxi,RCH.Proxi));
Alpha_I.P=extreme(intersect(HCH.Proxi,RCH.Proxi));
Alpha_U.P=extreme(union(HCH.Proxi,RCH.Proxi));
scoreAlphaP=alphavol(Alpha_I.P,2.12)/alphavol(Alpha_U.P,2.12);

scoreCHM=volume(intersect(HCH.Middle,RCH.Middle))/volume(union(HCH.Middle,RCH.Middle));
Alpha_I.M=extreme(intersect(HCH.Middle,RCH.Middle));
Alpha_U.M=extreme(union(HCH.Middle,RCH.Middle));
scoreAlphaM=alphavol(Alpha_I.M,2.9)/alphavol(Alpha_U.M,2.9);

scoreCHD=volume(intersect(HCH.Distal,RCH.Distal))/volume(union(HCH.Distal,RCH.Distal));
Alpha_I.D=extreme(intersect(HCH.Distal,RCH.Distal));
Alpha_U.D=extreme(union(HCH.Distal,RCH.Distal));
scoreAlphaD=alphavol(Alpha_I.D,2.01)/alphavol(Alpha_U.D,2.01);

fprintf(fid, '-- #### Comparison of Volume Computation Methods ### --\n\n');
fprintf(fid, '-- Scores Proximal --\n');
fprintf(fid, 'CH: %.10f | Alpha: %.10f \n\n',scoreCHP,scoreAlphaP);

fprintf(fid, '-- Scores Middle --\n');
fprintf(fid, 'CH: %.10f | Alpha: %.10f \n\n',scoreCHM,scoreAlphaM);

fprintf(fid, '-- Scores Distal --\n');
fprintf(fid, 'CH: %.10f | Alpha: %.10f \n\n',scoreCHD,scoreAlphaD);

fclose(fid);

end
