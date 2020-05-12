%ZOH Equivalent of P
T = 0.1;
s = tf('s');
z = tf('z', T);
P = 3/(s + 2);
G = c2d(P,T,'zoh');
% D = 2;
D = 2 + (0.2 * z)/(z-1);

E = -G / (1 + D * G) * z /(z-1);
[Num, Den] = tfdata(E);
syms z
E_sym = poly2sym(cell2mat(Num), z)/poly2sym(cell2mat(Den), z)
subs(E_sym, z, 1)
