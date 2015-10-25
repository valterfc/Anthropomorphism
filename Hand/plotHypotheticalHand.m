% function plotHypotheticalHand(fig)
% ----
% Plots hypothetical robot model
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

function plotHypotheticalHand(fig)

% Load parameters

[p,w] = setParameters();

p.HL=1.1*p.HL;
p.HB=1.1*p.HB;

% Load human hand kinematics 

[robothand,robotfingers,robotpalm]= ...
    cloneHand(p);

% Plot human hand with palm  
    
if(strcmp(fig.mode,'full')==1)
    
figure(fig.n)
robothand{1}.plot([0,0,0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robothand{2}.plot([0,0,0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robothand{3}.plot([0,0,0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robothand{4}.plot([0,0,0,0,0,0]);%...,
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robothand{5}.plot([0,0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
axis([-10 25 -15 15 -15 15]);
title('Whole Human Hand');

end

% Plot human hand fingers  

if(strcmp(fig.mode,'fingers')==1)
    
robotfingers{1}.base=robotpalm{1}.fkine([0,0]);
robotfingers{2}.base=robotpalm{2}.fkine([0,0]);
robotfingers{3}.base=robotpalm{3}.fkine([0,0]);
robotfingers{4}.base=robotpalm{4}.fkine([0,0]);
robotfingers{5}.base=robotpalm{5}.fkine([0,0,0]);

figure(fig.n)
robotfingers{1}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotfingers{2}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotfingers{3}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotfingers{4}.plot([0,0,0,0]);%...,
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotfingers{5}.plot([0,0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
axis([-10 25 -15 15 -15 15]);
title('Human Hand Fingers');

end

% Plot human hand palm 

if(strcmp(fig.mode,'palm')==1)
    
figure(fig.n)
robotpalm{1}.plot([0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotpalm{2}.plot([0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotpalm{3}.plot([0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotpalm{4}.plot([0,0]);%...,
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
hold on
robotpalm{5}.plot([0,0,0]);%,...
%'cylinder',[0 0 1],...
%'noshadow','noname','nobase','nowrist','nojaxes')
axis([-10 25 -15 15 -15 15]);
title('Human Hand Palm');

end

