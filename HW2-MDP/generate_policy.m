% This function takes as an argument the state that robot is in 's'
% and returns initial single action called 'pi_initial' based on the
% the definition in Problem 3.
function pi_initial = generate_policy(s)
    % goal
    s_goal = state(3,4,0);
    
    % initiating action
    a_init = action(0,0);
    
    % this function especifies the relationship between the robot and goal
    rel_pos = state_to_goal_relative(s,s_goal);
    
    % the robot takes an action based on its relative position to the goal.
    % this action is defined based on the description given in the problem.
    
    % Target At Robot (TAR): robot does not do anything.
    if (strcmp(rel_pos,'TAR'))
        a = action(0,0);
        pi_initial = {s,a}; 
   
    % Target Left to Robot (TAR): robot moves forward and turns left
    elseif (strcmp(rel_pos,'TLR'))
        a_intermediate = move_forward(a_init);
        a = turn_left(a_intermediate);
        pi_initial = {s,a};
    
    % Target Right to Robot (TAR): robot moves forward and turns right
    elseif (strcmp(rel_pos,'TRR'))
        a_intermediate = move_forward(a_init);
        a = turn_right(a_intermediate);
        pi_initial = {s,a};
    
    % Target Front of Robot (TFR): robot moves forward with no turn. 
    elseif (strcmp(rel_pos,'TFR'))
        a = move_forward(a_init);
        pi_initial = {s,a};
    
    % Target Back of Robot (TBR): robot moves backward with no turn.        
    elseif (strcmp(rel_pos,'TBR'))
        a = move_backward(a_init);
        pi_initial = {s,a};
        
   % Target Front Right of Robot (TFRR) or Front Left of Robot (TFLR) 
    elseif (strcmp(rel_pos,'TFRR') || strcmp(rel_pos,'TFLR'))
        
        % robot moves forward and depending on where it would lands,
        % decides where to go. 
        a_intermediate = move_forward(a_init);
        s_next = f(0.0,s,a_intermediate);
        rel_pos_2 = state_to_goal_relative(s_next,s_goal);
        if (strcmp(rel_pos_2,'TFRR') || strcmp(rel_pos_2,'TBRR') || strcmp(rel_pos_2,'TRR'))
            a = turn_right(a_intermediate);
        elseif (strcmp(rel_pos_2,'TFLR') || strcmp(rel_pos_2,'TBLR') || strcmp(rel_pos_2,'TLR'))
            a = turn_left(a_intermediate);
        elseif (strcmp(rel_pos_2,'TFR') || strcmp(rel_pos_2,'TBR') || strcmp(rel_pos_2,'TAR'))
            a = action(a_intermediate.t,0); % no turn
        end
        pi_initial = {s,a};
        
      % Target Back Right of Robot (TBRR) or Back Left of Robot (TBLR)   
     elseif (strcmp(rel_pos,'TBRR') || strcmp(rel_pos,'TBLR'))
         
        % robot moves backward and depending on where it would lands,
        % decides where to go.
        a_intermediate = move_backward(a_init);
        s_next = f(0.0,s,a_intermediate);
        rel_pos_2 = state_to_goal_relative(s_next,s_goal);
        if (strcmp(rel_pos_2,'TBRR') || strcmp(rel_pos_2,'TFRR') || strcmp(rel_pos_2,'TRR'))
            a = turn_right(a_intermediate);
        elseif (strcmp(rel_pos_2,'TBLR') || strcmp(rel_pos_2,'TFLR') || strcmp(rel_pos_2,'TLR'))
            a = turn_left(a_intermediate);
        elseif (strcmp(rel_pos_2,'TFR') || strcmp(rel_pos_2,'TBR') || strcmp(rel_pos_2,'TAR'))
            a = action(a_intermediate.t,0); % no turn
        end
        pi_initial = {s,a};
    end
end