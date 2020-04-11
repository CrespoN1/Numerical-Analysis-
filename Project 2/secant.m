function val = secant(x0,x1,n)

%this is making sure our digits have up to 15 digits of accuracy 
format longe

%this is incrimenting our value starting at 3
i=3;

%this saves our inital interval values in our itterate vectors 
xn(1)=x0;
xn(2)=x1;

%calculates the error at the given inital points 
absErr(1)=((1-sqrt(3))-xn(1));
absErr(2)=((1-sqrt(3))-xn(2));

%these are place holders
err1(1) = 0;
err1(2) = 0;
err2(1) = 0;
err2(2) = 0;

%this while loop is going to run for n+3 iterations so for 20 iterations 
while i<=n+3
    
    %this is calculating our xn value and pulling from the function we made
    %at the bottom
    xn(i)= xn(i-1) - ((func(xn(i-1))*(xn(i-1)-xn(i-2)))/(func(xn(i-1))-func(xn(i-2)) ) );
    
    %this is calculating the absolute error of our iteration 
    absErr(i) = ((1-sqrt(3))-xn(i));
    
    %this is helping us with determining order of convergence 
    err1(i) = absErr(i)/absErr(i-1);
    
    err2(i) = absErr(i)/absErr(i-1)^2;
    
    %this is incrimenting our value 
    i=i+1;
   
%this is ending the loop
end

%this is transposing our values 
val =[ xn' absErr' err1' err2'];

%this is evenly spacing out our given values 
xVec = linspace(x0, x1, 100);

%this for loop is going to run for 100 iterations
for i = 1:100
        
        %calculates the value of the function for the x-value and stores in
        %a vector.  
        act_f(i) = func(xVec(i));
    
%this is ending the for loop        
end

%this is plotting my graph 
figure(1)
hold on
plot(xVec,act_f,'k')
legend('f(x)')
xlabel('X-value')
ylabel('Function Value')
hold off

end


function val=func(x)

%this is our given function 
val = x.^3 + x.^2 - 8.*x - 6;
end