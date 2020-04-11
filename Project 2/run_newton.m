function run_newton()

%this is creating our B vector from which we will call from
B = [1 5 10 25 50];

%this is evenly spacing out our given points 
x = linspace(1, 20, 20);

%this is calculating the iterations for each B value and X0 = 0
oldB1 = newton(0, B(1), 20);
oldB5 = newton(0, B(2), 20);
oldB10 = newton(0, B(3), 20);
oldB25 = newton(0, B(4), 20);
oldB50 = newton(0, B(5), 20);

%this puts the values in a matrix 
K=[oldB1 oldB5 oldB10 oldB25 oldB50]

%this is calculating the iterations for each B value and X0 = -0.5
newB1 = newton(-0.5, B(1), 20);
newB5 = newton(-0.5, B(2), 20);
newB10 = newton(-0.5, B(3), 20);
newB25 = newton(-0.5, B(4), 20);
newB50 = newton(-0.5, B(5), 20);

%this plots the X0 = 0 
figure(1)
hold on
plot(x,oldB1,'b',x,oldB5,'r',x,oldB10,'k',x,oldB25,'c',x,oldB50,'g')
legend('oldB1','oldB5','oldB10','oldB25','oldB50')
xlabel('Xn')
ylabel('Iteration')
hold off

%this plots the x0 = -0.5
figure(2)
hold on
plot(x,newB1,'b',x,newB5,'r',x,newB10,'k',x,newB25,'c',x,newB50,'g')
legend('newB1','newB5','newB10','newB25','newB50')
xlabel('Xn')
ylabel('Iteration')
hold off

%this is spacing out our given values evenly 
xVec = linspace(-1, 0, 100);

%this is going to run for 100 iterations 
for i = 1:100
        
        %this is calculating the function values from -1 to 0
        actualF(i) = f_func(1,xVec(i));

%this is ending our for loop 
end

%this is plotting our figure 
figure(3)
hold on
plot(xVec,actualF,'k')
legend('f(x)')
xlabel('X-value')
ylabel('Function Value')
hold off

end

%this is creating our function and setting it eqaul to val so that we can
%use it later on in our code
function val=f_func(B,x)

%this is our given function 
val = x + exp(-B*x.^2).*cos(x);

end

%Note that Vasilia wrote a vast majority of this code that is why the
%structure is the same 