function RES = neighbours(SDM,SENSOR_INDEX,RANGE)
RES = zeros(0);
k = 1;
[m n] = size(SDM);
for j=1:n
    if (SDM(SENSOR_INDEX,j) <= RANGE)
        RES (k) = j;
        k = k+1;
    end    
end
end