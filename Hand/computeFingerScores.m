% function [Data]=computeFingerScores(Data,w)
% ----
% Computes finger scores
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

function [Data]=computeFingerScores(Data,w)

Data.PI.Finger=((w.Proxi*Data.PI.Proxi)...
    +(w.Inter*Data.PI.Inter)+ ...
    (w.Distal*Data.PI.Distal))/...
    (w.Proxi + w.Inter + w.Distal); 

Data.PM.Finger=((w.Proxi*Data.PM.Proxi)...
    +(w.Inter*Data.PM.Inter)+ ...
    (w.Distal*Data.PM.Distal))/...
    (w.Proxi + w.Inter + w.Distal); 

Data.PR.Finger=((w.Proxi*Data.PR.Proxi)...
    +(w.Inter*Data.PR.Inter)+ ...
    (w.Distal*Data.PR.Distal))/...
    (w.Proxi + w.Inter + w.Distal); 

Data.PP.Finger=((w.Proxi*Data.PP.Proxi)...
    +(w.Inter*Data.PP.Inter)+ ...
    (w.Distal*Data.PP.Distal))/...
    (w.Proxi + w.Inter + w.Distal); 

Data.PT.Finger=((w.TProxi*Data.PT.Proxi)...
    +(w.TDistal*Data.PT.Distal))/...
    (w.TProxi + w.TDistal); 

end