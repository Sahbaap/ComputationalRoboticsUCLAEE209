% This function takes as arguments the 'Pe' which is the probability of 
% having pre-rotation error before motion, 's1' which the state that robot
% is in, and 'a' which is the action taken by robot, and returns the state
% that robot will land in 'next_state'. The 'next_state' follows the
% distribution especified by P(s'|s,a). 
% in summary what this function does is that it finds the most probable
% states: possible_state where (Transition_Probability(Pe,s1,a,possible_state)>0) and the 
% associted probability with each. Then, we draw a random number from that
% distribution and select the next_state based on the radom number.
function next_state = f(Pe,s1,a)

next_state = state(0,0,0);
i = 0;

% all possible robot states after taking an action
for x=-1:1:1
    for y = -1:1:1
        for h = -2:1:2
            possible_state = state(s1.x + x, s1.y + y, rem(s1.h + h + 12,12));
            if (Transition_Probability(Pe,s1,a,possible_state) > 0)
                i = i + 1;
                most_possible_states(i) = possible_state;
                probability(i) = Transition_Probability(Pe,s1,a,possible_state);
            end
        end
    end
end

random_number = rand;

% the probability distribution changes when the robot is operating at the
% corner of the grid vs in the middle. This is because some states would
% become totally impossible to reach when the robot is at the border since
% it cannot leave the grid.
if size(probability,2) == 2
    t = probability(1)+probability(2);
    probability(1) = probability(1)/(t);
    probability(2) = probability(2)/(t);
end

if random_number < probability(1)
    next_state = most_possible_states(1);
elseif random_number < probability(1) + probability(2) 
    next_state = most_possible_states(2);
elseif random_number < probability(1) + probability(2) + probability(3)
    next_state = most_possible_states(3);
end

end