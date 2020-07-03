function [SENSORS_MATRIX TARGETS_MATRIX coorX coorY ENERGY] = generate_topology(Nb_Nodes,Nb_Targets,length_field,ENERgy)
SENSORS_MATRIX = zeros(0,0);
TARGETS_MATRIX = zeros(0,0);
coorX = zeros(0);
coorY = zeros(0);
ENERGY = zeros(0);

ID = 1;
XCOOR = 2;
YCOOR = 3;

%++++++++++++++++++++++++++++++++++++++++++++
%       Generate Nodes Position             +
%++++++++++++++++++++++++++++++++++++++++++++
for i=1:Nb_Nodes 
    x = randi(length_field,1,1);
    y = randi(length_field,1,1);
    coorX (i)= x;
    coorY (i)= y;
    SENSORS_MATRIX (ID,i) = i;
    SENSORS_MATRIX (XCOOR,i) = x;
    SENSORS_MATRIX (YCOOR,i) = y;
    ENERGY (i) = ENERgy;
end  
%++++++++++++++++++++++++++++++++++++++++++++
%        Generate Targets Position          +
%++++++++++++++++++++++++++++++++++++++++++++
for j=1:Nb_Targets
    x = randi(length_field,1,1);
    y = randi(length_field,1,1);
    TARGETS_MATRIX (ID,j) = j;
    TARGETS_MATRIX (XCOOR,j) = x;
    TARGETS_MATRIX (YCOOR,j) = y;
end

end