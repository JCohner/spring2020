T = 0.05;
s = tf('s');
z = tf('z', T);
P = 1/(s*(s+1)*(0.5*s+1));
G = c2d(P,T,'zoh');
D = 1;
% H = minreal(G*D/(1+G*D));

% rlocus(L)

z_lead = 0.9;

p_lead = z_lead/2;

lead_john = (z - z_lead)/(z-p_lead);

D = 0.5 *lead_john;
L = G * D;
H = minreal(G/(1+G*D));
evalfr(D,1)
damp(H);

rlocus(L)