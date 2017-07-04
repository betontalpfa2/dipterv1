
stationary

om1 = om_supply;
om2 = om_rotor;
s = (om1-om2)/om1
Us = u(1);

a = Lm/Lr;
sigma = 1- Lm*Lm/(Lr*Ls);

Rrr = Rr *a*a;
Lmr = (1-sigma)*Ls;
Llsr = sigma*Ls;

R_mul = (Rrr/s*1i*om1*Lmr);
R_add = (Rrr/s+1i*om1*Lmr);

Urr = Us*R_mul/(R_add*(Rs+1i*om1*Llsr)+R_mul);

istat2 = ((Us-Urr)/(Rs+1i*om1*Llsr))

psyi = abs(Urr/om1/1i)/a