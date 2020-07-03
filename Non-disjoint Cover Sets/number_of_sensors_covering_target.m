function RES = number_of_sensors_covering_target(INDEX_TARGET,N)
RES = 0;
[m n] = size (N);
for i=1:n
    if N(INDEX_TARGET,i) ~= 0
        RES = RES + 1;
    end
end
end