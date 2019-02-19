function [A , B, C ,D ,E ,F ,G , H, I, J , K] = PrintNodes (MMPickupNodes, MMDeliveryNodes)

VolumeCap = 81;
WeightCap = 30;
VolumeWeightConstant = 3.5;




s=1;
for i = 2:2:2*length(MMPickupNodes)
    PickupNodes (s) = i;
    s = s+1;
end 

p = 1;
for i = 3:2:(2*length(MMDeliveryNodes)+1)
    DeliveryNodes(p) = i;
    p = p+1;
end


for i = 1:(2*length(MMDeliveryNodes)+1)
NodesVehiclek(i) = [ i];
end 
NodesVehiclek = [0 NodesVehiclek];

for i = 1:(2*length(MMDeliveryNodes)+1)
NodesWithoutStartDepot(i) = [ i];
end 

for i = 1:(2*length(MMDeliveryNodes))
NodesWithoutEndDepot(i) = [ i+1];
end 
NodesWithoutEndDepot = [0 NodesWithoutEndDepot];


for i = 1:(2*length(MMDeliveryNodes))
Nodes(i) = [ i+1];
end 

for i = 1:(2*length(MMDeliveryNodes)+2)
PositionsVehiclek(i) = [ i];
end 

nPositionsVehiclek = length(PositionsVehiclek);

A =  ['PickupNodes : [' , num2str(PickupNodes), ']'];
disp (A);

B =  ['DeliveryNodes : [' , num2str(DeliveryNodes), ']'];
disp (B);

C =  ['NodesVehiclek : [' , num2str(NodesVehiclek), ']'];
disp (C);

D =  ['NodesWithoutStartDepot : [' , num2str(NodesWithoutStartDepot), ']'];
disp (D);

E =  ['NodesWithoutEndDepot : [' , num2str(NodesWithoutEndDepot), ']'];
disp (E);

F =  ['Nodes : [' , num2str(Nodes), ']'];
disp (F);

G =  ['PositionsVehiclek : [' , num2str(PositionsVehiclek), ']'];
disp (G);

H =  ['nPositionsVehiclek : [' , num2str(nPositionsVehiclek), ']'];
disp (H);

I =  ['VolumeCap : [' , num2str(VolumeCap), ']'];
disp (I);

J =  ['WeightCap : [' , num2str(WeightCap), ']'];
disp (J);

K =  ['VolumeWeightConstant : [' , num2str(VolumeWeightConstant), ']'];
disp (K);





end