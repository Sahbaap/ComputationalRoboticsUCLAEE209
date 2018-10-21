% This function takes as argument 'lambda' which is the discount factor
% and return the optimal policy 'optimal_policy_PI' and optimal value
% 'optimal_value_PI'. This function also return the history of V values
% 'V_history_PI' and histoy of policies 'P_history_PI'.
function [optimal_policy_PI,optimal_value_PI] = policy_iteration(lambda)
    
    L = 6;
    W = 6;
    s_goal = state(3,4,0);

    eps = 0.01;
    V_diff = 1000;

    idx_policy_iteration = 0;

    policy_init = generate_initial_policy();

    % setting up the first column of P_history_PI to initial policy we
    % created.
    for h=0:1:11
        for y=0:1:W-1
            for x=0:1:L-1
                s_index = get_index(state(x,y,h),L-1,W-1);
                optimal_policy_PI{s_index} = policy_init{s_index};
            end
        end
    end
    

    % for each iteration, we calculate V given P and update P given V
    while (V_diff > eps)
        idx_policy_iteration = idx_policy_iteration + 1
        
        %calculate V
        optimal_value_PI = evaluate_policy(optimal_policy_PI,lambda);

        %calculate V diff
        if (idx_policy_iteration > 2)
            err(idx_policy_iteration - 1) = calculate_V_diff(optimal_value_PI,optimal_value_PI_Previous);    % between V{i} and V{i+1}
            V_diff = calculate_V_diff(optimal_value_PI,optimal_value_PI_Previous)  
        end
        
        % update V previous
        if (idx_policy_iteration > 1)
            for h=0:1:11
                for y=0:1:W-1
                    for x=0:1:L-1
                    s_index = get_index(state(x,y,h),L-1,W-1);
                    optimal_value_PI_Previous{s_index} = optimal_value_PI{s_index};
                    end
                end
            end
        end
        
        %calculate P*
        optimal_policy_PI = update_policy(optimal_value_PI);
        
        %calculate V* from P*
        if (V_diff < eps)
            total_num_policy_iteration = idx_policy_iteration;
            optimal_value_PI = evaluate_policy(optimal_policy_PI,lambda);
        end

    end
      
end