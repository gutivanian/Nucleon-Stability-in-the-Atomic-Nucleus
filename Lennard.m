function Lendjon = Lennard(r)
h = length(r)
V0 = 0.97;
s = 3.4;
V = 0
 
for i = 1:h
    for j = 1:h
        if i ~= j;
            V = V+4*V0*((s/abs(r(i)-r(j)))^12-(s/abs(r(i)-r(j)))^6);
        else 
            V = V;
        end
    end
end
Lendjon = V;