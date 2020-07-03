%--------------------------------------------------------------------------
%       Function which computes distances between sensors and targets
%--------------------------------------------------------------------------        

function ST_DISTANCE = distance_sensors_targets(SENSORS_MAT,TARGETS_MAT)
ST_DISTANCE = zeros(0,0);
for i=1:length(SENSORS_MAT)
    for j=1:length(TARGETS_MAT)
        X = [SENSORS_MAT(2,i),SENSORS_MAT(3,i); TARGETS_MAT(2,j),TARGETS_MAT(3,j)];
        d = pdist(X,'euclidean');
        ST_DISTANCE(i,j) = d;
    end
end
end