using Plots;
setprecision(10^3)
global limita=BigFloat(0.0);
global C_1=BigFloat(0.25);

function xk(k)
     return 1/(4^k+k);
end

function Q_1(k)
     return (xk(k+1)-limita)/(xk(k)-limita);
end

function Q_1_de_Q_1(k)
return (Q_1(k+1)-C_1)/(Q_1(k)-C_1)
end

x_array=Array{BigFloat}((30:50))
y_array=[Q_1_de_Q_1(k) for k in x_array];
Plots.plot(x_array,y_array)