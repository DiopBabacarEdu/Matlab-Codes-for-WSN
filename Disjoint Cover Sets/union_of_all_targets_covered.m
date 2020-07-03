function BOOL = union_of_all_targets_covered(SENSORS,Uncvd,ST_DISTANCE,RANGE,COLLECTION,TARGETS)

RES = zeros(0);
for i=1:length(SENSORS)-1
    P = targets_covered_by_sensor_selected(SENSORS(i),Uncvd,ST_DISTANCE,RANGE);
    RES = union(RES,P);
end
       if length(TARGETS) ~= length(RES)
            disp (COLLECTION);
            RES = zeros(1,length(TARGETS));
            return;
       end  
        
BOOL=1; j=1;
while (BOOL==1 && j<=length(TARGETS))
    disp('-------------------------------------');
    disp(TARGETS(j));
    disp(RES(j));
    disp('-------------------------------------');
    if TARGETS(j)~=RES(j)
        BOOL=0;
    end
    j=j+1;
end
end