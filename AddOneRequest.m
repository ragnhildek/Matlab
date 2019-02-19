function [WeightLoad, VolumeLoad, DrivingTime, DrivingDistance,  StartDepotTime1, StartDepotDistance1, StartDepotTime2, StartDepotDistance2, StartDepotTime3, StartDepotDistance3, AddedPickupNode, AddedDeliveryNode,  EarlyTimeWindow, LateTimeWindow,  Volume, Weight, MMPickupNodes, MMDeliveryNodes, EndDepots1, EndDepots2, EndDepots3, Requests] = AddOneRequest (EarlyTimeWindow,LateTimeWindow, Weight, Volume, MMPickupNodes, MMDeliveryNodes, EndDepots1, StartDepotTime1, StartDepotDistance1, EndDepots2, StartDepotTime2, StartDepotDistance2, EndDepots3, StartDepotTime3, StartDepotDistance3, Vehicles, Requests)


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


               
Distances = [           0       495     384     119     154     378     198     336     280     36
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
            
            
       
Requests = Requests + 1;            
AddedPickupNode = randi ([1,10]);
AddedDeliveryNode = randi ([1,10]);
while AddedDeliveryNode == AddedPickupNode
    AddedDeliveryNode = randi([1,10]);
end

MMPickupNodes = [MMPickupNodes AddedPickupNode];
MMDeliveryNodes = [MMDeliveryNodes AddedDeliveryNode]; 

NumberOfNodes = length(MMPickupNodes);  

s = 1;
indexes = zeros(1, NumberOfNodes);

for i = 1:NumberOfNodes
    indexes([s,s+1])= [MMPickupNodes(i) MMDeliveryNodes(i)];
    s = s+2;
end

TimeMatrix = Times(indexes, :);
TimeMatrix = TimeMatrix(:, indexes);

DistanceMatrix = Distances(indexes, :);
DistanceMatrix = DistanceMatrix (: , indexes);

DrivingTime = zeros ((NumberOfNodes)*2 + 2); 
DrivingTime(3:(NumberOfNodes*2+2), 3:(NumberOfNodes*2+2)) = TimeMatrix;

DrivingDistance = zeros ((NumberOfNodes)*2 + 2) ;
DrivingDistance(3:(NumberOfNodes*2+2), 3:(NumberOfNodes*2+2)) = DistanceMatrix;

%Time Windows
EarlyTimeWindowPickupNode = randi ([0, 25]);
LateTimeWindowPickupNode = [EarlyTimeWindowPickupNode + 24];

MinimumDrivingTime = Times(AddedPickupNode, AddedDeliveryNode);

EarlyTimeWindowDeliveryNode = [LateTimeWindowPickupNode + MinimumDrivingTime];
LateTimeWindowDeliveryNode = [EarlyTimeWindowDeliveryNode + 24];

EarlyTimeWindow = [EarlyTimeWindow EarlyTimeWindowPickupNode EarlyTimeWindowDeliveryNode];
LateTimeWindow = [LateTimeWindow LateTimeWindowPickupNode LateTimeWindowDeliveryNode];


%Added parameters

AddedWeight = randi (15);
AddedVolume = 0;
while AddedVolume > 81 || AddedVolume  <1  
      AddedVolume = randi ([round(AddedWeight* 2.5) - 10 , round(AddedWeight*2.5) + 10]);
end 

Weight = [Weight AddedWeight];
Volume = [Volume AddedVolume];

for i = 1:length(Weight)
WeightLoad(i,i)= Weight(i);
VolumeLoad(i,i) = Volume(i);
end 





%Adding the new pickupnode to the end depots
[ StartDepotTime1, StartDepotDistance1] = FindDepotTime (EndDepots1, MMPickupNodes);
[ StartDepotTime2, StartDepotDistance2] = FindDepotTime (EndDepots2, MMPickupNodes);
[StartDepotTime3, StartDepotDistance3] = FindDepotTime (EndDepots3, MMPickupNodes);

Print(MMPickupNodes, MMDeliveryNodes, EndDepots3);
PrintNodes(MMDeliveryNodes, MMPickupNodes); 

A =  ['EarlyTimeWindow : [' , num2str(EarlyTimeWindow), ']'];
disp (A);
B =  ['LateTimeWindow : [' , num2str(LateTimeWindow), ']'];
disp (B);

end             
            
%Creating new depots
%[EndDepots1, AddedEndDepotTime1, AddedEndDepotDistance1] = FindDepotTime (Vehicles, AddedPickupNode);
%[EndDepotsV2, AddedEndDepotTimeV2, AddedEndDepotDistanceV2] = FindDepotTime (Vehicles , AddedPickupNode);
%[EndDepotsV3, AddedEndDepotTimeV3, AddedEndDepotDistanceV3] = FindDepotTime (Vehicles, AddedPickupNode);


%AddedEndDepotTime2 = [AddedEndDepotTime1 AddedEndDepotTimeV2];
%AddedEndDepotTime3 = [AddedEndDepotTime2 AddedEndDepotTimeV3];

%AddedEndDepotDistance2 = [ AddedEndDepotDistance1  AddedEndDepotDistanceV2];
%AddedEndDepotDistance3 = [ AddedEndDepotDistance2  AddedEndDepotDistanceV3]; 



%EndDepotTime1 = [EndDepotTime1 ; AddedEndDepotTime1];
%EndDepotDistance1 = [EndDepotDistance1 ; AddedEndDepotDistance1]

%EndDepotTime2 = [EndDepotTime2 ; AddedEndDepotTime2];
%EndDepotDistance2 = [EndDepotDistance2 ; AddedEndDepotDistance2]

%EndDepotTime3 = [EndDepotTime3 ; AddedEndDepotTime3];
%EndDepotDistance3 = [EndDepotDistance3 ; AddedEndDepotDistance3]

            
            
            


%Creating the new rows and columns
%AddedPickupColumnDistance =  Distances (:, AddedPickupNode);
%AddedPickupColumnDistance = Addedpickup
%AddedPickupColumnDistanceWithDepot = [0 ; 0 ; AddedPickupColumnDistance]
%AddedPickupRowDistance =  Distances (AddedPickupNode, :);
%AddedPickupRowDistanceWithDepot = [0 0 AddedPickupRowDistance];

%AddedDeliveryColumnDistance = Distances (:, AddedDeliveryNode);
%AddedDeliveryColumnDistanceWithDepot = [0 ; 0 ; AddedDeliveryColumnDistance];
%AddedDeliveryRowDistance =  Distances (AddedDeliveryNode, :);
%AddedDeliveryRowDistanceWithDepot = [0 0 AddedDeliveryRowDistance];

%AddedPickupColumnTime =  Times (:, AddedPickupNode);
%AddedPickupColumnTimeWithDepot = [0 ; 0 ; AddedPickupColumnTime];
%AddedPickupRowTime =  Times (AddedPickupNode, :);
%AddedPickupRowTimeWithDepot = [0 0 AddedPickupRowTime]

%AddedDeliveryColumnTime = Times (:, AddedDeliveryNode);
%AddedDeliveryColumnTimeWithDepot = [0 ; 0 ; AddedDeliveryColumnTime]
%AddedDeliveryRowTime =  Times (AddedDeliveryNode, :);
%AddedDeliveryRowTimeWithDepot = [0 0 AddedDeliveryRowTime];
         
%Adding the new columns to the matrixes
%DrivingTime = [DrivingTime , AddedPickupColumnTimeWithDepot , AddedDeliveryColumnTimeWithDepot ];
%DrivingDistance = [DrivingDistance , AddedPickupColumnDistanceWithDepot , AddedDeliveryColumnDistanceWithDepot ];

%Adding the new rows to the matrixes
%DrivingTime = [DrivingTime ; AddedPickupRowTimeWithDepot ; AddedDeliveryRowTimeWithDepot];
%DrivingDistance = [DrivingDistance ; AddedPickupRowDistanceWithDepot;  AddedDeliveryRowDistanceWithDepot];
            
  
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            



