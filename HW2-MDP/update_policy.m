% This function takes as an argument the V values across the state space
% and returns the optimal policy based on one-step look ahead on value V.
function optimal_one_step_lookahead_policy = update_policy(V) %(AS^2 # of operations)

    optimal_one_step_lookahead_policy = {};
    L = 6;
    W = 6;
    %discount
    lambda = 0.9;
    
    Pe = 0.25;
    
    %iterating through states (S # of operations)
    for h=0:1:11
        for y=0:1:W-1
            for x=0:1:L-1
                s = state(x,y,h);
                
                % iterating through actions for given state (A number of operations)
                index_state_now = get_index(s,L-1,W-1);
                Q_max = -10000;
                
                for (r=-1:1:1)
                    for (t=-1:1:1)
                        if (t ~= 0)%~(t==0 && r ~= 0)
                            
                              % limited heading
%                             if eq(s,state(3,4,5),'check_heading_too') || eq(s,state(3,4,6),'check_heading_too') || eq(s,state(3,4,7),'check_heading_too')
%                                 t = 0;
%                                 r = 0;
%                             end
                            
                            % All heading
                            if eq(s,state(3,4,5))
                                t = 0;
                                r = 0;
                            end

                            a = action(t,r);
                            %(#S operations)
                            q_val = Q(V,a,s,Pe,lambda);
                            if (q_val > Q_max)  % finding Q_max to update policy
                                optimal_one_step_lookahead_policy{index_state_now} = a;
                                Q_max = q_val;
                            end
                                
                        end
                    end
                end % actions

            end
        end
    end % states

end