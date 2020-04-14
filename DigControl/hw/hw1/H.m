function y = H(u)

L = length(u);
y = zeros(1,L);
x_k_minus_1 = 0;
x_k_minus_2 = 0;
u_k_minus_1 = 0;
u_k_minus_2 = 0;

for k = 1:L
x_k = -x_k_minus_2 + u_k_minus_2 ;
y(k) = -x_k + x_k_minus_1 + u(k) - u_k_minus_1 ;
x_k_minus_2 = x_k_minus_1 ;
x_k_minus_1 = x_k;
u_k_minus_2 = u_k_minus_1 ;
u_k_minus_1 = u(k);
end