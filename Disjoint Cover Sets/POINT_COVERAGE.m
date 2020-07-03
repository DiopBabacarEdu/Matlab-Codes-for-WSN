function RES = POINT_COVERAGE(SDM,SENSING_RANGE,NB_SENSORS)
RES = zeros(NB_SENSORS,NB_SENSORS);
for i=1:NB_SENSORS
    NEIGHBOURS = neighbours(SDM,i,SENSING_RANGE);
    for j=1:length(NEIGHBOURS)
        RES(i,j) = NEIGHBOURS(j);
    end
end
end