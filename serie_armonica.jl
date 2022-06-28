using Plots;
setprecision(10^3)


function suma()
    x_array=Array{Int}((1:5));
    y_array=Vector{BigFloat}();
    s=BigFloat(0);
    for k in x_array
   
        for i in (10^(k-1):10^k-1)
             s=s+BigFloat(1)/BigFloat(i)^BigFloat(2);
        end
       
    
        push!(y_array, log10(abs(BigFloat(s)-BigFloat(pi^2/6)) ));
    
    end
    return y_array;

end
x_array=Array{Int}((1:5));
y_array=suma();

#y_array=[calc1(k) for k in x_array];
Plots.plot(x_array,y_array)