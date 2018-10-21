% This function takes as argument 'lambda' which is the discount factor
% and return the optimal policy 'optimal_policy_VI' and optimal value
% 'optimal_value_VI'. This function also return the history of V values
% 'V_history_VI' and histoy of policies 'P_history_VI'.
function [optimal_policy_VI,optimal_value_VI] = value_iteration(lambda)  %(#AS^2 operations)

    L = 6;
    W = 6;
    
    V_diff = 1000;
    idx_policy_iteration = 0;
    eps = 0.01;
    
    Pe = 0.25;

    % initializing V and P
    for idx_v=1:1:12*(L)*(W)
        optimal_value_VI{idx_v} = 0;
        optimal_policy_VI{idx_v} = action(0,0);  % do nothing
    end
    
    % iterating until convergance: V_diff is the difference between V{i+1}
    % and V{i}
    while (V_diff > eps)
        
        idx_policy_iteration = idx_policy_iteration + 1
        
        %iterating through states space
        for h=0:1:11
            for y=0:1:W-1
                for x=0:1:L-1
                    
                    % select state
                    s = state(x,y,h);

                    index_state_now = get_index(s,L-1,W-1);
                    Q_max = -10000;

                    % iterating through actions space
                    % finding max across all actions
                    for (r=-1:1:1)
                        for (t=-1:1:1)
                            if (t ~= 0)%~(t==0 && r ~= 0)%

                                % limited heading
%                                 if eq(s,state(3,4,5),'check_heading_too') || eq(s,state(3,4,6),'check_heading_too') || eq(s,state(3,4,7),'check_heading_too')
%                                    t = 0;
%                                    r = 0;
%                                 end
                                
                                % all heading
                                if eq(s,state(3,4,5))
                                   t = 0;
                                   r = 0;
                                end

                                % select action
                                a = action(t,r);
                                
                                % get Q for given state and action
                                q_val = Q(optimal_value_VI,a,s,Pe,lambda);
                                
                                % find Q max and assign to V
                                % update the action that caused Q max
                                if (q_val > Q_max)
                                    optimal_value_VI{index_state_now} = q_val;
                                    optimal_policy_VI{index_state_now} = a;
                                    Q_max = q_val;
                                end

                            end
                        end
                    end % actions

                end
            end
        end % states
        
        
        % calculate the difference between V{i} and V{i+1}
        if idx_policy_iteration > 2
            V_diff = calculate_V_diff(optimal_value_VI_Previous,optimal_value_VI)
        end
        
            
        % update optimal_value_VI_Previous
        if (idx_policy_iteration > 1)
            for h=0:1:11
                for y=0:1:W-1
                    for x=0:1:L-1
                        s_index = get_index(state(x,y,h),L-1,W-1);
                        optimal_value_VI_Previous{s_index} = optimal_value_VI{s_index};
                    end
                end
            end
        end
    
    
    end

end