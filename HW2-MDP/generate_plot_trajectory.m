% This function takes as argument the policy 'policy_pi', the initial state of the
% robot 's', the pre-rotation probability 'Pe'. I personally also added
% fig_num so the plotted trajectory will be plotted in the figure with that
% number, and this does not in any sense changes the behaviour of the
% function. This function creates the trajectory of the robot based on the
% policy and given initial state and Pe and plots it in the figure with
% given fig_num.

function v = generate_plot_trajectory(policy_pi,s,Pe,fig_num) %policy_pi,
    
    s_now = state(s.x,s.y,s.h);
    s_goal = state(3,4,0);
    trajectory = {s_now};
    L = 6;
    W = 6;
    lambda = 0.9;
    v = 0;
    count = 0;
    % while the robot has not reached the target:
    while (eq(s_now,s_goal) ~= 1)
        state_index = get_index(s_now,L-1,W-1);
        a = policy_pi{state_index};
        v = v + lambda^(count)*reward(s_now)
        count = count + 1;
        s_now = f(Pe,s_now,a);
        trajectory{end+1} = s_now;
    end
    v = v + lambda^(count)*1;
    
    % creating the grid environment with given goal.
    goal = state(3,4,0);
    e = environment(5,5,goal,fig_num);
    sketch_environment(e)
    hold on 
    
    % This plots the robot position with the line especifying the robot
    % orientation. The black line especifies the direction that robot is
    % moving.
    plot_trajectory(trajectory);
end