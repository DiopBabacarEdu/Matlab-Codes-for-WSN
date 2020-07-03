function RES = sensors_covering_target(TARGET_INDEX,NEIGH)
RES = zeros(0);
[m n] = size (NEIGH);
k = 1;
for i=1:n
    if NEIGH(TARGET_INDEX,i) ~= 0
        RES (k) = NEIGH(TARGET_INDEX,i);
        k = k+1;
    end
end
end