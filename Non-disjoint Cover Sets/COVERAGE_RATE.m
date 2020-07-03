function [MIN_COVERAGE AVG_COVERAGE MAX_COVERAGE] = COVERAGE_RATE(COLLECTION,TARGETS,SENSORS_MAT,TARGETS_MAT,SENSING_RANGE,ALPHA,NEIGH)
[NB_SET_COVERS LENGTH_COL] = size(COLLECTION); % how many set covers in the collection ?
ARRAY_COVERAGE = zeros(NB_SET_COVERS);  % initialize the coverage rate array
k = 0; % initialize the counter of ARRAY_COVERAGE
MIN_COVERAGE = 0;
MAX_COVERAGE = 0;
AVG_COVERAGE = 0;
for c_ind=1:NB_SET_COVERS % foreach set cover
    SET_COVER = COLLECTION(c_ind,:); 
    DP_SUM = 0.0;
    k = k+1;
    for t_ind=1:length(TARGETS) % foreach target
        TARGET_INDEX = TARGETS(t_ind);
        NN = sensors_covering_target(TARGET_INDEX,NEIGH);
        NEIGH_SENSORS = intersect(NN,SET_COVER); % sensors in the set cover covering the target
        DETECT_PROBA = OVERALL_DETECTION_PROBABILITY(TARGET_INDEX,NEIGH_SENSORS,SENSORS_MAT,TARGETS_MAT,SENSING_RANGE,ALPHA,NEIGH);
        DP_SUM = DP_SUM + DETECT_PROBA;
    end
    COVERAGE_MEASURE_OF_THIS_COVER = DP_SUM / length(TARGETS);
    ARRAY_COVERAGE (k) = COVERAGE_MEASURE_OF_THIS_COVER;
end
MIN_COVERAGE = min(ARRAY_COVERAGE);
MAX_COVERAGE = max(ARRAY_COVERAGE);
AVG_COVERAGE = mean(ARRAY_COVERAGE);
end