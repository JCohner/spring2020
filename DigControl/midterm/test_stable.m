function test_stable(C, H, tstop, T, name, type)
close all
assignin('base', 'tstop', tstop); 
% D = c2d(C,T,type);
    wc = 20.7; %assuming radians here
    D = c2d(C,T, c2dOptions ('Method','tustin','PrewarpFrequency',wc));
%     z = tf('z', T);
% % %     back diff
%     s = (z-1)/(T * z);
% % %     forward diff
% %     s = (z-1)/(T);
%     Kp = 100; 
%     Ki = 1 / s;
%     Kd = 20 * s;
%     D = Kp + Kd + Ki; 
    D = minreal(D);
    assignin('base', 'D', D);
    out = sim("analog_emulators");
    t = out.ScopeData(:,1);
    y = out.ScopeData(:,2);
    respinfo = stepinfo(y,t, 'SettlingTimeThreshold', 0.01) 
    plot(t,y, 'LineWidth', 3)