function val = newton(x,B,n)

%this is initializing our incriments 
i=1;
Xn=x;

%this while loop is going to run as long as our incriment is less than our
%iterations 
while i<=n
    
    %this is calculating our newtons method 
    nextX(i)= Xn - (func(B,Xn)/derivative(B,Xn));
    
    %this is setting our iteration that we calculated to our next Xn
    Xn = nextX(i);
    
    %this is our counter 
    i=i+1;
    
%this is ending our loop 
end

%this is transposing our matrix 
val = nextX';

%this is ending our for loop  
end
 

function val=func(B,x)

%this is the given fucntion 
val = x + exp(-B*x^2)*cos(x);

end

function val=derivative(B,x)

%this is the given functions derivative 
val = 1 - exp(-B.*x^2)*(2*B*x*cos(x) + sin(x));


end