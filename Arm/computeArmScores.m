% function computeArmScores()      
% ----
% Computation of Anthropomorphism for robot arms (main function)
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

function computeArmScores()

clear all;
close all;
clc;

notation='modified';

% Human Arm
% Hand Anthropometry Study | Based on Human Height 
% US Citizens | Men: 176.3 cm | Women: 162.2 cm | 20 years old and over  

parameters.HH = ((176.3+162.2)/2);

sizemode='Normalized';
%sizemode='Actual';

[humanarm,humanlinks] = modelHumanArm(parameters,sizemode);  

disp('Human Links: ');disp(humanlinks);

% Robot Arm

%[robotarm,robotlinks] = modelMitsubishiPA10(sizemode);
%[robotarm,robotlinks] = modelSchunkLWA(sizemode);
[robotarm,robotlinks] = modelKUKALWR(sizemode);
%[robotarm,robotlinks] = modelBarrettWAM(sizemode);


% Hypothetical Robot Arm

% Hand Anthropometry Study | Based on Human Height 
% US Citizens | Men: 176.3 cm | Women: 162.2 cm | 20 years old and over  
% parameters.HH = ((176.3+162.2)/2)*1.1; %% Scaling factor for HRobot  
% [robotarm,robotlinks] = HumanArm(parameters,sizemode);
 
disp('Robot Links: ');disp(robotlinks);

% Plot Settings 

CHmessage='OFF'; % Convex Hulls Plot: ON | OFF
Cmessage='OFF'; % Comparison Plot: ON | OFF
Details='OFF'; % Details: ON | OFF
resolution=14; 

% Weights 

W.Upperarm=1/3;
W.Forearm=1/3;
W.Wrist=1/3;

disp('Ready to Quantify Anthropomorphism !!!');

detailsflag = strcmp(Details,'OFF');

tic;
P=[];

[P,CH] = computeArmWorkspacesUpperArm...
    (P,robotarm,humanarm,CHmessage,Cmessage,resolution,Details,notation);

[P,CH] = computeArmWorkspacesForearm...
    (P,robotarm,humanarm,CHmessage,Cmessage,resolution,Details,notation);

[P,CH] = computeArmWorkspacesWrist...
    (P,robotarm,humanarm,CHmessage,Cmessage,resolution,Details,notation);

if detailsflag==1
disp('Robots Ready ! Time:');
toc
end

% Total Score for Arm 

P.Arm=((W.Upperarm*P.Upperarm)+(W.Forearm*P.Forearm)+(W.Wrist*P.Wrist))/...
    (W.Upperarm + W.Forearm + W.Wrist); 

% Index Percentages 

disp('%%%%%%%%%%%%%%%%%%')
disp('%%%% ---- Final Scores ---- %%%%')
disp('%%%%%%%%%%%%%%%%%%')

disp('Percentage of HumanLikeness for Upperarm:')
disp(P.Upperarm)
disp('Percentage of HumanLikeness for Forearm:')
disp(P.Forearm)
disp('Percentage of HumanLikeness for Hand:')
disp(P.Wrist)

disp('Total Percentage of HumanLikeness for Robot Arm:')
disp(P.Arm)

P.Links=[0 P.Upperarm P.Forearm P.Wrist];
P.ArmWeighted=sum(P.Links.*robotlinks);

disp('Total Weighted Percentage of HumanLikeness for Robot Arm:')
disp(P.ArmWeighted)

disp('%%%%%%%%%%%%%%%%%%')

end

