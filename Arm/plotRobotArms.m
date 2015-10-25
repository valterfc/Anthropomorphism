% function plotRobotArms()
% ----
% 'workspace', W          size of robot 3D workspace, W = [xmn, xmx ymn ymx zmn zmx]
% 'delay', d              delay betwen frames for animation (s)
% 'cylinder', C           color for joint cylinders, C=[r g b]
% 'mag', scale            annotation scale factor
% 'perspective'|'ortho'   type of camera view
% 'raise'|'noraise'       controls autoraise of current figure on plot
% 'render'|'norender'     controls shaded rendering after drawing
% 'loop'|'noloop'         controls endless loop mode
% 'base'|'nobase'         controls display of base 'pedestal'
% 'wrist'|'nowrist'       controls display of wrist
% 'shadow'|'noshadow'     controls display of shadow
% 'name'|'noname'         display the robot's name
% 'xyz'|'noa'             wrist axis label
% 'jaxes'|'nojaxes'       control display of joint axes
% 'joints'|'nojoints'     controls display of joints
% function PlotRobotArms()
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

function plotRobotArms()

%% Human Arm

%% US Citizens | Men: 176.3 cm | Women: 162.2 cm | 20 years old and over  

parameters.HH = ((176.3+162.2)/2)*1.1; %% Scaling factor for HRobot 

sizemode='Actual';

mitsubishipa10 = modelMitsubishiPA10(sizemode);
schunklwa = modelSchunkLWA(sizemode);
kukalwr = modelKUKALWR(sizemode);
barrettwam = modelBarrettWAM(sizemode);

humanarm = modelHumanArm(parameters,sizemode);

sizemode='Normalized';

mitsubishipa10_n = modelMitsubishiPA10(sizemode);
schunklwa_n = modelSchunkLWA(sizemode);
kukalwr_n = modelKUKALWR(sizemode);
barrettwam_n = modelBarrettWAM(sizemode);

humanarm_n = modelHumanArm(parameters,sizemode);

%%%% Clone Robot Arms %%%%

mitsubishipa10new = SerialLink(mitsubishipa10,'name','Mitsubishi PA10 New');
schunklwanew = SerialLink(schunklwa,'name','Schunk LWA New');
kukalwrnew = SerialLink(kukalwr,'name','KUKA LWR New');
barrettwamnew = SerialLink(barrettwam,'name','Barrett Wam New');
humanarmnew = SerialLink(humanarm,'name','Human Arm New');

mitsubishipa10n = SerialLink(mitsubishipa10_n,'name','Mitsubishi PA10 New n');
schunklwan = SerialLink(schunklwa_n,'name','Schunk LWA New n');
kukalwrn = SerialLink(kukalwr_n,'name','KUKA LWR New n');
barrettwamn = SerialLink(barrettwam_n,'name','Barrett Wam New n');
humanarmn = SerialLink(humanarm_n,'name','Human Arm New n');

mitsubishipa10new_n = SerialLink(mitsubishipa10_n,'name','Mitsubishi PA10 n');
schunklwanew_n = SerialLink(schunklwa_n,'name','Schunk LWA n');
kukalwrnew_n = SerialLink(kukalwr_n,'name','KUKA LWR n');
barrettwamnew_n = SerialLink(barrettwam_n,'name','Barrett Wam n');
humanarmnew_n = SerialLink(humanarm_n,'name','Human Arm n');

mitsubishipa10.base=[1 0 0 -30; 0 1 0 0; 0 0 1 0; 0 0 0 1];
schunklwa.base=[1 0 0 -15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
kukalwr.base=[1 0 0 15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
barrettwam.base=[1 0 0 30; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% figure(1)
% humanarm.plot(pi/4*ones(1,7),'noshadow','noname','nobase','nowrist','nojaxes'); % Blue
% hold on
% mitsubishipa10.plot(pi/4*ones(1,7),'cylinder',[0 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Green
% hold on
% barrettwam.plot(pi/4*ones(1,7),'cylinder',[1 0 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Red
% hold on
% schunklwa.plot(pi/4*ones(1,7),'cylinder',[1 0 1],'noshadow','noname','nobase','nowrist','nojaxes'); % Magenta
% hold on
% kukalwr.plot(pi/4*ones(1,7),'cylinder',[1 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Yellow
% 
% mitsubishipa10n.base=[1 0 0 -0.30; 0 1 0 0; 0 0 1 0; 0 0 0 1];
% schunklwan.base=[1 0 0 -0.15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
% kukalwrn.base=[1 0 0 0.15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
% barrettwamn.base=[1 0 0 0.30; 0 1 0 0; 0 0 1 0; 0 0 0 1];
% 
% figure(2)
% humanarmn.plot(pi/4*ones(1,7),'noshadow','noname','nobase','nowrist','nojaxes'); % Blue
% hold on
% mitsubishipa10n.plot(pi/4*ones(1,7),'cylinder',[0 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Green
% hold on
% barrettwamn.plot(pi/4*ones(1,7),'cylinder',[1 0 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Red
% hold on
% schunklwan.plot(pi/4*ones(1,7),'cylinder',[1 0 1],'noshadow','noname','nobase','nowrist','nojaxes'); % Magenta
% hold on
% kukalwrn.plot(pi/4*ones(1,7),'cylinder',[1 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Yellow

mitsubishipa10new.base=[1 0 0 -30; 0 1 0 0; 0 0 1 0; 0 0 0 1];
schunklwanew.base=[1 0 0 -15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
kukalwrnew.base=[1 0 0 15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
barrettwamnew.base=[1 0 0 30; 0 1 0 0; 0 0 1 0; 0 0 0 1];

figure(1)
subplot(1,2,1)
humanarmnew.plot(0*ones(1,7),'noshadow','noname','nobase','nowrist','nojaxes'); % Blue
hold on
mitsubishipa10new.plot(0*ones(1,7),'cylinder',[0 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Green
hold on
barrettwamnew.plot(0*ones(1,7),'cylinder',[1 0 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Red
hold on
schunklwanew.plot(0*ones(1,7),'cylinder',[1 0 1],'noshadow','noname','nobase','nowrist','nojaxes'); % Magenta
hold on
kukalwrnew.plot(0*ones(1,7),'cylinder',[1 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Yellow
axis([-40 40 -50 50 -10 120]);
view([-24 12]);

mitsubishipa10new_n.base=[1 0 0 -0.30; 0 1 0 0; 0 0 1 0; 0 0 0 1];
schunklwanew_n.base=[1 0 0 -0.15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
kukalwrnew_n.base=[1 0 0 0.15; 0 1 0 0; 0 0 1 0; 0 0 0 1];
barrettwamnew_n.base=[1 0 0 0.30; 0 1 0 0; 0 0 1 0; 0 0 0 1];

subplot(1,2,2)
humanarmnew_n.plot(0*ones(1,7),'noshadow','noname','nobase','nowrist','nojaxes'); % Blue
hold on
mitsubishipa10new_n.plot(0*ones(1,7),'cylinder',[0 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Green
hold on
barrettwamnew_n.plot(0*ones(1,7),'cylinder',[1 0 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Red
hold on
schunklwanew_n.plot(0*ones(1,7),'cylinder',[1 0 1],'noshadow','noname','nobase','nowrist','nojaxes'); % Magenta
hold on
kukalwrnew_n.plot(0*ones(1,7),'cylinder',[1 1 0],'noshadow','noname','nobase','nowrist','nojaxes'); % Yellow
axis([-0.40 0.40 -0.50 0.50 -0.1 1.20]);
view([-24 12]);

end
