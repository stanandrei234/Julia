using Plots;
setprecision(10^4)
global Q_1=1;
global theta=0.5;
global gamma=0.5;

struct Valori
    k::BigFloat
    p0::BigFloat
    p1::BigFloat
end

function xk(v::Valori)
    de_return = 0;
    de_return = v.p0>1 ? theta^((v.p0)^(v.k)) : theta^(v.k);
    de_return += v.p1 > 1 ? gamma^((v.p1)^(v.k)) : gamma^(v.k);
end

function Qp0(v::Valori)
return xk(Valori(v.k+1,v.p0,v.p1))/xk(v)^(v.p0);
end

function Q1k_Q1(v::Valori)
return abs(Qp0(v)-Q_1)
end


function calc(v::Valori)
return ln(Q1k_Q1(Valori(v.k+1,v.p0,v.p1)))/ln(Q1k_Q1(v));
end

function ln(x::BigFloat)

return log(exp(1),x)
end

x_array=Array{BigFloat}((2:20))
y_array=[calc(Valori(k,BigFloat(2.0),BigFloat(3.0))) for k in x_array];
#y_array=[calc1(k) for k in x_array];
Plots.plot(x_array,y_array)