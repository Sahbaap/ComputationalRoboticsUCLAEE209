
function create_colormap(V,h,fig_index)

a = zeros(6);
L = 5;
W = 5;

for j=0:1:5
    for i=0:1:5
        s = state(i,j,h);
        state_index = get_index(s,L,W);
        a(6-j,i+1) = V{state_index};
    end
end
figure(fig_index)
heatmap(a, [], [], '%0.2f', 'TextColor', 'w', ...
        'Colormap', 'copper', 'Colorbar', true);
end