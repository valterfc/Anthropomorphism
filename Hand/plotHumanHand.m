% function plotHumanHand(fig,q)
% ----
% Plots human hand model
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
                              
function plotHumanHand(fig,q)

% Load parameters

[p,w] = setParameters();

% Load human hand kinematics 

[humanhand,humanfingers,humanpalm]= ...
    modelHumanHand(p);

% Plot human hand with palm 

if(strcmp(fig.mode,'full')==1)
    
figure(fig.n)
humanhand{1}.plot(q(1:6));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanhand{2}.plot(q(7:12));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanhand{3}.plot(q(13:18));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanhand{4}.plot(q(19:24));%...,
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanhand{5}.plot(q(25:29));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
axis([-10 25 -15 15 -15 15]);
title('Whole human hand');

end

% Plot human hand fingers  

if(strcmp(fig.mode,'fingers')==1)
    
humanfingers{1}.base=humanpalm{1}.fkine([0,0]);
humanfingers{2}.base=humanpalm{2}.fkine([0,0]);
humanfingers{3}.base=humanpalm{3}.fkine([0,0]);
humanfingers{4}.base=humanpalm{4}.fkine([0,0]);
humanfingers{5}.base=humanpalm{5}.fkine([0,0,0]);
    
figure(fig.n)
humanfingers{1}.plot(q(1:4));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanfingers{2}.plot(q(5:8));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanfingers{3}.plot(q(9:12));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanfingers{4}.plot(q(13:16));%...,
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanfingers{5}.plot(q(17:20));%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
axis([-10 25 -15 15 -15 15]);
title('Human hand fingers');

end

% Plot human hand palm 

if(strcmp(fig.mode,'palm')==1)
    
figure(fig.n)
humanpalm{1}.plot([0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanpalm{2}.plot([0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanpalm{3}.plot([0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanpalm{4}.plot([0,0]);%...,
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
humanpalm{5}.plot([0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
axis([-10 25 -15 15 -15 15]);
title('Human hand palm');

end

