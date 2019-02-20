function [] = java_dataset_generator(Requests, EarlyTimeWindow, LateTimeWindow, Weight, Volume, MMPickupNodes, MMDeliveryNodes, EndDepots1, EndDepots3)
%Complete print for the java dataset. 
%First run V4paramtere to find inputdata to V5, then this to get java dataset. 

fid = fopen ('20R1V.txt', 'wt');

Times = [               0       6.5     5.25    1.75    2.25    5.25    2.75    4.75    4       0.5     0
                        6.5     0       1.75    5.25    4.75    1.75    4.15    2.5     3       6.75    0
                        5.25    1.75    0       4       3.75    1       3       1.15    1.75    5.5     0
                        1.75    5.25    4       0       2       3.5     1       3       2.25    2.25    0    
                        2.25    4.75    3.75    2       0       4.25    2.5     3.75    3       2.5     0
                        5.25    1.75    1       3.5     4.25    0       2.5     0.75    1.25    5.75    0
                        2.75    4.25    3       1       2.5     2.5     0       2       1.25    3.25    0
                        4.75    2.5     1.25    3       3.75    0.75    2       0       0.75    5.25    0
                        4       3       1.75    2.25    3       1.25    1.25    0.75    0       4.5     0
                        0.5     6.75    5.5     2.25    2.5     5.75    3.25    5.25    4.5     0       0
                        0       0       0       0       0       0       0       0       0       0       0
                        
                ];
            
Distances = [             0     495     384     119     154     378     198     336     280     36      0
                        495     0       129     414     382     123     319     168     221     524     0
                        384     129     0       277     272     52      213     62      115     415     0
                        119     414     277     0       153     260     79      218     162     149     0
                        154     382     272     153     0       306     178     264     208     168     0
                        378     123     52      260     306     0       196     45      98      409     0
                        198     319     213     79      178     196     0       154     98      228     0
                        336     168     62      218     264     45      154     0       57      367     0
                        280     221     115     162     208     98      98      57      0       311     0
                        36      524     415     149     168     409     228     367     311     0       0
                        0       0       0       0       0       0       0       0       0       0       0
                ];


NodesVehiclek = [];
for i = 0 : 2*Requests+1  
    NodesVehiclek = [NodesVehiclek i];
end 
fprintf (fid, 'NodesVehiclek , ');
A = fprintf(fid, '%.0f,' , NodesVehiclek);
A = A(1:end-1);
%A = [  ' , ' , A];
%fprintf (fid, A);
fprintf (fid, '\n');
fprintf(fid, 'VolumeCap , 81');
fprintf(fid, '\n');
fprintf(fid, 'WeightCap , 30 \n');

fprintf(fid, 'EarlyTimeWindow ,');
B = fprintf(fid, '%.2f,' , EarlyTimeWindow);
B = B(1:end-1);
fprintf(fid, '\n');
%B = ['EarlyTimeWindow' , ' , ' , B];
%disp(B);

fprintf (fid, 'LateTimeWindow , ');
C = fprintf(fid, '%.2f,' , LateTimeWindow);
C = C(1:end-1);
%C = ['LateTimeWindow' , ' , ' , C];
%disp(C);
fprintf(fid, '\n');

fprintf (fid, 'WeightLoad , ');
D = fprintf(fid, '%.0f,' , Weight);
D = D(1:end-1);
%D = ['WeightLoad' , ' , ' , D];
%disp(D);
fprintf(fid, '\n');

fprintf (fid, 'VolumeLoad , ');
E = fprintf(fid, '%.0f,' , Volume);
E = E(1:end-1);
%E = ['VolumeLoad' , ' , ' , E];
%disp(E);
fprintf(fid, '\n');

fprintf (fid, 'PickupNodes , ');
F = fprintf(fid, '%.0f,' , MMPickupNodes);
F = F(1:end-1);
%F = ['PickupNodes' , ' , ' , F];
%disp(F);
fprintf(fid, '\n');

fprintf (fid, 'DeliveryNodes , ');
G = fprintf(fid, '%.0f,' , MMDeliveryNodes);
G = G(1:end-1);
%G = ['DeliveryNodes' , ' , ' , G];
%disp(G);
fprintf(fid, '\n');

fprintf(fid, 'StartDepot , %.0f \n' , (EndDepots1) );
fprintf(fid, 'EndDepot , 11 \n');
fprintf(fid, 'NumberOfCities, 11 \n');

%Alle mulige stoppesteder = [Depot, Depot, Trondheim, Olso, Hamar, Oppdal, R?ros, Gj?vik,
%Domb?s, Lillehammer, Ringebu, Stj?rdal] 



fprintf (fid, 'Times: \n');
for i = 1:size(Times)
    for j = 1:size(Times)
        p = Times(i,j);
        fprintf (fid, num2str (p)); 
        fprintf (fid, ' , ') ;
    end 
    fprintf (fid, '\n');
end 

fprintf (fid, 'Distances: \n');
for i = 1:size(Distances)
    for j = 1:size(Distances)
        p = Distances(i,j);
        fprintf (fid , num2str (p)); 
        fprintf (fid, ' , ') ;
    end 
    fprintf (fid, '\n');
end 
fprintf( fid, 'FuelPrice , 14.84 \n');
fprintf (fid, 'FuelConsumptionEmptyTruckPerKm, 0.42\n');
fprintf(fid, 'FuelConsumptionPerTonPerKm, 0.01\n '); 
fprintf(fid, 'LabourCostPerHour, 469\n');
fprintf(fid, 'OtherDistanceDependentCostsPerKm, 3.55\n');
fprintf(fid, 'OtherTimeDependentCostsPerHour, 199\n');
fprintf(fid, 'TimeTonService, 0.1\n ');
fprintf(fid, 'Revenue, 100\n');
fprintf (fid, ' \n\n');
%Print (MMPickupNodes, MMDeliveryNodes, EndDepots3);

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
        name = ' Røros';
    case 6
        name = 'Gjøvik';
    case 7
        name = ' Dombås';
    case 8
        name = 'Lillehammer';
    case 9
        name = ' Ringebu';
    case 10
        name = 'Stjørdal';
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
        name2 = ' Røros';
    case 6
        name2 = 'Gjøvik';
    case 7
        name2 = ' Dombås';
    case 8
        name2 = 'Lillehammer';
    case 9
        name2 = ' Ringebu';
    case 10
        name2 = 'Stjørdal';
end
X = ['!Freight order ' , num2str(i), '  has pickup in ' ,name, ' and delivery in ',name2];
fprintf(fid, X);
fprintf (fid, '\n');

end

s = EndDepots1;
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
        name3 = ' Røros';
    case 6
        name3 = 'Gjøvik';
    case 7
        name3 = ' Dombås';
    case 8
        name3 = 'Lillehammer';
    case 9
        name3 = ' Ringebu';
    case 10
        name3 = 'Stjørdal';
   end 
Y = ['!The vehicle has startdepot ' , name3];
fprintf(fid, Y);
fprintf (fid, '\n');


fclose(fid);
end 
            


            
            
            
            
            
            
            
            
            
            
            
            
            
            