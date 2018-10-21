% This function takes as arguments the 'Pe' which is the probability of 
% having pre-rotation error before motion, 's1' which the state that robot
% is in, and 'a' which is the action taken by robot, and returns the
% probability that the robot lands in state 's2'.
function pr = Transition_Probability(Pe,s1,a,s2)
    L = 5;
    W = 5;

    % no action taken by the robot
    if (a.t == 0) && (a.r == 0)
        
        if (s1.x == s2.x) && (s1.y == s2.y) && (s1.h == s2.h) 
            pr = 1.0;
        else
            pr = 0.0;
        end
    
    % if one of the inputs are out of the grid
    elseif (is_state_inside_environment(s2,L,W) ~= 1 || is_state_inside_environment(s1,L,W) ~= 1)
        pr = 0;            
        
    % the robot is in the middle of the maze    
    else 
        
        % if the action taken results in robot not falling off the grid
        s_vir = dynamics_deterministic(s1,a);

        if (is_state_inside_environment(s_vir,L,W) == 1)
            ss2 = state(s2.x,s2.y,s2.h);
            ss2.h = rem(s2.h - a.r + 12,12);

            ss1 = state(ss2.x,ss2.y,ss2.h);
            a.t = -a.t;
            ss1 = dynamics_deterministic(ss2,a);

            if eq(s1,ss1)
                if (s1.h == ss1.h)
                    pr = 1 - 2 * Pe;
                elseif (s1.h == rem(ss1.h - 1 + 12,12)) || (s1.h == rem(ss1.h + 1 + 12,12))
                    pr = Pe;
                else
                    pr = 0.0;
                end
            else
                pr = 0.0;
            end
           
        % if the action taken results in robot falling off the grid    
        else
            ss1 = state(s2.x,s2.y,s2.h);
            ss1.h = rem(s2.h - a.r + 12,12);
            pr = 0;
            if eq(s1,ss1)
                if (s1.h == ss1.h)
                    pr = 1;
                end
            end
        end

    end
end