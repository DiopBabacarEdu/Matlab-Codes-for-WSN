function RES = union_of_all_targets_covered(SENSORS,TARGETS,ST_DISTANCE,RANGE)
RES = zeros(0);
for i=1:length(SENSORS)
    P = targets_covered_by_sensor_selected(SENSORS(i),TARGETS,ST_DISTANCE,RANGE);
    RES = union(RES,P);
end
            
end