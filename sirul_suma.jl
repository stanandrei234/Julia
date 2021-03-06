
setprecision(10^6)
global p=BigFloat(2) ; #C:\Julia-1.7.2\Julia cod\sirul_suma.jl
using Plots;
global mu=0.5;
function suma(k::BigInt)
   
    s=BigFloat(0);
    for j in range(1,k)
        s=s+1/p^j*1/j;
    end

    return abs(s);

end

function ln(k::BigInt)
    return log(exp(1),k);
end

function p_la_k_inmultiat_cu_suma(k)
    s=BigFloat(0);
    for j in range(1,k)
        s=s+1/p^j*1/j;
    end

    return abs(s-ln(BigInt(2)))*p^k;
end


function ck(k)
return p^k*(abs(suma(k)-1))
end

function xk(k)
return mu^(p^k*suma(k));
end

function Q_L(k)
return log2(xk(k+1))/log2(xk(k))
end

function rk(k::BigInt)
return (xk(k))^(1/p^k)
end


n=50;
x_array=Array{BigInt}((10:n));
# y_array=Array{BigFloat}((1:2));
# y_array=[cₖ(k) for k in x_array];

 y_array=[p_la_k_inmultiat_cu_suma(k) for k in x_array]

Plots.plot(x_array,y_array)
