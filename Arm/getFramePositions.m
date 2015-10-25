% function [a,p]=getFramePositions...
% (robot,q,qindex,qr,frame,resolution,notation) 
% ----
% a - active joints info (struct)
% p - passive joints info (struct)
% robot - robot structure
% q - joint angles vector
% qindex - vector of DoFs to be studied
% qr - vector of discritized joint angles
% frame - active frame (between 1 and n)
% resolution - vector of joints resolutions
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

function [a,p,q]=getFramePositions...
    (robot,q,qindex,qr,frame,resolution,notation)

n=robot.n;

for i=1:n
    a.xyz(i).values = zeros(resolution(i),3);
    a.xyzsets(i).values=[];
    p.xyz(i).values = zeros(resolution(i),3);
    p.xyzsets(i).values=[];
    a.RobotPoints=[];
    p.RobotPoints=[];
end

if(n==2)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointPositions(a,p,1,l1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointPositions(a,p,2,l2,robot,q,frame,notation);
        end
    end
    
    a.RobotPoints=[a.xyzsets(1).values;a.xyzsets(2).values];
    p.RobotPoints=[p.xyzsets(1).values;p.xyzsets(2).values];
    
elseif(n==3)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointPositions(a,p,1,l1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointPositions(a,p,2,l2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointPositions(a,p,3,l3,robot,q,frame,notation);
            end
        end
    end
    
    a.RobotPoints=[a.xyzsets(1).values;a.xyzsets(2).values;a.xyzsets(3).values];
    p.RobotPoints=[p.xyzsets(1).values;p.xyzsets(2).values;p.xyzsets(3).values];
    
elseif(n==4)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointPositions(a,p,1,l1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointPositions(a,p,2,l2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointPositions(a,p,3,l3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointPositions(a,p,4,l4,robot,q,frame,notation);
                end
            end
        end
    end
    
    a.RobotPoints=[a.xyzsets(1).values;a.xyzsets(2).values;a.xyzsets(3).values;a.xyzsets(4).values];
    p.RobotPoints=[p.xyzsets(1).values;p.xyzsets(2).values;p.xyzsets(3).values;p.xyzsets(4).values];
    
elseif(n==5)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointPositions(a,p,1,l1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointPositions(a,p,2,l2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointPositions(a,p,3,l3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointPositions(a,p,4,l4,robot,q,frame,notation);
                    for l5=1:resolution(5)
                        q(qindex(5)) = qr(5).values(l5);
                        [a,p]=getJointPositions(a,p,5,l5,robot,q,frame,notation);
                    end
                end
            end
        end
    end
    
    a.RobotPoints=[a.xyzsets(1).values;a.xyzsets(2).values;a.xyzsets(3).values;a.xyzsets(4).values;...
        a.xyzsets(5).values];
    
    p.RobotPoints=[p.xyzsets(1).values;p.xyzsets(2).values;p.xyzsets(3).values;p.xyzsets(4).values;...
        p.xyzsets(5).values];
    
elseif(n==6)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointPositions(a,p,1,l1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointPositions(a,p,2,l2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointPositions(a,p,3,l3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointPositions(a,p,4,l4,robot,q,frame,notation);
                    for l5=1:resolution(5)
                        q(qindex(5)) = qr(5).values(l5);
                        [a,p]=getJointPositions(a,p,5,l5,robot,q,frame,notation);
                        for l6=1:resolution(6)
                            q(qindex(6)) = qr(6).values(l6);
                            [a,p]=getJointPositions(a,p,6,l6,robot,q,frame,notation);
                        end
                    end
                end
            end
        end
    end
    
    a.RobotPoints=[a.xyzsets(1).values;a.xyzsets(2).values;a.xyzsets(3).values;a.xyzsets(4).values;...
        a.xyzsets(5).values;a.xyzsets(6).values];
    
    p.RobotPoints=[p.xyzsets(1).values;p.xyzsets(2).values;p.xyzsets(3).values;p.xyzsets(4).values;...
        p.xyzsets(5).values;p.xyzsets(6).values];
    
elseif(n==7)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointPositions(a,p,1,l1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointPositions(a,p,2,l2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointPositions(a,p,3,l3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointPositions(a,p,4,l4,robot,q,frame,notation);
                    for l5=1:resolution(5)
                        q(qindex(5)) = qr(5).values(l5);
                        [a,p]=getJointPositions(a,p,5,l5,robot,q,frame,notation);
                        for l6=1:resolution(6)
                            q(qindex(6)) = qr(6).values(l6);
                            [a,p]=getJointPositions(a,p,6,l6,robot,q,frame,notation);
                            for l7=1:resolution(7)
                                q(qindex(7)) = qr(7).values(l7);
                                [a,p]=getJointPositions(a,p,7,l7,robot,q,frame,notation);
                            end
                        end
                    end
                end
            end
        end
    end
    
    a.RobotPoints=[a.xyzsets(1).values;a.xyzsets(2).values;a.xyzsets(3).values;a.xyzsets(4).values;...
        a.xyzsets(5).values;a.xyzsets(6).values;a.xyzsets(7).values];
    
    p.RobotPoints=[p.xyzsets(1).values;p.xyzsets(2).values;p.xyzsets(3).values;p.xyzsets(4).values;...
        p.xyzsets(5).values;p.xyzsets(6).values;p.xyzsets(7).values];
    
end