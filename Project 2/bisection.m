function val = bisection(a,b,N)

%this is includes up to 15 digits for all calculations
format longe

%this is initializing our counter 
i=1;

%this is creating our vectors and imputting our counter 
aVec(i)= a;
bVec(i)= b;

%this while loop is going to run as long as our counter is less than our
%iterations (N)
while i<N

    %We are calculating the value of F(a) and F(b) at a specific
    %iteration
    aX = f(aVec(i));
    bX = f(bVec(i));
    
    %this is calculating the product of our two values to determine if we
    %can use bisection 
    y1 = aX*bX;

    %if the product of the two values is greater than 0 then it will print
    %out "Bisection cant be done F(a) ^ F(b) are same sign" 
    if y1>0
        
        %this prints out "Bisection cant be done F(a) ^ F(b) are same sign"
        fprintf('Bisection cant be done F(a) ^ F(b) are same sign')
        
        %this is going to set our counter equal to our iterations which
        %will exit the loop
        i=N;
    %this is saying if the product equals 0 then these statements will run
    elseif y1==0
        
        %if our a value equals 0 then our value for this spot its equal to
        %our root 
        if aX ==0 
            val=aVec(i);
            
            %this is going to set our counter equal to our iterations which
            %will exit the loop
            i=N;
        
        %this is saying if our value for b is equal to 0 then this
        %statement will occur 
        elseif bX ==0
            
            %if our value equals 0 then this iteration is our root 
            val=bVec(i);
            
            %this is setting our iterations equal to our counter which will
            %exit the loop 
            i=N;
        
        %this is ending the for loop
        end
    
    %this else statement is actually doing our bisection 
    else
        
        %this is calculating our c value 
        c(i)=(aVec(i)+bVec(i))/2;
        
        %this is calculating our error value 
        err(i)=(abs((6-c(i)))/6)*100;
        
        %this is calculating our c value at a specific iteration
        cVal=f(c(i));
        
        %this is calculating our 2nd product for our a value and c value 
        y2=aX*cVal;
    
        %if the product is less than 0 then this step of the bisection will
        %occur 
        if y2<0
            
            %whatever our current c value is, this step will set our c
            %value equal to our next b value 
            bVec(i+1)=c(i);
            
            %this is setting our current a value as our next a value 
            aVec(i+1)=aVec(i);
            
            %this is a place holder for our c value 
            c(i+1)=0;
            
            %this is a place holder 
            err(i+1)=0;
            
            %this is incrimenting our i 
            i=i+1;
            
        %if our product is greater than 0 then this step of bisection
        %occurs 
        elseif y2>0
            
            %this is setting our c value equal to our next a value 
            aVec(i+1)=c(i);
            
            %this is setting our current b value equal to the next b value 
            bVec(i+1)=bVec(i);
            
            %this is a place holder for c
            c(i+1)=0;
            
            %this is a place holder for our error
            err(i+1)=0;
            
            %this is incrimenting our value
            i=i+1;
            
        %this will occur if our value is equal to 0
        else y2==0
            
            %this will print out our current c value 
            aVec(i);
            
            %this will print our our current b value 
            bVec(i);
            
            %this will print our our current c value
            c(i);
            
            %this is setting our incriment equal to our itteration to exit
            %the loop 
            i=N;
            
        %this ends the loop 
        end
        
        %this is creating our vector 
        val=[aVec' bVec' c' err'];
    %this is ending our loop 
    end
    
%this is ending our loop
end

%this is evenly spacing our 2 given points out 
xVec = linspace(a, b, 100);

%this for loop will run for 100 iterations 
for i = 1:100
        
        %calculates the value of the function for the x-value and stores in
        %a vector
        newVal(i) = f(xVec(i));  
        
end

%this is plotting our figure
figure(1)
hold on
plot(xVec,newVal,'k')
legend('f(x)')
xlabel('X-value')
ylabel('Function Value')
hold off

end