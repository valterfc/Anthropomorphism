% function [Data]=getFingerPCH(robot,human,p)
% ----
% Gets finger percentages and CH
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

function [Data]=getFingerPCH(robot,human,p)

if p.nfingers==5
tic;
[PT,CHT] = getThumbWorkspaces...
    (robot{5},human{5},p);
if strcmp(p.details,'ON')==1
disp('Thumb Ready ! Time:');
toc
end
end

tic;
[PI,CHI] = getFingerWorkspaces...
    (robot{1},human{1},p);
if strcmp(p.details,'ON')==1
disp('Index Ready ! Time:');
toc
end

tic;
[PM,CHM] = getFingerWorkspaces...
    (robot{2},human{2},p);
if strcmp(p.details,'ON')==1
disp('Middle Ready ! Time:');
toc
end

tic;
[PR,CHR] = getFingerWorkspaces...
    (robot{3},human{3},p);
if strcmp(p.details,'ON')==1
disp('Ring Ready ! Time:');
toc
end

if p.nfingers==4 || p.nfingers==5
tic;
[PP,CHP] = getFingerWorkspaces...
    (robot{4},human{4},p);
if strcmp(p.details,'ON')==1
disp('Pinky Ready ! Time:');
toc
end
end

Data.PT=PT;
Data.PI=PI;
Data.PM=PM;
Data.PR=PR;
Data.PP=PP;

Data.CHT=CHT;
Data.CHI=CHI;
Data.CHM=CHM;
Data.CHR=CHR;
Data.CHP=CHP;

end
