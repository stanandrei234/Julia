using Plots;
setprecision(10^3)
global Q_1=0.5;
global theta=0.5;
global gamma=0.8;

function xk(k::BigFloat)
return theta^k+gamma^((2)^k);
end

function Q1k_Q1(k::BigFloat)
return abs((xk(k+1)/xk(k)));
end

function Qp0_Q1k_Q1(k::BigFloat)
return ln(Q1k_Q1(k))/ln(Q1k_Q1(k-1));
end

function ln(x::BigFloat)
return log(exp(1),x)
end

function calc(k::BigFloat)

    a=abs((0.5^(2^(k+1))-0.5*0.5^(2^k))/(0.5^k+0.5^(2^k)));
    b=abs((0.5^(2^(k))-0.5*0.5^(2^(k-1)))/(0.5^(k-1)+0.5^(2^(k-1))))

    return log2(a)/log2(b)

end  

x_array=Array{BigFloat}((2:20))
y_array=[calc(k) for k in x_array];
#y_array=[calc1(k) for k in x_array];
Plots.plot(x_array,y_array)