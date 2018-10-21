function Q_out = Q(V,a,s,Pe,lambda) %(#S operations)

    % calculating Qt for a given state and action
    Q_out = 0.0;
    L = 5;
    W = 5;
    
    for h=0:1:11
        for y=0:1:W
            for x=0:1:L
                s_next_possible = state(x,y,h);
                index_next_possible_state = get_index(s_next_possible,L,W);
                if (Transition_Probability(Pe,s,a,s_next_possible) > 0)
                    Q_out = Q_out + Transition_Probability(Pe,s,a,s_next_possible) * ( reward(s) + lambda*V{index_next_possible_state} );
                end
             end
        end
    end

end