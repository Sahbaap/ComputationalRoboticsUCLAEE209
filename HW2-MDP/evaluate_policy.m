% This function takes as input the policy 'pol_pi', the forgetting factor
% 'lambda'.
% The function outputs V values in the form of cell array. The input to the
% V values are states or state_index and the outputs of the V is double. We
% can access V data in the form of V{index}, e.g. V{23} = some_number.
% Of note, without max, evaluation of V is just a linear equation which is
% simple in matlab

function V = evaluate_policy(pol_pi,lambda) %(# of operations: num_iterate*S^2)
    L = 6;
    W = 6;
    Pe = 0.25;
    % (I-lambda*P)V = R  ====> V = inv(I-lambda*P)R
    
    % creating P matrix : P(s'|s,a): [(L)*(W)*12]*[(L)*(W)*12] matrix
    for idx_s1=1:1:(L)*(W)*12
        s1 = get_state(idx_s1,L-1,W-1);
        for idx_s2=1:1:(L)*(W)*12
            s2 = get_state(idx_s2,L-1,W-1);
            P(idx_s1,idx_s2) = lambda*Transition_Probability(Pe,s1,pol_pi{idx_s1},s2);
        end
        R(idx_s1) = reward(s1);
    end
    
    % A = (I-lambda*P)
    A = eye((L)*(W)*12) - P;
    
    % V = pinv(A)R
    V1 = A\R';
    
    % converting V from array to cell array
    for h=0:1:11
        for y=0:1:W-1
            for x=0:1:L-1
                s = state(x,y,h);
                state_index = get_index(s,L-1,W-1);
                V{state_index} = V1(state_index);
             end
         end
    end

end