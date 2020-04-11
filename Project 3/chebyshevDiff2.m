function val = chebyshevDiff2(n)

%Part A
%this is initialzing our incrimentor 
k=0;

%this while loop is gunna run whilek is less than or equal to n+1
while k<=n+1
    
    %this is creating our function for our nodes 
    x1(k+1)=cos((((2*k)+1)*pi)/(2*n +1));
    
    %this is incrimenting our value 
    k=k+1;
end

%this is creating our placeholders 
B1=zeros(1,n+1);
B2=zeros(1,n+1);
B3=zeros(1,n+1);
B4=zeros(1,n+1);
B5=zeros(1,n+1);
B6=zeros(1,n+1);
B7=zeros(1,n+1);
B8=zeros(1,n+1);

%this is going to run up to n+1 iterations 
for i=1:n+1
   
    %this is setting our previous value equal ro our new one 
    F0(i)=f(x1(i));
    
end

%this is initializing our incrimentor 
j=1;

%this while loop is gunna run for when j is less than or equal to n
while j<=n
    
    %when j is equal to 1 then this portion of the divided difference will
    %occur 
    if j==1
        for i=1:8
            B1(i) = (F0(i+1) - F0(i))/(x1(i+1) - x1(i));
        end
        j=2;
    end
    
    %when j is equal to 2 then this portion of the divided difference will
    %occur
    if j==2
        for i=1:7
            B2(i) = (B1(i+1) - B1(i))/(x1(i+2) - x1(i));
        end
        j=3;
    end
    
    %when j is equal to 3 then this portion of the divided difference will
    %occur 
    if j==3
        for i=1:6
            B3(i) = (B2(i+1) - B2(i))/(x1(i+3) - x1(i));
        end
        j=4;
    end
   
   %when j is equal to 4 then this portion of the divided difference will
   %occur 
   if j==4
        for i=1:5
            B4(i) = (B3(i+1) - B3(i))/(x1(i+4) - x1(i));
        end
        j=5;
   end
   
   %when j is equal to 5 then this portion of the divided difference will
   %occur 
   if j==5
        for i=1:4
            B5(i) = (B4(i+1) - B4(i))/(x1(i+5) - x1(i));
        end
        j=6;
   end
   
   %when j equals 6 this part of the divided difference will occur 
   if j==6
        for i=1:3
            B6(i) = (B5(i+1) - B5(i))/(x1(i+6) - x1(i));
        end 
        j=7;
   end
   
   %when j equals 7 then this part of the divided difference will occur 
   if j==7
        for i=1:2
            B7(i) = (B6(i+1) - B6(i))/(x1(i+7) - x1(i));
        end      
        j=8;
   end
   
   %when j equals 8 then this part of the divided difference happens
   if j==8
        for i=1
            B8(i) = (B7(i+1) - B7(i))/(x1(i+8) - x1(i));
        end        
        j=9;
   end
end
    
    %this is transpossing our vector 
    val=[F0' B1' B2' B3' B4' B5' B6' B7' B8'];
      
%Part B
%this is creating a space in our graph 
xVec = linspace(-1,1,100);

%this for loop is gunna run up to 100 iterations 
for i=1:100
    
    %this is creating our function for the divided difference 
    P1(i) = val(1,1) + val(1,2)*(xVec(i) - x1(1) ) + val(1,3)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) + val(1,4)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )  + val(1,5)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )+ val(1,6)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )+ val(1,7)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )*(xVec(i) - x1(6) )+ val(1,8)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )*(xVec(i) - x1(6) )*(xVec(i) - x1(7) )+ val(1,9)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )*(xVec(i) - x1(6) )*(xVec(i) - x1(7) )*(xVec(i) - x1(8) );
    
    %this is setting our previous value equal to our new iterations
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
    
    %this is creating a vector 
    xVec(i) = -1 + (1/6)*i;
    
    %this is setting the previous value equal to our new value 
    F2(i)=f(xVec(i));
    
    %this is creating our function 
    P2(i) = val(1,1) + val(1,2)*(xVec(i) - x1(1) ) + val(1,3)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) + val(1,4)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )  + val(1,5)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )+ val(1,6)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )+ val(1,7)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )*(xVec(i) - x1(6) )+ val(1,8)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )*(xVec(i) - x1(6) )*(xVec(i) - x1(7) )+ val(1,9)*(xVec(i) - x1(1) )*(xVec(i) - x1(2) ) *(xVec(i) - x1(3) )*(xVec(i) - x1(4) )*(xVec(i) - x1(5) )*(xVec(i) - x1(6) )*(xVec(i) - x1(7) )*(xVec(i) - x1(8) );
    
    %this is finding the absolute error value 
    absErr(i) = abs(F2(i)-P2(i));
end

%this is finding the sum of the error values 
errSum=sum(absErr)

end

%this is creating our given function 
function newVal = f(x)
newVal = 1/(1+25*x^2);
end