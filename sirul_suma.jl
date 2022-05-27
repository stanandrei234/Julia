setprecision(10^6)
global p=exp(1)/(exp(1)-1)
using Plots;

function cₖ(k::BigInt)
   
    s=0;
    for j in range(1,k)
        s=s+(p)^(-j)*1/j;
    end

    return (abs(s-1));

end
function ck(k)
    return cₖ(k);
end

n=100;
x_array=Array{BigInt}((5:n));
# y_array=Array{BigFloat}((1:2));
# y_array=[cₖ(k) for k in x_array];

 y_array=[cₖ(k) for k in x_array]

Plots.plot(x_array,y_array)
