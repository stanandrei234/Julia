using Plots;
include("functii_utile.jl");
setprecision(10^6)
global x1=BigFloat(33958);
global x2=3.9979242176144856e-5;
global a=BigFloat(1112798796);



function xk1(k)

    errori=Vector{BigFloat}();
    previous=BigFloat(x1);
    next=BigFloat(x1);                   
    
    for i=1:k
        next=1/2*(previous+a/previous);
        if(abs(next-previous)<10^(-2))
            push!(errori,abs(next-previous));
        end
        previous=BigFloat(next);
        
    end

    return errori;

end

function xk2(k)


   
    errori=Vector{BigFloat}();
    previous=BigFloat(x2);
    next=BigFloat(x2);
    for i=1:k
        next=previous+0.5*previous*(1-a*previous^2);
       
    
        if(abs(a*next-a*previous)<10^(-2))
            push!(errori,abs(a*next-a*previous));
        end
       

        previous=BigFloat(next);
        
    end

    return errori;
  


end
function ln(x::BigFloat)

    return log(exp(1),x)

end

function obtine_Q(error)
    

    QΛ=Vector{BigFloat}();
    k=2;
    ultimul_index=lastindex(error);

    while (k<ultimul_index) #cat timp k+1<= ultimul element din erori
        
        eₖ₋₁=getindex(error,k-1);
        eₖ=getindex(error,k);
        eₖ₊₁=getindex(error,k+1);


        push!(QΛ,abs(ln(eₖ₊₁/eₖ)/(ln(eₖ/eₖ₋₁))-2));

        k=k+1;

    end

    return QΛ;

end     

function obtine_Q_L(error)
    

    QL=Vector{BigFloat}();
    k=1;
    ultimul_index=lastindex(error);

    while (k<ultimul_index) #cat timp k+1<= ultimul element din erori
        
        eₖ=getindex(error,k);
        eₖ₊₁=getindex(error,k+1);

        push!(QL,abs(ln(eₖ₊₁)/(ln(eₖ))));

        k=k+1;

    end

    return QL
end



k=20;
AAA=xk1(k);
BBB=xk2(k);
# AA=obtine_Q(AAA);
# BA=obtine_Q(BBB);

# A=obtine_Q_L(AA);
# B=obtine_Q_L(BB)
# plot(xlabel = "x", ylabel = "f(x)",xlims = (0,Inf), ylims = (-Inf, 1)); 
# x_array=Array{Int}((1:size(A,1))); 
#  xx_array=Array{Int}((1:size(B,1))); 
#  gr()
#  plot!(x_array,A,label = "X1")
#  plot!(xx_array,B,label = "X2")

 #vrem sa facem plotul raportului erorilor. 
 #Asa ne dam seama daca acei theta sunt sau nu diferiti

 CCC=[getindex(AAA,i)/getindex(BBB,1)  for i in range(1,min(size(AAA,1),size(BBB,1)))]
 x_index=Array{Int}((1:size(CCC,1)));
 plot(xlabel = "x", ylabel = "f(x)",xlims = (0,Inf), ylims = (-Inf, 1)); 
 plot!(x_index,CCC,label = "raport erori")

 preety_print(CCC);