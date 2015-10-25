% function [Orientations]=plotBasesOrientations...
% (robot,qz,qindex,frame,resolution,notation)
% ----
% robot - robot object                                         
% qz - joint coordinate vector zero pose (1xn vector)        
% qindex - index (1xn vector) for the n joint variables to be varied in the plot, e.g. [1 2 3].                                         
% frame - frame whos origin will be ploted. Number between 1 and n.                              
% resolution - resolution (1xn vector) of the joint space.     
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

function [Orientations]=plotBasesOrientations...
    (robot,qz,qindex,frame,resolution,notation)

  % Check parameters 
  n = robot.n;  
    
  % q 
  [r,c] = size(qz);
  if ((r ~= 1) || (c ~= n))
    error('q has wrong dimensions');
  end
   
  % frame 
  
  if ((frame < 1) || (frame > n))
    error(['frame is a number from 1 to ' num2str(n)]);
  end
  
  q=qz;
  
  % Get limits 
  for i=1:n  
  qlim(i,:) = robot.links(qindex(i)).qlim;
  end
  
  % Create the qa and qb vectors 
  for i=1:n
  if (resolution(i) == 1)
    qr(i).values = q(qindex(i));
  else
    qr(i).values = qlim(i,1):((qlim(i,2)-qlim(i,1))/...
        (resolution(i)-1)):qlim(i,2);
  end
  end

 % Compute workspace orientations
 [a,p] = getFrameOrientations ...
     (robot,q,qindex,qr,frame,resolution,notation);

 % Include previous frame
 all.RobotOrientations=[a.RobotOrientations;p.RobotOrientations;];
 all.RobotOrientations=unique(all.RobotOrientations,'rows');
 Orientations=all.RobotOrientations;
 
end