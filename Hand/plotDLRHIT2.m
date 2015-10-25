% function plotDLRHIT2(fig)
% ----
% Plots DLR/HIT II robot hand model
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

function plotDLRHIT2(fig)

[rhand,rbases]=modelDLRHIT2();  

figure(fig.n)
rhand{1}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
rhand{2}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
rhand{3}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
rhand{4}.plot([0,0,0,0]);%...,
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
rhand{5}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
axis([-10 25 -15 15 -15 15]);
title('DLR/HIT II hand');

end

