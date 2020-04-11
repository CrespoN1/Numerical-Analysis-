%this is making a table 
T = [];

format longe 
%this is initializing our value i and setting it equal to 1
i = 1;

%this for loop is starting at 0.99 and incrimenting it by 0.0002 until it
%reaches 1.01 then it will stop running
for x = 0.99:0.0002:1.01
    
    %this is essentially helping to create table/matrix for our function values
    T(i,1) = x;
    T(i,2) = F(x);
    T(i,3) = G(x);
    T(i,4) = H(x);
    
    %this is incrimenting our initial value 
    i = i + 1;

%this is terminating our for loop     
end

%this is creating our vectors for our functions 
xVec = T(:,1);
FVec = T(:,2);
GVec = T(:,3);
HVec = T(:,4);

T1 = table(xVec',FVec',GVec',HVec')

%this is plotting our figue 1 and labeling them
%this plot is comparing our function values to x
figure(1)
plot(xVec,FVec,xVec,GVec,xVec,HVec);xlabel('x');ylabel('Functions');

%the second figure is a zoomed in image of our first figure 
figure(2)
plot(xVec, FVec); hold on; plot(xVec,GVec); plot(xVec,HVec); hold off; xlim([0.999 1.001]); xlabel('x'); ylabel('Functions');

%this is creating our functions and storing them as values 
function val = F(x)

val = x^10 - 10*x^9 + 45*x^8 - 120*x^7 + 210*x^6 - 252*x^5 + 210*x^4 - 120*x^3 + 45*x^2 - 10*x + 1;

%this is terminating our function 
end

%this is creating our function and storing it 
function val2 = G(x)

val2 = 1 + x*(-10 + x*(45 + x*(-120 + x*(210 + x*(-252 + x*(210 + x*(-120 + x*(45 + x*(-10 + x)))))))));

%this is terminating our function 
end

%this is creating our function and storing it 
function val3 = H(x)

val3 = (x-1)^10;

%this is terminating our funciton
end 









