function RES = targets_covered_by_sensor_selected(Selected,Uncvd,ST_DISTANCE,RANGE)
RES = zeros(0);
k = 1;
%ss = sprintf('Targets covered by MAXIMAL PROFIT Sensor %d',Selected);
%disp(ss);
for j=1:length(Uncvd)
    if (ST_DISTANCE(Selected,Uncvd(j)) <= RANGE)
      RES (k) = Uncvd(j);
      k = k+1;
    end
end
end