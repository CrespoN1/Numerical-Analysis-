function val = rungeDiff2(n)

%Part A
%this is creating space in our graph
x1=linspace(-1,1,n+1);

%this is creating placeholders 
B1=zeros(1,n+1);
B2=zeros(1,n+1);
B3=zeros(1,n+1);
B4=zeros(1,n+1);
B5=zeros(1,n+1);
B6=zeros(1,n+1);
B7=zeros(1,n+1);
B8=zeros(1,n+1);

%this for loop is gunna run from k =1 to n+1 
for j=1:n+1
   
    %this is setting the previous term to be the new term
    x0(j)=f(x1(j));
    
end

%this is initializing our incrimenter 
j=1;

%this while loop is going to run as long as k is less than or qual to n
while j<=n
    
    %this will run if statement is if j equals 1 then this divided difference occurs
    if j==1
        for j=1:8
            B1(j) = (x0(j+1) - x0(j))/(x1(j+1) - x1(j));
        end
        j=2;
    end
    
    %if j equals 2 then this portion of the divided difference occurs
    if j==2
        for j=1:7
            B2(j) = (B1(j+1) - B1(j))/(x1(j+2) - x1(j));
        end
        j=3;
    end
    
    %if j equals 3 then this portion of the divided difference occur
    if j==3
        for j=1:6
            B3(j) = (B2(j+1) - B2(j))/(x1(j+3) - x1(j));
        end
        j=4;
    end
   
   %if j equals 4 then this portion of the divided difference occurs
   if j==4
        for j=1:5
            B4(j) = (B3(j+1) - B3(j))/(x1(j+4) - x1(j));
        end
        j=5;
   end
   
   %if j equals 5 then this part of the divided difference will happen
   if j==5
        for j=1:4
            B5(j) = (B4(j+1) - B4(j))/(x1(j+5) - x1(j));
        end
        j=6;
   end
   
   %if j equals 6 then this portion of the divided difference happens
   if j==6
        for j=1:3
            B6(j) = (B5(j+1) - B5(j))/(x1(j+6) - x1(j));
        end 
        j=7;
   end
   
   %if j equals 7 then this part of th divided difference happens
   if j==7
        for j=1:2
            B7(j) = (B6(j+1) - B6(j))/(x1(j+7) - x1(j));
        end      
        j=8;
   end
   
   %if j equals 8 then this part of the divided difference happens
   if j==8
        for j=1
            B8(j) = (B7(j+1) - B7(j))/(x1(j+8) - x1(j));
        end        
        j=9;
   end
end
    
    %this is transpossing our vectors 
    val=[x0' B1' B2' B3' B4' B5' B6' B7' B8'];
      
%Part B
%this is evenly spacing our values 
xVec = linspace(-1,1,100);

%this is gunna run from when j equals 1 to 100
for j=1:100

    %this is creating our function 
    P1(j) = val(1,1) + val(1,2)*(xVec(j) - x1(1) ) + val(1,3)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) + val(1,4)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )  + val(1,5)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )+ val(1,6)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )+ val(1,7)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )*(xVec(j) - x1(6) )+ val(1,8)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )*(xVec(j) - x1(6) )*(xVec(j) - x1(7) )+ val(1,9)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )*(xVec(j) - x1(6) )*(xVec(j) - x1(7) )*(xVec(j) - x1(8) );
   
    %this is setting our previous value equal to our new one 
    F1(j) = f(xVec(j));
    
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
%this for loop is going to run from j equals 1 to 11
for j=1:11
    xVec(j) = -1 + (1/6)*j;
    F2(j)=f(xVec(j));
    P2(j) = val(1,1) + val(1,2)*(xVec(j) - x1(1) ) + val(1,3)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) + val(1,4)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )  + val(1,5)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )+ val(1,6)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )+ val(1,7)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )*(xVec(j) - x1(6) )+ val(1,8)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )*(xVec(j) - x1(6) )*(xVec(j) - x1(7) )+ val(1,9)*(xVec(j) - x1(1) )*(xVec(j) - x1(2) ) *(xVec(j) - x1(3) )*(xVec(j) - x1(4) )*(xVec(j) - x1(5) )*(xVec(j) - x1(6) )*(xVec(j) - x1(7) )*(xVec(j) - x1(8) );
   
    %this is finding the absolute error 
    absErr(j) = abs(F2(j)-P2(j));
end

%this is finding the sum or our error 
errSum=sum(absErr)

end

%this is creating our new function 
function newVal = f(x)
newVal = 1/(1+25*x^2);
end