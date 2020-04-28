function gen_emulator_plots(C, H, tstop, Tarr)
[yH, tH] = step(H, tstop);
linewidth = 3;

plot(tH,yH, 'LineWidth', linewidth)
legend_list = ["analog controller"];
assignin('base', 'tstop', tstop); 

hold on;

for i = (length(Tarr):-1:1)
    D = c2d(C,Tarr(i),'foh');
    assignin('base', 'D', D);
    out = sim("analog_emulators");
    t = out.ScopeData(:,1);
    y = out.ScopeData(:,2);
    plot(t,y, 'LineWidth', linewidth)
    legend_list(end+1) = sprintf("T = %0.5f", Tarr(i)); 
    fprintf(legend_list(end))
    fprintf("\n");
    respinfo = stepinfo(t,y,1.0, 'SettlingTimeThreshold', 0.01);
    
    
end

legend(legend_list)
% axis([0 3 0 10]);
title("ramp invaraince unit ste response vs sampling time")
xlabel("time")
ylabel("y(t)")
hold off
