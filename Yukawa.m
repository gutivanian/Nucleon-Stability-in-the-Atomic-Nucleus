function Hamiltonian = Yukawa(x)
h = length(x);
V = 0;
e = 1.6e-19;
eps = 8.85e-12;
k = 1/(1e-15);
g = 10e-3;
for i = 1:h
    for j = 1:h;
        if j ~= i;
            V = V + 1e-4^2*exp(k*abs(x(i)-x(j)))/abs(x(i)-x(j));
        else
            V = V;
        end
    end
end
Hamiltonian = V;
Vc = 0;
for i = 1:h
    for j = 1:h
        if j ~= i
            if mod(j,2) == 0
                if mod(i,2) == 0;
                    Vc = Vc + e^2/(4*pi*eps*abs(x(i)-x(j)));
                else 
                    Vc = Vc;
                end
            else
                Vc = Vc;
            end
        else
            Vc = Vc;
        end
    end
end
Hamiltonian = V+Vc;