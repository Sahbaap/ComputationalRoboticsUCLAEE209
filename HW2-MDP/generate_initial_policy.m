% This function takes as arguments takes no argument and returns the
% initial policy array that includes all the actions in initial_policy_generator
% array.

function initial_policy_generator = generate_initial_policy()
    L = 6;
    W = 6;
    initial_policy_generator = {};
    c = 0;
    for h=0:1:11
        for y=0:1:W-1
            for x=0:1:L-1
            s_now = state(x,y,h);
            state_index = get_index(s_now,L-1,W-1);
            v = generate_policy(s_now);
            initial_policy_generator{state_index} = v{2};
            end
        end
    end
    
end