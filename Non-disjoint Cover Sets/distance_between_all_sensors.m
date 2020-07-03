function SENSORS_DISTANCE = distance_between_all_sensors(XCOORs,YCOORs)
SENSORS_DISTANCE = zeros(0,0);
for i=1:length(XCOORs)
    for j=1:length(YCOORs)
        X = [XCOORs(i),YCOORs(i);XCOORs(j),YCOORs(j)];
        d = pdist(X,'euclidean');
        SENSORS_DISTANCE(i,j) = d;
    end
end
end