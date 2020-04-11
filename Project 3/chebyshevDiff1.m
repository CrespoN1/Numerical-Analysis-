function val = chebyshevDiff1(n)


%Part A
%this is initialzing our incrimentor 
j=0;

%this while loop is going to run as long as j is less than or equal to our
%n+1 value 
while j<=n+1
    
    %this is setting our node 
    x1(j+1)=cos((((2*j)+1)*pi)/(2*n +1));
    
    %this is incrimenting our value 
    j=j+1;
end

%this is creating our place holders 
B1=zeros(1,n+1);
B2=zeros(1,n+1);
B3=zeros(1,n+1);
B4=zeros(1,n+1);

%this for loop is going to run up to the n+1 iteration 
for i=1:n+1
    
    %this is setting our previous value equal to our new value 
    F0(i)=f(x1(i));
    
end

%this is initializing our incrimenting value 
k=1;

%this while loop is going to run while k is less than or equal to n
while k<=n
    
    %this part of the divided difference will run if k equals 1
    if k==1
        for i=1:4
            B1(i) = (F0(i+1) - F0(i))/(x1(i+1) - x1(i));
        end
        k=2;
    end
    
    %this part of the divided diference will occur if k equals2 
    if k==2
        for i=1:3
            B2(i) = (B1(i+1) - B1(i))/(x1(i+2) - x1(i));
        end
        k=3;
    end
    
    %this part of the divided difference will run if k equals 3 
    if k==3
        for i=1:2
            B3(i) = (B2(i+1) - B2(i))/(x1(i+3) - x1(i));
        end
        k=4;
    end
   
   %if k equals 4 then this part of the divided difference will happen
   if k==4
        for i=1
            B4(i) = (B3(i+1) - B3(i))/(x1(i+4) - x1(i));
        end
        k=5;
    
    %this is incriminting our k value 
    k=n+1;
   end
    
    %this is transpossing our vector 
    val=[F0' B1' B2' B3' B4'];
      
end


%Part B
%this is creating the even spacing in our graph 
xVec = linspace(-1,1,100);

%this for loop is going to run up to 100 iterations 
for i=1:100

    %this is creating our function 
    P1(i) = val(1,1) + val(1,2)*(xVec(i) - x1(1) ) + val(1,3)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) + val(1,4)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )  + val(1,5)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) );
    
    %this is setting our previous value equal to our new value 
    F1(i) = f(xVec(i));
end

%this is plotting our graph
figure(1)
hold on
plot(xVec,P1,'k',xVec,F1,'r')
legend('P_n','F_n')
xlabel('Xn')
ylabel('Function Value')
hold off


%Part C
%this for loop is going to run for up to 11 iterations 
for i=1:11
    
    %this is creating the function for our xVec 
    xVec(i) = -1 + (1/6)*i;
    
    %this is setting our previous value equal to our new value 
    F2(i)=f(xVec(i));
    
    %this is creating our divided difference function
    P2(i) = val(1,1) + val(1,2)*(xVec(i) - x1(1) ) + val(1,3)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) + val(1,4)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )  + val(1,5)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) );
    
    %this is finding the absolute error 
    absErr(i) = abs(F2(i)-P2(i));
end

%this is finding the summation of our error 
errSum=sum(absErr)

end

%this is creating our function 
function newVal = f(x)
newVal = 1/(1+25*x^2);
end