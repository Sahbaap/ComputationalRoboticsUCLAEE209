% This function takes the state of the robot 's' and the state of the goal
% 's_goal' and returns in string the relationship between the robot and
% goal. For example 'TAR' means Target At Robot or in the other words the 
% robot is at the target (goal) position.
function r = state_to_goal_relative(s,s_goal)

    if (eq(s,s_goal))
        r = 'TAR';  % target at the Robot position
    else
        eps = 0.001;
        angle_robot_to_target = atan2((s_goal.y-s.y),(s_goal.x-s.x));
        angle_robot_heading = (pi/2.0) - s.h*(pi/6.0);

        angle_heading_relative_to_target = atan2(sin(-angle_robot_heading+angle_robot_to_target),[cos(angle_robot_heading);sin(angle_robot_heading)]'*[cos(angle_robot_to_target);sin(angle_robot_to_target)]);

        if (angle_heading_relative_to_target > pi/2.0 - eps) && (angle_heading_relative_to_target < pi/2.0 + eps)
            r = 'TLR'; % target is in robot's left side;  
        elseif (angle_heading_relative_to_target > -pi/2.0 - eps) && (angle_heading_relative_to_target < -pi/2.0 + eps)
            r = 'TRR'; % target is in robot's bottom side;
        elseif (angle_heading_relative_to_target > pi - eps) && (angle_heading_relative_to_target < pi + eps)
            r = 'TBR'; % target is in robot's back side;
        elseif (angle_heading_relative_to_target > -pi - eps) && (angle_heading_relative_to_target < -pi + eps)
            r = 'TBR'; % target is in robot's back side;
        elseif (angle_heading_relative_to_target > 0 - eps) && (angle_heading_relative_to_target < 0 + eps)
            r = 'TFR'; % target is in robot's front side;    

        elseif (angle_heading_relative_to_target < pi/2.0 + eps) && (angle_heading_relative_to_target > 0.0 - eps)
            r = 'TFLR'; % target is in robot's front right side;
        elseif (angle_heading_relative_to_target < 0.0 + eps) && (angle_heading_relative_to_target > -pi/2.0 - eps)
            r = 'TFRR'; % target is in robot's front left side;
        elseif (angle_heading_relative_to_target > pi/2.0 - eps) && (angle_heading_relative_to_target < pi + eps)
            r = 'TBLR'; % target is in robot's front right side;
        elseif (angle_heading_relative_to_target < -pi/2.0 + eps) && (angle_heading_relative_to_target > -pi - eps)
            r = 'TBRR'; % target is in robot's front left side;
        end
    end
    
end