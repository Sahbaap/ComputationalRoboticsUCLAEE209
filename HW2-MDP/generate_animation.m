function animate = generate_animation(policy_pi,s,Pe,fig_num)

    s_now = state(s.x,s.y,s.h);
    s_goal = state(3,4,5);
    trajectory = {s_now};
    L = 5;
    W = 5;
    
    while (eq(s_now,s_goal) ~= 1)
        state_index = get_index(s_now,L,W);
        a = policy_pi{state_index};
        s_now = f(Pe,s_now,a);
        trajectory{end+1} = s_now;
    end
    
    goal = state(3,4,0);
    e = environment(5,5,goal,fig_num);
    sketch_environment(e)
    hold on 
    animate_trajectory(trajectory,0.3);

end