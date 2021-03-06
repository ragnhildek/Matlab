function [X, Y] = Print (MMPickupNodes, MMDeliveryNodes, EndDepots3)



%Alle mulige stoppesteder = [Depot, Depot, Trondheim, Olso, Hamar, Oppdal, R?ros, Gj?vik,
%Domb?s, Lillehammer, Ringebu, Stj?rdal] 

for i = 1 : length(MMPickupNodes)
    p = MMPickupNodes(i);
    d = MMDeliveryNodes (i); 
switch p
    case 1
        name = ' Trondheim';
    case 2
        name = 'Oslo';
    case 3
        name = ' Hamar';
    case 4
        name = 'Oppdal';
    case 5
        name = ' R�ros';
    case 6
        name = 'Gj�vik';
    case 7
        name = ' Domb�s';
    case 8
        name = 'Lillehammer';
    case 9
        name = ' Ringebu';
    case 10
        name = 'Stj�rdal';
end
switch d
    case 1
        name2 = ' Trondheim';
    case 2
        name2 = 'Oslo';
    case 3
        name2 = ' Hamar';
    case 4
        name2 = 'Oppdal';
    case 5
        name2 = ' R�ros';
    case 6
        name2 = 'Gj�vik';
    case 7
        name2 = ' Domb�s';
    case 8
        name2 = 'Lillehammer';
    case 9
        name2 = ' Ringebu';
    case 10
        name2 = 'Stj�rdal';
end
X = ['!Freight order ' , num2str(i), ' has pickup in ' ,name, ' and delivery in ',name2];
disp(X);

end 

for j = 1: 3
    s = EndDepots3(j);
   switch s
    case 1
        name3 = ' Trondheim';
    case 2
        name3 = 'Oslo';
    case 3
        name3 = ' Hamar';
    case 4
        name3 = 'Oppdal';
    case 5
        name3 = ' R�ros';
    case 6
        name3 = 'Gj�vik';
    case 7
        name3 = ' Domb�s';
    case 8
        name3 = 'Lillehammer';
    case 9
        name3 = ' Ringebu';
    case 10
        name3 = 'Stj�rdal';
   end 
Y = ['!Vehicle ', num2str(j), ' has startdepot ' , name3];
disp(Y);

   
end 


