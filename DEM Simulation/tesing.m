close all
clc
NB_NODES = 100; NB_TARGETS = 10; ENERGY_INIT = 5; t = cputime;

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