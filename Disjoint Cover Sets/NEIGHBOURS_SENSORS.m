function RES = NEIGHBOURS_SENSORS(SDM,SENSING_RANGE,NB_TARGETS)
RES = zeros(0,0);
for i=1:NB_TARGETS
     NEIGHBOURS = neighbours_sensor(SDM,i,SENSING_RANGE);
     for j=1:length(NEIGHBOURS)
         RES (i,j) = NEIGHBOURS(j);
     end
end
end