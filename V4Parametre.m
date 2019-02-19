function [WeightLoad, VolumeLoad, DrivingTime, DrivingDistance,StartDepotTime1, StartDepotDistance1,StartDepotTime2, StartDepotDistance2,  StartDepotTime3, StartDepotDistance3, EarlyTimeWindow, LateTimeWindow, Weight, Volume,MMPickupNodes, MMDeliveryNodes, EndDepots1, EndDepots2, EndDepots3, Vehicles, Requests, Times, Distances] = V4Parametre( Requests, Vehicles)



%Alle mulige stoppesteder = [Depot, Depot, Trondheim, Olso, Hamar, Oppdal, R?ros, Gj?vik,
%Domb?s, Lillehammer, Ringebu, Stj?rdal] 

%Matrise med 3 stoppesteder: 
Times = [               0       6.5     5.25    1.75    2.25    5.25    2.75    4.75    4       0.5
                        6.5     0       1.75    5.25    4.75    1.75    4.15    2.5     3       6.75
                        5.25    1.75    0       4       3.75    1       3       1.15    1.75    5.5
                        1.75    5.25    4       0       2       3.5     1       3       2.25    2.25
                        2.25    4.75    3.75    2       0       4.25    2.5     3.75    3       2.5
                        5.25    1.75    1       3.5     4.25    0       2.5     0.75    1.25    5.75
                        2.75    4.25    3       1       2.5     2.5     0       2       1.25    3.25
                        4.75    2.5     1.25    3       3.75    0.75    2       0       0.75    5.25
                        4       3       1.75    2.25    3       1.25    1.25    0.75    0       4.5
                        0.5     6.75    5.5     2.25    2.5     5.75    3.25    5.25    4.5     0
                        
                ];


               
Distances = [             0     495     384     119     154     378     198     336     280     36
                        495     0       129     414     382     123     319     168     221     524
                        384     129     0       277     272     52      213     62      115     415
                        119     414     277     0       153     260     79      218     162     149
                        154     382     272     153     0       306     178     264     208     168
                        378     123     52      260     306     0       196     45      98      409
                        198     319     213     79      178     196     0       154     98      228
                        336     168     62      218     264     45      154     0       57      367
                        280     221     115     162     208     98      98      57      0       311
                        36      524     415     149     168     409     228     367     311     0
                ];
            

MMPickupNodes = [randi([1, 10], 1, Requests)];
MMDeliveryNodes = [randi([1,10], 1, Requests)];



%generer deliverynodes som ikke er like som pickupnodes
for i = 1: Requests
    while MMDeliveryNodes(i) == MMPickupNodes(i)
        MMDeliveryNodes = randi([1, 10], 1 , Requests);
    end 
end 

Profit = randi ([3000, 5000],1,  Requests);
Weight = randi ([1 , 15], 1, Requests ) ;


Volume = zeros(1, Requests);

for i = 1 : Requests
   while Volume (i) > 81 || Volume (i) <1  
      Volume(i) = randi ([round(Weight(i)* 2.5) - 10 , round(Weight(i)*2.5) + 10]);
   end 
end 

for i = 1:Requests
WeightLoad(i,i)= Weight(i);
VolumeLoad(i,i) = Volume(i);
end 


s = 1;
indexes = zeros(1, Requests*2);
for i = 1:Requests
    indexes([s,s+1])= [MMPickupNodes(i) MMDeliveryNodes(i)];
    s = s+2;
end

%Creating matrix for the specific pickups and deliveries
DistanceMatrix = Distances(indexes, :);
DistanceMatrix = DistanceMatrix(:, indexes);

TimeMatrix = Times(indexes, :);
TimeMatrix = TimeMatrix(:, indexes);

%TimeWindows
EarlyTimeWindowPickupNode = [randi([0, 24], 1, Requests)];
LateTimeWindowPickupNode = [EarlyTimeWindowPickupNode + 24];

idx = sub2ind(size(Times), MMPickupNodes, MMDeliveryNodes);
MinimumDrivingTime = Times(idx);

EarlyTimeWindowDeliveryNode = [LateTimeWindowPickupNode + MinimumDrivingTime];
LateTimeWindowDeliveryNode = [EarlyTimeWindowDeliveryNode + 24];

DrivingTime = zeros ((Requests)*2 + 2); 
DrivingTime(3:(Requests*2+2), 3:(Requests*2+2)) = TimeMatrix;

DrivingDistance = zeros ((Requests)*2 + 2) ;
DrivingDistance(3:(Requests*2+2), 3:(Requests*2+2)) = DistanceMatrix;


s = 1;
indexes1 = zeros(1, Requests);

for i = 1:Requests
    indexes1([s,s+1])= [EarlyTimeWindowPickupNode(i) EarlyTimeWindowDeliveryNode(i)];
    s = s+2;
end

EarlyTimeWindow = [0 0 indexes1];

s = 1;
indexes2 = zeros(1, Requests);

for i = 1:Requests
    indexes2([s,s+1])= [LateTimeWindowPickupNode(i) LateTimeWindowDeliveryNode(i)];
    s = s+2;
end

LateTimeWindow = [144 144 indexes2];

%Generating enddepots
EndDepots1 = randi(10);
EndDepots2 = [EndDepots1 randi(10)];
EndDepots3 = [EndDepots2 randi(10)];

[ StartDepotTime1, StartDepotDistance1] = FindDepotTime (EndDepots1, MMPickupNodes);
[ StartDepotTime2, StartDepotDistance2] = FindDepotTime (EndDepots2, MMPickupNodes);
[StartDepotTime3, StartDepotDistance3] = FindDepotTime (EndDepots3, MMPickupNodes);



Print(MMPickupNodes, MMDeliveryNodes, EndDepots3);
PrintNodes(MMPickupNodes, MMDeliveryNodes);

A =  ['EarlyTimeWindow : [' , num2str(EarlyTimeWindow), ']'];
disp (A);
B =  ['LateTimeWindow : [' , num2str(LateTimeWindow), ']'];
disp (B);



end 

            
            
            
            
            
            
            
            
            
            
            
            
            
            