% just initializtion of the state space to have zero values.
% as it can be seen, the size of the state space is 12*W*L.
% A more useful thing to define is the state class which can be found
% in this folder as well.
function sp = create_statespace(L,W)

    for k=1:1:12
        for i=1:1:L
            for j=1:1:W
                sp(i,j,k) = 0.0;
            end
        end
    end

end