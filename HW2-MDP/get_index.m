function index = get_index(s,L,W)
index = ( s.x + (W+1)*s.y ) + (L+1)*(W+1)*s.h + 1;
end