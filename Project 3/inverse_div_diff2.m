function val = inverse_div_diff2(n)

%Part A
%this is creating the spacing for the graph 
x=linspace(0,1,100);

%this is creating our function value to check
f=x-exp(-x);

%this is taking the derivative of our function and checking if it satisfies
%one of the requirments 
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
%this is creating the spacing needed in our graphs
B0=linspace(-1,1,n+1);

%this is creating a place holder 
B1=zeros(1,n+1);
B2=zeros(1,n+1);
B3=zeros(1,n+1);
B4=zeros(1,n+1);
B5=zeros(1,n+1);
B6=zeros(1,n+1);
B7=zeros(1,n+1);
B8=zeros(1,n+1);

%this is creating our for loop which is going to run from j=1 to n+1
for j=1:n+1
    
    %this is setting our previous number to a new vector 
    x0(j)=f(B0(j));
    
end

%this is initializing our incrimenting value 
j=1;

%this while loop is going to run as long as j is less than or equal to n
while j<=n
    
    %this if statement is if j equals 1 then this divided difference occurs
    if j==1
        for j=1:8
            B1(j) = (B0(j+1) - B0(j))/(x0(j+1) - x0(j));
        end
        j=2;
    end
    
    %if j equals 2 then this portion of the divided difference occurs
    if j==2
        for j=1:7
            B2(j) = (B1(j+1) - B1(j))/(x0(j+2) - x0(j));
        end
        j=3;
    end
    
    %if j equals 3 then this portion of the divided difference occurs
    if j==3
        for j=1:6
            B3(j) = (B2(j+1) - B2(j))/(x0(j+3) - x0(j));
        end
        j=4;
    end
   
   %if j equals 4 then this portion of the divided difference occurs
   if j==4
        for j=1:5
            B4(j) = (B3(j+1) - B3(j))/(x0(j+4) - x0(j));
        end
        j=5;
   end
   
   %if j equals 5 then this part of the divided difference happens 
   if j==5
        for j=1:4
            B5(j) = (B4(j+1) - B4(j))/(x0(j+5) - x0(j));
        end
        j=6;
   end
   
   %if j equals 6 then this part of the divided difference happens 
   if j==6
        for j=1:3
            B6(j) = (B5(j+1) - B5(j))/(x0(j+6) - x0(j));
        end 
        j=7;
   end
   
   %if j equals 7 then this part of the divided difference happens
   if j==7
        for j=1:2
            B7(j) = (B6(j+1) - B6(j))/(x0(j+7) - x0(j));
        end      
        j=8;
   end
   
   %if j equals 8 then this portion of the divided difference happens
   if j==8
        for j=1
            B8(j) = (B7(j+1) - B7(j))/(x0(j+8) - x0(j));
        end        
        j=9;
   end
end
    %this is transpossing our vector 
    val=[B0' B1' B2' B3' B4' B5' B6' B7' B8'];

%this is creating our function 
P1 = val(1,1) + val(1,2)*(0 - x0(1) ) + val(1,3)*(0 - x0(1) )*(0 - x0(2) ) + val(1,4)*(0 - x0(1) )*(0 - x0(2) ) *(0 - x0(3) )  + val(1,5)*(0 - x0(1) )*(0 - x0(2) ) *(0 - x0(3) )*(0 - x0(4) )+ val(1,6)*(0 - x0(1) )*(0 - x0(2) ) *(0 - x0(3) )*(0 - x0(4) )*(0 - x0(5) )+ val(1,7)*(0 - x0(1) )*(0 - x0(2) ) *(0 - x0(3) )*(0 - x0(4) )*(0 - x0(5) )*(0 - x0(6) )+ val(1,8)*(0 - x0(1) )*(0 - x0(2) ) *(0 - x0(3) )*(0 - x0(4) )*(0 - x0(5) )*(0 - x0(6) )*(0 - x0(7) )+ val(1,9)*(0 - x0(1) )*(0 - x0(2) ) *(0 - x0(3) )*(0 - x0(4) )*(0 - x0(5) )*(0 - x0(6) )*(0 - x0(7) )*(0 - x0(8) )    

%this is setting our previous value to our new value 
f1 = f(P1)

end

%this is creating our function value 
function newVal = f(x)
newVal = x-exp(-x);
end