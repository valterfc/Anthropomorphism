% function [volume]=computeVolumeIntegrals(robot,frame)
% ----
% Computes the volume with triple integals
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

function [V]=computeVolumeIntegrals(robot,frame)

n=robot.n;
linklengths=zeros(n,1);
R=zeros(n,1);

for i=1:n
    linklengths(i)=robot.links(i).a;
end

for i=1:n
    R(i)=sum(linklengths(1:i));
end

abd_angle=sum(abs(robot.qlim(2,:)));
flex_angle=sum(abs(robot.qlim(frame,:)));
scale1=abd_angle/(2*pi);
scale2=flex_angle/(2*pi);

if frame==3
f=@(theta,phi,r) (r.^2).*sin(theta);
V=integral3(f,0,pi,0,2*pi,0,robot.links(frame).a);
V=2*scale1*scale2*V;
else
f=@(theta,phi,r) r.*(R(frame-1)+r.*cos(theta));
V=integral3(f,0,2*pi,0,2*pi,0,robot.links(frame).a);
V=scale1*scale2*V;
end

end

