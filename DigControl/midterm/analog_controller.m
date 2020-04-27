close all;
P = tf(1, [1 .2 1]);
s = tf('s');
Kp = 100; tau = .001;

causal_s = s/(tau*s + 1);

Ki = 1 / causal_s;
Kd = 20 * causal_s;
C = Kp + Kd + Ki; %
H = feedback(C*P, 1)
figure()
rlocus(H)
figure()
step(H)
stepinfo(H, 'SettlingTimeThreshold', .01)
1 - dcgain(H)
figure()
margin(C*P)