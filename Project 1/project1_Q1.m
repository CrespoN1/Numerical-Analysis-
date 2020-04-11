function project1_Q1

%this for loop is going to run from 1 to 20 and stop once it reaches 20
for i = 1:20
    
    %this is initalizing our x values and pluging in a new i value from 1
    %to 20 and will allow us to then input them into our functions
    x = 5^(-i);
    
    %this is creating our functions and plugging in our new x values to get
    %our new function values for F(x) and G(x)
    F(i) = (sqrt(x+4))-2;
    
    G(i) = (x)/(sqrt(x+4)+2);

%this is terminating the for loop     
end

%this is just printing out our F and G values 
F
G





    