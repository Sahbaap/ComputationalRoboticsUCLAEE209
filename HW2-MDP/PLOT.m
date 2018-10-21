% This .m file serves only for plotting different policies and values
% that I obtained.

v = [];
for i = 1:1:1
    i
    create_colormap(optimal_value_VI_Pr(1,:),6,2*i);
    v(i) = generate_plot_trajectory(optimal_policy_VI_Pr(1,:),state(1,4,6),0.0,2*i-1);
end

%generate_animation(optimal_policy_VI_H(1,:),state(1,4,6),1,8);
%create_colormap(optimal_value_VI_pr(1,:),6,1);