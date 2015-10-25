% function plotFingerCH(robot,human,Data,p)
% ----
% Plots finger CH
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

function plotFingerCH(robot,human,Data,p)

CHIndex=[Data.CHI.Proxi Data.CHI.Inter ...
    Data.CHI.Distal];
CHMiddle=[Data.CHM.Proxi Data.CHM.Inter ...
    Data.CHM.Distal];
CHRing=[Data.CHR.Proxi Data.CHR.Inter ...
    Data.CHR.Distal];
CHPinky=[Data.CHP.Proxi Data.CHP.Inter ...
    Data.CHP.Distal];
CHThumb=[Data.CHT.Proxi Data.CHT.Distal]; 

if strcmp(p.ch,'ON')==1;
figure(1); plot(CHIndex);
figure(2); plot(CHMiddle);
figure(3); plot(CHRing);
figure(4); plot(CHPinky);
figure(5); plot(CHThumb);
end

if strcmp(p.ch,'ON')==1;
plot([CHIndex CHMiddle CHRing ...
       CHPinky CHThumb]);
end

end