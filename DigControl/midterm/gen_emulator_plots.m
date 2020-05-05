function gen_emulator_plots(C, H, tstop, T, name, type)
close all
[yH, tH] = step(H, tstop);
linewidth = 2;

plot(tH,yH, 'LineWidth', linewidth + 5)
legend_list = ["analog controller"];
assignin('base', 'tstop', tstop); 

hold on;

params_met = 1;

it_counter = 0;

while(params_met)
    D = c2d(C,T,type);
%     wc = 20.7; %assuming radians here
%     D = c2d(C,T, c2dOptions ('Method','tustin','PrewarpFrequency',wc));
%     z = tf('z', T);
% %     back diff
%     s = (z-1)/(T * z);
% %     forward diff
%     s = (z-1)/(T);
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
    
    
    T_prev = T;
    if (respinfo.SettlingTime > 1.0 || respinfo.RiseTime > 0.1 || respinfo.Overshoot > 25)
    %if (respinfo.SettlingTime > tstop - 0.6 * tstop)
          params_met = 0;
          %break;
    else 
        if (mod(it_counter, 2) == 0)
            T = T * 2.5;
        else 
            T = T * 2;
        end
    end
    it_counter = it_counter + 1;
    plot(t,y, 'LineWidth', linewidth)
    legend_list(end+1) = sprintf("T = %0.5f", T_prev); 
    fprintf(legend_list(end))
    fprintf("\n"); 
    
%     if (T < 0.00001)
%         break;
%     end
    
    if (T> 10)
        break;
    end

end


legend(legend_list)
title( name + " unit step response vs sampling time")
xlabel("time")
ylabel("y(t)")
hold off
