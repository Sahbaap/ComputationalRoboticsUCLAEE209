function s = get_state(index,L,W)
s = state(0,0,0);
index = index - 1;

s.x = rem(index,W+1);
s.y = rem((index-s.x)/(W+1),(L+1));
s.h = (index - s.x - s.y*(W+1))/((L+1)*(W+1));

end