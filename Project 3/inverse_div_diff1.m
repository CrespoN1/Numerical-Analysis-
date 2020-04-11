function val = inverse_div_diff1(n)

%Part A
%this is creating space for our graph
x=linspace(0,1,100);

%this is setting the derivative 
f=x-exp(-x);

%this is taking the derivative and making sure it satisfies 
fprime=1+exp(-x);

%this is plotting the graph 
figure(1)
hold on
plot(x,f,'k', x, fprime,'m')
legend('F', 'F-Prime')
xlabel('Xn')
ylabel('Function Value')
hold off


%Part B

%this is creating space for our graph
B0=linspace(-1,1,n+1);

%this is creating place holders
B1=zeros(1,n+1);
B2=zeros(1,n+1);
B3=zeros(1,n+1);
B4=zeros(1,n+1);

%this for loop is going to run up till n+1 iterations 
for k=1:n+1
   
    %this is creating a new vector and calling from or B0 value
    x1(k)=f(B0(k));
    
end

%this is inititialzing our incriment value 
j=1;

%this while loop is going to run as long as j is less than or equal to n
while j<=n
    
    %this if statement is if j equals 1 then this divided difference occurs
    if j==1
        for k=1:4
            B1(k) = (B0(k+1) - B0(k))/(x1(k+1) - x1(k));
        end
        j=2;
    end
    
    %if j equals 2 then this portion of the divided difference occurs
    if j==2
        for k=1:3
            B2(k) = (B1(k+1) - B1(k))/(x1(k+2) - x1(k));
        end
        j=3;
    end
    
    %if j equals 3 then this portion of the divided difference occurs
    if j==3
        for k=1:2
            B3(k) = (B2(k+1) - B2(k))/(x1(k+3) - x1(k));
        end
        j=4;
    end
   
   %if j equals 4 then this portion of the divided difference occurs
   if j==4
        for k=1
            B4(k) = (B3(k+1) - B3(k))/(x1(k+4) - x1(k));
        end
        j=5;
    
    %this is incrimenting our j value 
    j=n+1;
end
    %this is transpossing our vectors 
    val=[B0' B1' B2' B3' B4'];
    
    %this is incrimenting our k value 
    k=0;
    
    %this is creating our function for the divided difference 
    P1 = val(1,1) + val(1,2)*(0 - x1(1) ) + val(1,3)*(0 - x1(1) )*(0 - x1(2) ) + val(1,4)*(0 - x1(1) )*(0 - x1(2) ) *(0 - x1(3) )  + val(1,5)*(0 - x1(1) )*(0 - x1(2) ) *(0 - x1(3) )*(0 - x1(4) )    
    
    %this is setting our previous term equal to our new term 
    f1 = f(P1)
end
end

%this is creating our function 
function newVal = f(x)
newVal = x-exp(-x);
end