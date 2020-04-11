function val = rungeDiff1(n)


%Part A
%this is creating the spacing for the graph 
x1=linspace(-1,1,n+1);

%this is creating a place holder 
B1=zeros(1,n+1);
B2=zeros(1,n+1);
B3=zeros(1,n+1);
B4=zeros(1,n+1);

%this is creating our for loop which is going to run from k=1 to n+1
for k=1:n+1
   
    %this is setting our previous number to a new vector 
    x0(k)=f(x1(k));
    
end

%this is initializing our incrimenting value 
j=1;

%this while loop is going to run as long as j is less than or equal to n
while j<=n
    
    %this if statement is if j equals 1 then this divided difference occurs
    if j==1
        for k=1:4
            B1(k) = (x0(k+1) - x0(k))/(x1(k+1) - x1(k));
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
       
    %this is incrimenting our value 
    j=n+1;
   end
    
    %this is transpossing our vectors 
    val=[x0' B1' B2' B3' B4'];
      
end


%Part B
%it is creating the spacing between values 
xVec= linspace(-1,1,100);

%this for loop is going to run from k=1 to 100 iterations 
for k=1:100
    
    %this is setting our old value equal to our new value 
    F1(k) = f(xVec(k));
    
    %this is creating our equation 
    P1(k) = val(1,1) + val(1,2)*(xVec(k) - x1(1) ) + val(1,3)*(xVec(k) - x1(1) )*(xVec(k) - x1(2) ) + val(1,4)*(xVec(k) - x1(1) )*(xVec(k) - x1(2) ) *(xVec(k) - x1(3) )  + val(1,5)*(xVec(k) - x1(1) )*(xVec(k) - x1(2) ) *(xVec(k) - x1(3) )*(xVec(k) - x1(4) );

end

%this is plotting our graph 
figure(1)
hold on
plot(xVec,P1,'b',xVec,F1,'r')
legend('P_n','F_n')
xlabel('Xn')
ylabel('Function Value')
hold off


%Part C
%this for loop is going to run from k=1 to 11 iterations 
for k=1:11
    
    %this is creating our equation 
    xVec(k) = -1 + (1/6)*k;
    
    %this is setting our last value equal to our new value 
    F2(k)=f(xVec(k));
    
    %this is creating our function 
    P2(k) = val(1,1) + val(1,2)*(xVec(k) - x1(1) ) + val(1,3)*(xVec(k) - x1(1) )*(xVec(k) - x1(2) ) + val(1,4)*(xVec(k) - x1(1) )*(xVec(k) - x1(2) ) *(xVec(k) - x1(3) )  + val(1,5)*(xVec(k) - x1(1) )*(xVec(k) - x1(2) ) *(xVec(k) - x1(3) )*(xVec(k) - x1(4) );
    
    %this is finding the absolute error of our function 
    absErr(k) = abs(F2(k)-P2(k));
end

%this is taking the sum of our absolute error 
errSum=sum(absErr)

end

%this is creating our function 
function newVal = f(x)
newVal = 1/(1+25*x^2);
end