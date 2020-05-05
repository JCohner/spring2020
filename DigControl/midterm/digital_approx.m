%use the 7 methods we learned in class to create 7 emulated digital
%controllers based on our analog controller
analog_controller();
samp_periods = [.1 .01];

%step invariance
D_step_0_1 = c2d(C,0.1,'zoh');
D_step_00_1 = c2d(C,0.01,'zoh');

%ramp invariance 
D_ramp_0_1 = c2d(C,0.1,'foh');
D_ramp_00_1 = c2d(C,0.01,'foh');

%matched pole zero
D_matc_0_1 = c2d(C,0.1,'matched');
D_matc_00_1 = c2d(C,0.01,'matched');

%Tustin / bilinear
D_tust_0_1 = c2d(C,.1,'tustin ');
D_tust_00_1 = c2d(C,.01,'tustin ');

%Tustin with frequency pre-warping
wc = 20.7; %assuming radians here
D_prew_0_1 = c2d(C,.1, c2dOptions ('Method','tustin','PrewarpFrequency',wc));
D_prew_00_1 = c2d(C,.01, c2dOptions ('Method','tustin','PrewarpFrequency',wc));

%difference subs
%backward difference
z = tf('z', 0.1);
s = (z-1)/(0.1 * z);
Kp = 100; 
Ki = 1 / s;
Kd = 20 * s;
D_back_0_1 = Kp + Kd + Ki; 

z = tf('z', 0.01);
s = (z-1)/(0.01 * z);
Kp = 100; 
Ki = 1 / s;
Kd = 20 * s;
D_back_00_1 = Kp + Kd + Ki; 


%forward difference
z = tf('z', 0.1);
s = (z-1)/(0.1);
Kp = 100; 
Ki = 1 / s;
Kd = 20 * s;
D_forward_0_1 = Kp + Kd + Ki;

z = tf('z', 0.01);
s = (z-1)/(0.01);
Kp = 100; 
Ki = 1 / s;
Kd = 20 * s;
D_forward_00_1 = Kp + Kd + Ki;

%bode plots
% 
figure()
bode(C, D_step_0_1);
title("Bode Plot: Step Invariance; T = 0.1")
figure()
bode(C, D_step_00_1);
title("Bode Plot: Step Invariance; T = 0.01")

figure()
bode(C, D_ramp_0_1);
title("Bode Plot: Ramp Invariance; T = 0.1")
figure()
bode(C, D_ramp_00_1);
title("Bode Plot: Ramp Invariance; T = 0.01")

figure()
bode(C, D_matc_0_1);
title("Bode Plot: Matched; T = 0.1")
figure()
bode(C, D_matc_00_1);
title("Bode Plot: Matched; T = 0.01")

figure()
bode(C, D_tust_0_1);
title("Bode Plot: Tustin; T = 0.1")
figure()
bode(C, D_tust_00_1);
title("Bode Plot: Tustin; T = 0.01")

figure()
bode(C, D_prew_0_1);
title("Bode Plot: Tustin Pre-Warp; T = 0.1")
figure()
bode(C, D_prew_00_1);
title("Bode Plot: Tustin Pre-Warp; T = 0.01")

figure()
bode(C, D_back_0_1);
title("Bode Plot: Backward Diff; T = 0.1")
figure()
bode(C, D_back_00_1);
title("Bode Plot: Backward Diff; T = 0.01")

figure()
bode(C, D_forward_0_1);
title("Bode Plot: Forward Diff; T = 0.1")
figure()
bode(C, D_forward_00_1);
title("Bode Plot: Forward Diff; T = 0.01")

