function COLLECTION = PROBABLITY_SIMULATION(NB_NODES_F,NB_TARGETS_F,LENGTH_FIELD_F,SENSORS_MATRIX,TARGETS_MATRIX,ENERGY_INIT,ENERGY,RUNTIME)
NB_NODES = NB_NODES_F; % Number of Sensors
NB_TARGETS = NB_TARGETS_F;   % Number of Targets
SENSORS_ID = zeros(0);
TARGETS_ID = zeros(0);
SENSING_RANGE = 50; % Set the sensing range 
LENGTH_FIELD = LENGTH_FIELD_F; % Field's dimensions
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%               Generate random topology with NB_NODES nodes       
%                   SENSORS_MATRIX = Initial Sensors Set
%                   TARGETS_MATRIX = Initial Targets Set
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%[SENSORS_MATRIX TARGETS_MATRIX XCOORs YCOORs ENERGY] = generate_topology(NB_NODES,NB_TARGETS,LENGTH_FIELD);
for s_ind=1:length(SENSORS_MATRIX)
    SENSORS_ID(s_ind) = SENSORS_MATRIX(1,s_ind);
end
for t_ind=1:length(TARGETS_MATRIX)
    TARGETS_ID(t_ind) = TARGETS_MATRIX(1,t_ind);
end
ST_DISTANCE = distance_sensors_targets(SENSORS_MATRIX,TARGETS_MATRIX); % Compute distances between sensors & targets
N = NEIGHBOURS_SENSORS(ST_DISTANCE,SENSING_RANGE,NB_TARGETS); % Foreach target the subset of sensors covering it
P = POINT_COVERAGE(ST_DISTANCE,SENSING_RANGE,NB_NODES); % Foreach sensor the subset of targets it covers
disp(N); disp(P);
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%                                SET UP PHASE
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SENSORS=SENSORS_ID;         % List of sensors
TARGETS=TARGETS_ID;         % List of targets
%POINTS_COV=P;              % Sensor-Target mapping
COLLECTION = zeros(0,0);    % Initialize Cover sets
Scur = SENSORS;
kk=1;
INDEX_TEST = 1;
while (union_of_all_targets_covered(Scur,TARGETS,ST_DISTANCE,SENSING_RANGE,COLLECTION,TARGETS) == TARGETS)
    UU = TARGETS;
    Ck = zeros(0);
while ~isempty(UU) 
    [PROBABILITIES RESLT Selected] = MAXIMUM_PROFIT_NODE(Scur,UU,ST_DISTANCE,SENSING_RANGE,ENERGY_INIT,ENERGY);
    disp(PROBABILITIES);
    xx = sprintf('Probabilité maximale = %f',RESLT); disp(xx);
    yy = sprintf('Selected Sensor =%d',Selected); disp(yy);
    Ck = union(Ck,Selected);  % Add the selected sensor to the current set cover
    Targets_to_removed = TARGETS_of_Selected_Sensor(Selected,TARGETS,ST_DISTANCE,SENSING_RANGE);
    disp('Targets to remove :'); disp(Targets_to_removed);
    if isempty(UU)
        return;
    end
    UU = setdiff(UU,Targets_to_removed); % Remove covered targets by Selected from the current target set
    %Scur = setdiff(Scur,Selected);
    disp(UU); INDEX_TEST = INDEX_TEST + 1;
    
end
for l=1:length(Ck)
    COLLECTION (kk,l) = Ck (l);
end
%--------------------------------------------------------------------------
%                      UPDATE SENSORS LIFETIMES
%--------------------------------------------------------------------------
for s_compt=1:length(Ck)
    ENERGY(Ck(s_compt)) = ENERGY(Ck(s_compt)) - RUNTIME;
    if ENERGY(Ck(s_compt))<=0
        Scur = setdiff(Scur,Ck(s_compt));
    end
end
disp('ENERGY :');
disp(ENERGY);

kk = kk+1; 
end
disp(COLLECTION);
disp('SENSORS REMAINING :'); disp(Scur);
disp(ENERGY);