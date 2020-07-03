function RES = targets_covered_by_sensor(SDM,SENSOR_INDEX,RANGE)
RES = zeros(0);
k = 1;
[m n] = size(SDM);
for j=1:n
    %disp('222222222222222222222222');
    %disp(SENSOR_INDEX);
    if (SDM(SENSOR_INDEX,j) <= RANGE)
        RES (k) = j;
        k = k+1;
    end    
end
end