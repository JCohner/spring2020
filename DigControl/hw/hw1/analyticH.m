function y = analyticH(k)
for it = 1:k
   y(it) =  1/2 * ( (-exp(1i*pi/2))^(it-1) + exp(1i*pi/2)^(it-1));
end


