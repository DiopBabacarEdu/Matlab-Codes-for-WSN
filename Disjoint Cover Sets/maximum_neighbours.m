function [MAX MIN] = maximum_neighbours (NEIGHBOURS_SENSORS)
[m n] = size(NEIGHBOURS_SENSORS);
ARRAY = zeros(0);
for i=1:m
    M = 0;
    for j=1:n
    if NEIGHBOURS_SENSORS(i,j) ~=0
        M = M+1;
    end
    end
    ARRAY (i) = M;
end
MAX = max(ARRAY);
MIN = min(ARRAY);
end