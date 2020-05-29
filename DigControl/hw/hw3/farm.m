s = tf('s');
T = 0.6;
% xed = (2 /(s+0.5) * 0.04)/(1 + 2 /(s+0.5) * 0.04)
% evalfr(xed,0)
P = 2 /(s+0.5) * 0.04;
G = c2d(P,T,'zoh');

% rltool(G)
rlocus(G)

D = 1;
H = minreal(G*D/(1+G*D));

