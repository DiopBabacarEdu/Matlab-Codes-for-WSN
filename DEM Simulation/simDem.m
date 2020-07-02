close all
clc
NB_NODES = 90; NB_TARGETS = 10; ENERGY_INIT = 5; RUNTIME=2.5; t = cputime;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               GEO DATA HANDLING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alt  = ncread('geo_coordinates.nc','altitude');
lon  = ncread('geo_coordinates.nc','longitude');
lat  = ncread('geo_coordinates.nc','latitude');
lMin=3901; lMax=4000; N=lMax-lMin; RANGE = N/8;
alt = alt(lMin:lMax,lMin:lMax); 
lat = lat(lMin:lMax,lMin:lMax);
lon = lon(lMin:lMax,lMin:lMax);
topo = zeros(N,N);
topoMeg = zeros(N,N); topoMegALL = zeros(N,N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               TOPOLOGY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[SENSORS_MATRIX, TARGETS_MATRIX] = generate_topology(NB_NODES,NB_TARGETS,N,ENERGY_INIT);
[RESULT_MP, MIN_COVERAGE, AVG_COVERAGE, MAX_COVERAGE] = DISJOINT_MPTC_SIMULATION(NB_NODES,NB_TARGETS,N,SENSORS_MATRIX,TARGETS_MATRIX,ENERGY_INIT,ENERGY,RUNTIME);
C=1;
alpha = 1/10;
R_th = 0; 
Gamma = 1;
Fii = 2;

%iLog=int16(numberOfArrays/2);

    for j=1:NB_NODES 
        xrand = SENSORS_MATRIX(2,j);
        yrand = SENSORS_MATRIX(3,j);
        xx = sprintf('Sensor %d',j); disp(xx);
        %tMatrix(p,q) = 0;
        for p=1:N
            for q=1:N
                [arclen,az] = distance(lat(p,q),lon(p,q),lat(xrand,yrand),lon(xrand,yrand));
                topo(p,q) = arclen;
                %topoMeg(p,q) = C/topo(p,q)^alpha; % Function calculation
                %topoMeg(p,q) = exp(alpha*(-topo(p,q))-R_th); % Altinel function calculation
                topoMeg(p,q) = exp(alpha*(-topo(p,q))); % Zou and
                %topoMegALL = topoMegALL+topoMeg;
                %tMatrixAltinel{i,j}(p,q) = exp(alpha*(-r{i,j}(p,q))-R_th); % Altinel function calculation
                %tMatrixZhou{i,j}(p,q) = exp(alpha*(-r{i,j}(p,q))); % Zou and
                
            end
        end   
        topoMegALL = topoMegALL+topoMeg;
        
    end

%imagesc(topoMeg);
imagesc(topoMegALL);

  

