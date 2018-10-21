function animation = animate_trajectory(trajectory,dt)

    size_traj = size(trajectory);
    for i=1:1:size_traj(2)
        if (i < size_traj(2))
            line([trajectory{i}.x-0.5 trajectory{i+1}.x-0.5],[trajectory{i}.y-0.5 trajectory{i+1}.y-0.5],'Color','k')
        end
        plot_state(trajectory{i})
        pause(dt)
        hold on
    end


end