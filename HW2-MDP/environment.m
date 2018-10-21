classdef environment
    properties
        L;
        W;
        Goal;
        fig_num;
    end
    methods
        function obj = environment(L,W,G,fig_num)
            obj.L = L;
            obj.W = W;
            obj.Goal.x = G.x;
            obj.Goal.y = G.y;
            obj.fig_num = fig_num;
        end
        
        function obj = sketch_environment(obj)
            figure(obj.fig_num)
            %filledCircle([obj.Goal.x-0.5,obj.Goal.y-0.5],0.3,1000,'g');
            hold on
            lane = [2.5 2.5 2.5 4.5 4.5 4.5; 2.5 3.5 4.5 2.5 3.5 4.5]; 
            border = [0.5 0.5 0.5 0.5 0.5 0.5 1.5 1.5 2.5 2.5 3.5 3.5 4.5 4.5 5.5 5.5 5.5 5.5 5.5 5.5; ...
                      0.5 1.5 2.5 3.5 4.5 5.5 0.5 5.5 0.5 5.5 0.5 5.5 0.5 5.5 0.5 1.5 2.5 3.5 4.5 5.5];
                  
            for i=1:1:size(lane,2)
                %filledCircle([lane(1,i)-1,lane(2,i)-1],0.2,1000,'y');
                scatter(lane(1,i) - 1, lane(2,i) - 1, 2800, 'y', 'square', 'filled');
            end
            for i=1:1:size(border,2)
                %filledCircle([border(1,i)-1,border(2,i)-1],0.2,1000,'r');
                scatter(border(1,i) - 1, border(2,i) - 1, 2800, 'r', 'square', 'filled');
            end
            scatter(obj.Goal.x - 0.5, obj.Goal.y - 0.5, 2800, 'g', 'square', 'filled');
            axis square
            axis([-1 obj.L -1 obj.W])
            xticks([-0.5 0.5 1.5 2.5 3.5 4.5])
            xticklabels({'0','1','2','3','4','5'})
            yticks([-0.5 0.5 1.5 2.5 3.5 4.5])
            yticklabels({'0','1','2','3','4','5'})
            grid on
        end
        
    end
    
    
end