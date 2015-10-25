% function [a,p]=getFrameOrientations...
% (robot,q,qindex,qr,frame,resolution,notation)
% ----
% Gets frame orientations
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

function [a,p]=getFrameOrientations...
    (robot,q,qindex,qr,frame,resolution,notation)

n=robot.n;

for i=1:n
    a.rpysets(i).values=[];
    p.rpysets(i).values=[];
end

a.RobotOrientations=[];
p.RobotOrientations=[];

%%%% Loops %%%%

if(n==2)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointOrientations ...
            (a,p,1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointOrientations ...
                (a,p,2,robot,q,frame,notation);
            a.RobotOrientations=[a.rpysets(1).values; ...
                a.rpysets(2).values];
            p.RobotOrientations=[p.rpysets(1).values; ...
                p.rpysets(2).values];
        end
    end
    
elseif(n==3)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointOrientations ...
            (a,p,1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointOrientations ...
                (a,p,2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointOrientations ...
                    (a,p,3,robot,q,frame,notation);
                a.RobotOrientations=[a.RobotOrientations;...
                    a.rpysets(1).values;
                    a.rpysets(2).values;a.rpysets(3).values];
                p.RobotOrientations=[p.RobotOrientations;...
                    p.rpysets(1).values; ...
                    p.rpysets(2).values;p.rpysets(3).values];
            end
        end
    end
    
elseif(n==4)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointOrientations ...
            (a,p,1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointOrientations ...
                (a,p,2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointOrientations ...
                    (a,p,3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointOrientations ...
                        (a,p,4,robot,q,frame,notation);
                    a.RobotOrientations=[a.RobotOrientations;...
                        a.rpysets(1).values; ...
                        a.rpysets(2).values;a.rpysets(3).values; ...
                        a.rpysets(4).values];
                    p.RobotOrientations=[p.RobotOrientations;...
                        p.rpysets(1).values; ...
                        p.rpysets(2).values;p.rpysets(3).values; ...
                        p.rpysets(4).values];
                end
            end
        end
    end
    
elseif(n==5)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointOrientations ...
            (a,p,1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointOrientations ...
                (a,p,2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointOrientations ...
                    (a,p,3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointOrientations ...
                        (a,p,4,robot,q,frame,notation);
                    for l5=1:resolution(5)
                        q(qindex(5)) = qr(5).values(l5);
                        [a,p]=getJointOrientations ...
                            (a,p,5,robot,q,frame,notation);
                        a.RobotOrientations=[a.RobotOrientations;...
                            a.rpysets(1).values; ...
                            a.rpysets(2).values;a.rpysets(3).values; ...
                            a.rpysets(4).values;a.rpysets(5).values];
                        
                        p.RobotOrientations=[p.RobotOrientations;...
                            p.rpysets(1).values; ...
                            p.rpysets(2).values;p.rpysets(3).values; ...
                            p.rpysets(4).values;p.rpysets(5).values];
                    end
                end
            end
        end
    end
    
elseif(n==6)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointOrientations ...
            (a,p,1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointOrientations ...
                (a,p,2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointOrientations ...
                    (a,p,3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointOrientations ...
                        (a,p,4,robot,q,frame,notation);
                    for l5=1:resolution(5)
                        q(qindex(5)) = qr(5).values(l5);
                        [a,p]=getJointOrientations...
                            (a,p,5,robot,q,frame,notation);
                        for l6=1:resolution(6)
                            q(qindex(6)) = qr(6).values(l6);
                            [a,p]=getJointOrientations ...
                                (a,p,6,robot,q, ...
                                frame,notation);
                            
                            a.RobotOrientations=[a.RobotOrientations;...
                                a.rpysets(1).values; ...
                                a.rpysets(2).values;a.rpysets(3).values; ...
                                a.rpysets(4).values; ...
                                a.rpysets(5).values;a.rpysets(6).values];
                            
                            p.RobotOrientations=[p.RobotOrientations;...
                                p.rpysets(1).values; ...
                                p.rpysets(2).values;p.rpysets(3).values; ...
                                p.rpysets(4).values;p.rpysets(5).values; ...
                                p.rpysets(6).values];
                        end
                    end
                end
            end
        end
    end
    
elseif(n==7)
    
    for l1=1:resolution(1)
        q(qindex(1)) = qr(1).values(l1);
        [a,p]=getJointOrientations ...
            (a,p,1,robot,q,frame,notation);
        for l2=1:resolution(2)
            q(qindex(2)) = qr(2).values(l2);
            [a,p]=getJointOrientations ...
                (a,p,2,robot,q,frame,notation);
            for l3=1:resolution(3)
                q(qindex(3)) = qr(3).values(l3);
                [a,p]=getJointOrientations ...
                    (a,p,3,robot,q,frame,notation);
                for l4=1:resolution(4)
                    q(qindex(4)) = qr(4).values(l4);
                    [a,p]=getJointOrientations ...
                        (a,p,4,robot,q,frame,notation);
                    for l5=1:resolution(5)
                        q(qindex(5)) = qr(5).values(l5);
                        [a,p]=getJointOrientations ...
                            (a,p,5,robot,q,frame,notation);
                        for l6=1:resolution(6)
                            q(qindex(6)) = qr(6).values(l6);
                            [a,p]=getJointOrientations ...
                                (a,p,6,robot,q,frame,notion);
                            for l7=1:resolution(7)
                                q(qindex(7)) = qr(7).values(l7);
                                [a,p]=getJointOrientations ...
                                    (a,p,7,robot,q, ...
                                    frame,notation);
                                a.RobotOrientations=[a.RobotOrientations;...
                                    a.rpysets(1).values; ...
                                    a.rpysets(2).values;a.rpysets(3).values; ...
                                    a.rpysets(4).values;a.rpysets(5).values; ...
                                    a.rpysets(6).values;a.rpysets(7).values];
                                
                                p.RobotOrientations=[p.RobotOrientations;...
                                    p.rpysets(1).values; ...
                                    p.rpysets(2).values;p.rpysets(3).values; ...
                                    p.rpysets(4).values;p.rpysets(5).values; ...
                                    p.rpysets(6).values;p.rpysets(7).values];
                            end
                        end
                    end
                end
            end
        end
    end
    
end