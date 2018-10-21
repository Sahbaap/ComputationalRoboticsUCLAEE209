% This function takes as an argument the state that robot is in 's'
% and returns 'r' which is the reward associated with being in that state.
% Note that in this case, the reward is independent of the heading of the
% robot (except in problem 5) as well as independent of the action that robot takes.
function r = reward(s)
    % borders of the grid
    W = 6;
    L = 6;
    
    x = s.x;
    y = s.y;
    h = s.h;
    
    % robot is at the border states
    if (x==0) || (x==L-1) || (y==0) || (y==W-1)
        r = -100;
    % robot is on the lane markers
    elseif (x==2) || (x==4)
        if y ~= 1
            r = -10;
        else 
            r = 0;
        end
    % robot is at the goal
    elseif (x==3) && (y==4)
        
  % only robot headings of 5,6,7 get reward 1
  %    if (h == 5 || h == 6 || h == 7) 
  
  % heading does not matter for the +1 reward
      if (h == 1 || h == 2 || h == 3 || h == 4 || h == 5 || h == 6 || ...
      h == 7 || h == 8 || h == 9 || h == 10 || h == 11 || h == 0)
            r = 1;
        else 
            r = 0;
        end
    else
        % otherwise
        r = 0;
    end

end