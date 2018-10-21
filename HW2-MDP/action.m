% This is the action class which fully defines the robot actions.
% 't' represents the translation portion of the robot motion and
% 'r' represents the rotation portion of the robot motion. Note that
% out of all 9 mixtures, 2 of them (t=0,r=1) and (t=0,r=-1) is not
% acceptable. Hence the action space of the robot is composed of 
% 7 actions: 
% (1,0)     move forward, no turn
% (1,-1)    move forward, turn left
% (1,1)     move forward, turn right
% (-1,0)    move backward, no turn
% (-1,1)    move backward, turn right
% (-1,-1)   move backward, turn left
% (0,0)     stay still

classdef action
    properties
        t             % -1 (move backwards), 0 (not move), 1 (move forward
        r             % -1 (turn left),0 (not turn),1 (turn right)
    end
    methods    
        function obj = action(t,r)
            obj.t = t;
            obj.r = r;
        end 
        
        function obj = move_forward(obj)
            obj.t = 1;
        end
        
        function obj = move_backward(obj)
            obj.t = -1;
        end
        
        function obj = turn_right(obj)
            obj.r = 1;
        end
        
        function obj = turn_left(obj)
            obj.r = -1;
        end
        
        
    end
end