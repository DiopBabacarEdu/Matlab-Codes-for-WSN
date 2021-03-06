function [PROB_LIST RESLT SENSOR_ID] = MAXIMUM_PROFIT_NODE(SENSORS,UU,SDM,RANGE,ENERGY_INIT,ENERGY)
%-------------- MAXIMUM PROFIT SENSOR ------------------
PROB_LIST = zeros(0);
SENSORS_LIST = zeros(0);
k = 1;
for i = 1:length(SENSORS)
    SENSORS_LIST(k) = SENSORS(i);
    PROB_LIST(k) = PROBABILITY_OF_(SENSORS(i),UU,SDM,RANGE,ENERGY_INIT,ENERGY);
    k = k+1;
end
[RESLT INDEX] = max(PROB_LIST);
 SENSOR_ID = SENSORS_LIST(INDEX);
end