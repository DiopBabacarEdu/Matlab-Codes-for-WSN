function RES  = neighbours_sensor(SDM,TARGET_INDEX,RANGE)
RES = zeros(0);
k = 1;
j = 1;
[m n] = size(SDM);
while (j<=m)
    if (SDM(j,TARGET_INDEX) <= RANGE)
        RES (k) = j;
        k = k+1;
    end    
    j = j+1;
end
end