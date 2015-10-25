% function scoresArm()
% ----
% Presents the results of the examined robot arms
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

function scoresArm()

disp('%%%%%%%%%%%%%%%%%%')
disp('%%%% ---- Final Scores ---- %%%%')
disp('%%%%%%%%%%%%%%%%%%')

w1=0.4;
w2=0.4;
w3=0.2;

disp('% for HRobot:')
HRobot=w1*74.91 + w2*71.92 + w3*29.83;
disp(HRobot)

disp('% for Normalized HRobot:')
HRobotN=w1*100 + w2*100 + w3*100;
disp(HRobotN)

disp('Upperarm:');
HU=(74.91+100)/2;
disp(HU);
disp('Forearm:');
HF=(71.92+100)/2;
disp(HF);
disp('Hand:');
HH=(29.83+100)/2;
disp(HH);

disp('Total:');
THRobot=(HRobot+HRobotN)/2;
disp(THRobot);

disp('%%%%%%%%%%%%%%%%%%')

disp('% for Mitsubishi:')
Mitsubishi=w1*25.02 + w2*11.69 + w3*0;
disp(Mitsubishi)

disp('% for Normalized Mitsubishi:')
MitsubishiN=w1*39.31 + w2*55.89 + w3*66.01;
disp(MitsubishiN)

disp('Upperarm:');
MU=(25.02+39.31)/2;
disp(MU);
disp('Forearm:');
MF=(11.69+55.89)/2;
disp(MF);
disp('Hand:');
MH=(0+66.01)/2;
disp(MH);

disp('Total:');
TMitsubishi=(Mitsubishi+MitsubishiN)/2;
disp(TMitsubishi);

disp('%%%%%%%%%%%%%%%%%%')

disp('% for Schunk:')
Schunk=w1*87.97 + w2*64.82 + w3*48.37;
disp(Schunk)

disp('% for Normalized Schunk:')
SchunkN=w1*93.81 + w2*79.59 + w3*84.95;
disp(SchunkN)

disp('Upperarm:');
SU=(87.97+93.81)/2;
disp(SU);
disp('Forearm:');
SF=(64.82+79.59)/2;
disp(SF);
disp('Hand:');
SH=(48.37+84.95)/2;
disp(SH);

disp('Total:');
TSchunk=(Schunk+SchunkN)/2;
disp(TSchunk);

disp('%%%%%%%%%%%%%%%%%%')

disp('% for Barrett:')
Barrett=w1*23.76 + w2*19.26 + w3*0;
disp(Barrett)

disp('% for Normalized Barrett:')
BarrettN=w1*55.01 + w2*56.47 + w3*73.57;
disp(BarrettN)

disp('Upperarm:');
BU=(23.76+55.01)/2;
disp(BU);
disp('Forearm:');
BF=(19.26+56.47)/2;
disp(BF);
disp('Hand:');
BH=(0+73.57)/2;
disp(BH);

disp('Total:');
TBarrett=(Barrett+BarrettN)/2;
disp(TBarrett);

disp('%%%%%%%%%%%%%%%%%%')

disp('% for KUKA:')
KUKA=w1*52.82 + w2*19.43 + w3*0;
disp(KUKA)

disp('% for Normalized KUKA:')
KUKAN=w1*80.08 + w2*55.55 + w3*44.86;
disp(KUKAN)

disp('Upperarm:');
KU=(52.82+80.08)/2;
disp(KU);
disp('Forearm:');
KF=(19.43+55.55)/2;
disp(KF);
disp('Hand:');
KH=(0+44.86)/2;
disp(KH);

disp('Total:');
TKUKA=(KUKA+KUKAN)/2;
disp(TKUKA);

end