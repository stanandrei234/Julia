using Plots;
setprecision(10^4)
global limita=BigFloat(1);
global C_1=BigFloat(0.5);

function xk(k)
     return 1+2^(1-k)+1/(k+2)^k;
end

function Q_1(k)
     return (xk(k+1)-limita)/(xk(k)-limita);
end

function R_1(k)
return (abs(xk(k)-limita))^(1/k);
end

function Q_1_de_Q_1(k)
return (Q_1(k+1)-C_1)/(Q_1(k)-C_1)
end

function xxk(k)
a=1/(k+3)^(k+1);
b=1/(2*(k+2)^k);
c=1/(k+2)^k;
d=1/(2*(k+1)^(k-1));
return abs(a-b)/abs(c-d);
end


x_array=Array{BigFloat}((3:30))
y_array=[abs(Q_1(k)-C_1) for k in x_array];
yy_array=[1/(exp(1)*k+2) for k in x_array];
Plots.plot(x_array,y_array)
