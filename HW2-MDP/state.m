% this state class generally defines the state of the robot 
% which includes 'x' and 'y' position of the robot along with its heading 'h'
% The state space of this problem is created in the create_statespace
classdef state 
    properties
        x = 0;   % 0,1,...,L-1 (L values)
        y = 0;   % 0,1,...,W-1 (W values)
        h = 0;   % 0,1,...,11  (12 values)
    end
    
    methods
        
        function obj = state(x,y,h)
            obj.x = x;
            obj.y = y;
            obj.h = h;
        end
        
        function r = eq(s1,s2,arg)
            if (nargin == 2)
                r = 0; 
                if (s1.x == s2.x)
                    if (s1.y == s2.y)
                          r = 1;
                    end
                end
            elseif (strcmp(arg,'check_heading_too'))
                r = 0; 
                if (s1.x == s2.x)
                    if (s1.y == s2.y)
                        if (s1.h == s2.h)
                            r = 1;
                        end
                    end
                end
            end
        end
        
        function p = plot_state(obj)
            plot(obj.x-0.5,obj.y-0.5,'bo','MarkerSize',30)
            hold on
            line([obj.x-0.5 obj.x-0.5+0.5*cos(pi/2-obj.h*pi/6)],[obj.y-0.5 obj.y-0.5+0.5*sin(pi/2-obj.h*pi/6)])
        end
        
        function off = is_state_inside_environment(obj,L,W)
            
            off = 0;
            if (obj.x >= 0) && (obj.x <= L)
                if (obj.y >= 0) && (obj.y <= W)
                    off = 1;
                end
            end
            
        end
        
        function next_state = dynamics_deterministic(obj,a)
            next_state = state(obj.x,obj.y,obj.h);
            if (obj.h == 7 || obj.h == 6 || obj.h == 5)
                next_state.y = next_state.y - a.t;

            elseif (obj.h == 8 || obj.h == 9 || obj.h == 10)
                next_state.x = next_state.x - a.t;

            elseif (obj.h == 11 || obj.h == 0 || obj.h == 1)
                next_state.y = next_state.y + a.t;

            elseif (obj.h == 2 || obj.h == 3 || obj.h == 4)
                next_state.x = next_state.x + a.t;
            end  
        end
        
    end
end