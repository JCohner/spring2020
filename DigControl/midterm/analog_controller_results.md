# Compensator Design and Response

## Design: 
I used a PID controller:
```
Kp = 100; tau = .001;

causal_s = s/(tau*s + 1);

Ki = 1 / causal_s;
Kd = 20 * causal_s;
C = Kp + Kd + Ki; %
```

Causal s was substituted for the normal laplace complex frequency variable s to ensure that the system had the same number of poles and zeros. Since we are using both D and I terms this is not totally necessary, but it allows for some robustness in future designs.

## Result
Steady state error: 0
Rise time: 0.0723
1% Settling time: 0.5362
Overshoot Peak: 1.1243, ~12.5%  