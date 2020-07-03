function RES = current_sensors_covering_target(Scur,ST_DISTANCE,INDEX_TARGETS,RANGE)
RES = zeros(0);
k = 1;
ss = sprintf('Compute sensors in Scur covering target : %d',INDEX_TARGETS);
disp(ss);
for i=1:length(Scur)
    if (ST_DISTANCE(Scur(i),INDEX_TARGETS) <= RANGE)
        RES (k) = Scur(i);
        k = k+1;
    end
end
end