% function [p,w]=setParameters()
% ----
% Sets the parameters of the study                                            
% p - Quantification parameters                                        
% w - Weights    
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

function [p,w]=setParameters()

% human anthropometry study
p.study='Buchholz'; % Options are: Buchholz | Pitarch

% number of fingers
p.nfingers=5;

% DH notation
p.notation='standard';

% robot hand
p.robothand='Hypothetical';

p.hscale=1.1; % Hypothetical robot hand scale

% hand mode
p.handmode='full'; % Options are: full | fingers 

% hand parameters
p.HL = 18.65; % (mean HL) 
p.HB = 8.45;  % (mean HB)

% plot settings
p.ch='OFF'; % Convex hulls plot: ON | OFF
p.details='OFF'; % Details: ON | OFF
p.compare='OFF'; % CH Compare: ON | OFF
p.resolution=10; 

% Alpha shapes settings
p.r_alpha=inf;

% save settings
p.savemat='OFF';

% weights
w.Proxi=1/3; w.Inter=1/3; w.Distal=1/3;
w.TProxi=1/2; w.TDistal=1/2;
w.BFO=0.5; w.BFP=0.5;

end

