function val = newton_4d(x)

%this is our error tolerance 
error=10^-10;

%this is incrimenting our values and setting place holders 
k=1;
xn=x;
cur_err = 1;
err2f1(1)=0;

%this is running our newtons method and going to keep running this for loop
%until our current error value is greater than our error value 
while cur_err > error
    x_n(k)= xn - (f_func(xn)./f_der(xn));
    xn = x_n(k);
    cur_err = abs(2-xn);
    errf1(k) = cur_err;
    if k>=2
        err2f1(k) = errf1(k)/errf1(k-1)^2;
    end
    k=k+1;
end

%this is incrimenting our value and setting place holders for our second xn
%value 
k=1;
xn2=x;
cur_err2 = 1;
err2f2(1)=0;

%this while loop is going to keep running until our 2nd current error is
%greater than the error value. 
while cur_err2 > error
    x_n2(k)= xn2 - (2*f_func2(xn2)./f_der2(xn2));
    xn2 = x_n2(k);
    cur_err2 = abs(2-xn2);
    errf2(k) = cur_err2;
      if k>=2
        err2f2(k) = errf2(k)/errf2(k-1)^2;
      end
    k=k+1;
end

%this is incrimenting our values and setting place holders for our values 
k=1;
xn3=x;
cur_err3 = 1;
err2f3(1)=0;

%this while loop is running our newtons method and going to keep running
%while our 3rd errod value is greater than our error value 
while cur_err3 > error
    x_n3(k)= xn3 - (3*f_func3(xn3)./f_der3(xn3));
    xn3 = x_n3(k);
    cur_err3 = abs(2-xn3);
    errf3(k) = cur_err3;
      if k>=2
        err2f3(k) = errf3(k)/errf3(k-1)^2;
      end
    k=k+1;
end

%this is transposing our vector values 
f1_vals = [x_n' errf1' err2f1' ]
f2_vals = [x_n2' errf2' err2f2']
f3_vals = [x_n3' errf3' err2f3']




end

%this is creating the functions that were given and finding their
%derivatives 
function val=f_func(x)
val = x^3 - 8;
end

function val=f_func2(x)
val = (x^3 - 8)^2;
end

function val=f_func3(x)
val = (x^3 - 8)^3;
end

function val=f_der(x)
val = 3*x^2;
end

function val=f_der2(x)
val = 6*x^2*(x^3-8);
end

function val=f_der3(x)
val = 9*x^2*(x^3-8)^2;
end