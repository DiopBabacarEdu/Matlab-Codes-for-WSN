function RES = number_of_targets_covered_by(SENSOR_INDEX,P)
RES = 0;
[m n] = size(P);
 for j=1:n
    if P(SENSOR_INDEX,j) ~=0
        RES = RES+1;
    end
 end
end