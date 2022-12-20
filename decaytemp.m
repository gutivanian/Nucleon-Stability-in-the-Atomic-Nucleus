function T=decaytemp(T0,decay,ii,cs)
T=T0*exp(-decay*(ii-1)^cs);
end