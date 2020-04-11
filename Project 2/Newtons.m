function val = Newtons(x)


err=10^-10;

i=1;
x1=x;

%we are initialzing our current error that we are starting our loop at 
curErr = 1;

%this is a place holder for when we start to initialize it later 
err2f1(1)=0;

%this while loop is going to run as long as the current error is then than
%error
while curErr > err
    
    %this is newtons method at our new iteration 
    Xn(i)= x1 - (func(x1)/der(x1));
    
    %this is setting our previous iteration to be our new value 
    x1 = Xn(i);
    
    %this is calculating the absolute value of our current error value 
    curErr = abs(2-x1);
    
    %this is setting our previous value to our new value 
    errf1(i) = curErr;
    
    %this if statement is going to run when i is greater than or equal to 2  
    if i>=2
        
        %this helps us to determine order of convergence 
        err2f1(i) = errf1(i)/errf1(i-1)^2;
    
    %this is ending the if statment 
    end
    
    %this is incrimenting our value 
    i=i+1;
    
%this is ending our loop
end

%this is initialzing our value 
i=1;

%this is setting our previous iteration to our current one
xn2=x;

%this is a place holder 
curErr2 = 1;

%this is a place holder
err2f2(1)=0;

%this while loop is going to run as long as our currErr2 is greater than
%our err value 
while curErr2 > err
    
    %this is running our newtons method 
    x_n2(i)= xn2 - (2*func2(xn2)/der2(xn2));
    
    %this is setting our previous term to be our next term
    xn2 = x_n2(i);
    
    %this is findind the current error 
    curErr2 = abs(2-xn2);
    
    %this is setting the current error equal to the new error value
    errf2(i) = curErr2;
    
      %this if statement is going to run as long as i is greater than or equal to 2 
      if i>=2
        
        %this error value is helping us with order of convergence 
        err2f2(i) = errf2(i)/errf2(i-1)^2;
        
      %this is ending our loop
      end
    
    %this is incrimenting our value 
    i=i+1;
    
%this is ending our for loop 
end

%this is incrimenting our value 
i=1;

%this is setting our 3rd nx value equal to our current value 
xn3=x;

%this is initializing our value 
curErr3 = 1;

%this is a place holder
err2f3(1)=0;

%this while loop is going to run when our current  
while curErr3 > err
    
    %this is running our newtons method for the 3rd Xn value 
    x_n3(i)= xn3 - (3*func3(xn3)/der3(xn3));
    
    %this is setting our previous value to our new value 
    xn3 = x_n3(i);
    
    %this is finding the current error 
    curErr3 = abs(2-xn3);
    
    %this is setting our curent error value equal to our next error value 
    errf3(i) = curErr3;
    
      %this if statement is going to run when i is greater than or equal to
      %2
      if i>=2
          
        %this is helping us to find convergence value  
        err2f3(i) = errf3(i)/errf3(i-1)^2;
        
      end
      
    %this is incrimenting our value 
    i=i+1;
end
% 
f1_vals = [Xn' errf1' err2f1' ]
f2_vals = [x_n2' errf2' err2f2']
f3_vals = [x_n3' errf3' err2f3']
% 
% 

end

%this is establishing the given functions and their derivatives 
function val=func(x)
val = x^3 - 8;

end

function val=func2(x)
val = (x^3 - 8)^2;
end

function val=func3(x)
val = (x^3 - 8)^3;
end

function val=der(x)
val = 3*x^2;
end

function val=der2(x)
val = 6*x^2*(x^3-8);
end

function val=der3(x)
val = 9*x^2*(x^3-8)^2;
end