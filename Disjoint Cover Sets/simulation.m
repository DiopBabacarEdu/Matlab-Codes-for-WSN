close all
clear all
clc
NB_NODES = 100;
NB_TARGETS = 20;
LENGTH_FIELD = 30;
ENERGY_INIT = 5;
RUNTIME = 1;

RESULT_SP = zeros(0,0);
RESULT_PP = zeros(0,0);
RESULT_ZB = zeros(0,0);
NODES_TO_SIMULATE =  [10 ];
RANGE = [ 50 100 150 200 250 300];
NODES = [50 100];
TARGETSS = [5];
MIN_COVERAGE = 0;
MAX_COVERAGE = 0;
AVG_COVERAGE = 0;

k_sp = 1;
k_zb = 1;
k_pp = 1;
k_cr = 1;
for i_sp = 1:length(NODES_TO_SIMULATE)
    MIN_COV_RATE = zeros(0);
    MAX_COV_RATE = zeros(0);
    AVG_COV_RATE = zeros(0);
    AVG_ARRAY_MP = zeros(0); RES_MP = zeros(0); 
    AVG_ARRAY_ZB = zeros(0); RES_ZB = zeros(0);
    AVG_ARRAY_PP = zeros(0); RES_PP = zeros(0);
    k_avg = 1;
    for i_avg=1:3
        [SENSORS_MATRIX, TARGETS_MATRIX, XCOORs, YCOORs, ENERGY] = generate_topology(NODES_TO_SIMULATE(i_sp),TARGETSS(1),LENGTH_FIELD,ENERGY_INIT);
        [RESULT_MP, MIN_COVERAGE, AVG_COVERAGE, MAX_COVERAGE] = DISJOINT_MPTC_SIMULATION(NODES_TO_SIMULATE(i_sp),TARGETSS(1),LENGTH_FIELD,SENSORS_MATRIX,TARGETS_MATRIX,ENERGY_INIT,ENERGY,RUNTIME);
        disp(size(MIN_COVERAGE));
        %a = sprintf('MINIMUM COVERAGE : %f',MIN_COVERAGE(1));disp(a);
        %b = sprintf('MAXIMUM COVERAGE : %f',MAX_COVERAGE(1)); disp(b);
        %c = sprintf('AVG COVERAGE : %f',AVG_COVERAGE(1)); disp(c);
       
        %RESULT_PP = PROBABLITY_SIMULATION(NODES_TO_SIMULATE(i_sp),TARGETSS(1),LENGTH_FIELD,SENSORS_MATRIX,TARGETS_MATRIX,ENERGY_INIT,ENERGY,RUNTIME);
        %RESULT_ZB = ZORBAS_SIMULATION(NODES_TO_SIMULATE(i_sp),TARGETSS(1),LENGTH_FIELD,SENSORS_MATRIX,TARGETS_MATRIX);
        %MIN_COV_RATE (k_avg) = MIN_COVERAGE(1);
        %MAX_COV_RATE (k_avg) = MAX_COVERAGE(1);
        %AVG_COV_RATE (k_avg) = AVG_COVERAGE(1);
        
        AVG_ARRAY_MP (k_avg) = length(RESULT_MP);
        AVG_ARRAY_ZB (k_avg) = length(RESULT_ZB);
        AVG_ARRAY_PP (k_avg) = length(RESULT_PP);
        k_avg = k_avg+1;
    end
    RES_MP (k_sp) = mean(AVG_ARRAY_MP);
    RES_ZB (k_zb) = mean(AVG_ARRAY_ZB);
    RES_PP (k_pp) = mean(AVG_ARRAY_PP); 
    RES_MIN_COV_RATE (k_cr) = mean(MIN_COV_RATE);
    RES_MAX_COV_RATE (k_cr) = mean(MAX_COV_RATE);
    RES_AVG_COV_RATE (k_cr) = mean(AVG_COV_RATE);
    k_sp = k_sp+1;
    k_zb = k_zb+1;
    k_pp = k_pp+1;
    k_cr = k_cr+1;
end
%disp('PROBABILITY_SIM'); disp(size(RESULT_PP)); disp(RESULT_PP);
%disp('SLIJEPCEVIC_SIM'); disp(size(RESULT_SP)); disp(RESULT_SP);
%disp('ZORBAS_SIM'); disp(size(RESULT_ZB)); disp(RESULT_ZB);
disp('Mean of computed cover-sets :');
disp('---------------------------------------------------------------');
aa = sprintf('MPTC ALGORITHM RESOLUTION : %f',RES_MP);disp(aa); 
disp(size(RESULT_MP)); disp(RESULT_MP);
disp('---------------------------------------------------------------');
bb = sprintf('PROBABILITY ALGORITHM RESOLUTION : %f',RES_PP);disp(bb); 
disp(size(RESULT_PP)); disp(RESULT_PP);

plot(NODES_TO_SIMULATE,RES_MIN_COV_RATE,'g',NODES_TO_SIMULATE,RES_MAX_COV_RATE,'b',NODES_TO_SIMULATE,RES_AVG_COV_RATE,'r');
%plot(NODES_TO_SIMULATE,RES_MP,'g',NODES_TO_SIMULATE,RES_PP,'b');