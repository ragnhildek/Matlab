function [] = mosel_dataset_generator (Requests, MMPickupNodes, MMDeliveryNodes, EarlyTimeWindow , LateTimeWindow, WeightLoad, VolumeLoad, DrivingDistance, DrivingTime,StartDepotTime1,  StartDepotDistance1,StartDepotTime2, StartDepotDistance2,  StartDepotTime3, StartDepotDistance3, Vehicles, EndDepots3)
%Complete print for the mosel dataset. 
%First run V4paramtere to find inputdata to V5, then this to get java dataset. 
fid = fopen('mosel_datafile2.txt', 'wt');

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
X = ['!Freight order ' , num2str(i), '  has pickup in ' ,name, ' and delivery in ',name2];
fprintf(fid, X);
fprintf (fid, '\n');

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
fprintf (fid, Y);
fprintf (fid, '\n');
end

fprintf (fid, ' \n\n');
[A , B, C ,D ,E ,F ,G , H, I, J , K] = PrintNodes (MMPickupNodes, MMDeliveryNodes);
fprintf (fid, A);
fprintf (fid, '\n');
fprintf (fid, B);
fprintf (fid, '\n');
fprintf (fid, C);
fprintf (fid, '\n');
fprintf (fid, D);
fprintf (fid, '\n');
fprintf (fid, E);
fprintf (fid, '\n');
fprintf (fid, F);
fprintf (fid, '\n');
fprintf (fid, G);
fprintf (fid, '\n');
fprintf (fid, H);
fprintf (fid, '\n');
fprintf (fid, I);
fprintf (fid, '\n');
fprintf (fid, J);
fprintf (fid, '\n');
fprintf (fid, K);
fprintf (fid, '\n');

Vector = [];
for i = 1 : Vehicles
    Vector = [Vector i];
end 
fprintf (fid, 'Vehicles : [ ');
fprintf (fid, num2str (Vector));
fprintf (fid, ' ] \n');

L =  ['EarlyTimeWindow : [' , num2str(EarlyTimeWindow), ']'];
fprintf (fid, L);
fprintf (fid, '\n');
M =  ['LateTimeWindow : [' , num2str(LateTimeWindow), ']'];
fprintf(fid, M);
fprintf(fid, '\n\n');
fprintf(fid, 'WeightLoad: [ \n\n' ) ;
for i = 1 : size(WeightLoad)
    for j = 1: size (WeightLoad)
        fprintf (fid, num2str(WeightLoad (i , j)));
        fprintf (fid, '     ');
    end 
    fprintf (fid, '\n');
end 
fprintf (fid, '  ] \n\n');

fprintf(fid, 'VolumeLoad: [ \n\n' ) ;
for i = 1 : size(VolumeLoad)
    for j = 1: size (VolumeLoad)
        fprintf (fid, num2str(VolumeLoad (i , j)));
        fprintf (fid, '     ');
    end 
    fprintf (fid, '\n');
end 
fprintf (fid, '  ] \n\n');

fprintf(fid, 'DrivingTime: [ \n\n' ) ;
for i = 1 : size(DrivingTime, 1)
    for j = 1: size (DrivingTime, 2)
        fprintf (fid, num2str(DrivingTime (i , j)));
        fprintf (fid, '     ');
    end 
    fprintf (fid, '\n');
end 
fprintf (fid, '  ] \n\n');

fprintf(fid, 'DrivingDistance: [ \n\n' ) ;
for i = 1 : size(DrivingDistance, 1)
    for j = 1: size (DrivingDistance, 2)
        fprintf (fid, num2str(DrivingDistance (i , j)));
        fprintf (fid, '     ');
    end 
    fprintf (fid, '\n');
end 
fprintf (fid, '  ] \n\n');

if Vehicles == 1
    fprintf (fid, 'StartDepotTime : [  \n');
    for i = 1 : size(StartDepotTime1, 1)
        for j= 1 : size(StartDepotTime1, 2)
        fprintf (fid, num2str(StartDepotTime1 (i , j)));
        fprintf (fid, '     ');  
        end 
        fprintf (fid, '\n');
    end 
    fprintf (fid, '  ] \n\n');            
elseif Vehicles == 2 
    fprintf (fid, 'StartDepotTime : [  \n');
    for i = 1 : size(StartDepotTime2, 1)
        for j= 1 : size(StartDepotTime2, 2)
        fprintf (fid, num2str(StartDepotTime2 (i , j)));
        fprintf (fid, '     ');  
        end 
        fprintf (fid, '\n');
    end 
    fprintf (fid ,'  ] \n\n');     
elseif Vehicles == 3   
    fprintf (fid , 'StartDepotTime : [ \n');
    for i = 1 : size(StartDepotTime3, 1)
        for j= 1 : size(StartDepotTime3, 2)
        fprintf (fid, num2str(StartDepotTime3 (i , j)));
        fprintf (fid, '     ');  
        end 
        fprintf (fid, '\n');
    end 
    fprintf (fid, '  ] \n\n'); 
end 

if Vehicles == 1
    fprintf (fid, 'StartDepotDistance : [  \n');
    for i = 1 : size(StartDepotDistance1, 1)
        for j= 1 : size(StartDepotDistance1, 2)
        fprintf (fid, num2str(StartDepotDistance1 (i , j)));
        fprintf (fid, '     ');  
        end 
        fprintf (fid, '\n');
    end 
    fprintf (fid, '  ] \n\n');            
elseif Vehicles == 2 
    fprintf (fid, 'StartDepotDistance : [  \n');
    for i = 1 : size(StartDepotDistance2, 1)
        for j= 1 : size(StartDepotDistance2, 2)
        fprintf (fid, num2str(StartDepotDistance2 (i , j)));
        fprintf (fid, '     ');  
        end 
        fprintf (fid, '\n');
    end 
    fprintf (fid, '  ] \n\n');     
elseif Vehicles == 3   
    fprintf (fid, 'StartDepotDistance : [ \n');
    for i = 1 : size(StartDepotDistance3, 1)
        for j= 1 : size(StartDepotDistance3, 2)
        fprintf (fid, num2str(StartDepotDistance3 (i , j)));
        fprintf (fid, '     ');  
        end 
        fprintf (fid, '\n');
    end 
    fprintf (fid, '  ] \n\n'); 
end 


fprintf(fid, 'MaxConsecutiveDrivingHours: [4.5] \n ');
fprintf(fid, 'IntermediateBreakTime: [0.75] \n');
fprintf(fid,'MaxConsecutiveWorkingHours : [6] \n');
fprintf(fid,'MaxDailyDrivingHours : [9] \n');
fprintf(fid,'MinDailyRestingHours : [11] \n');
fprintf(fid,'HoursInDay: [24] \n ');
fprintf(fid,'MaxWeeklyDrivingHours : [56] \n');
fprintf(fid,'DrivingBigM1 : [79] \n');
fprintf(fid,'DrivingBigM2 : [11] \n');
fprintf(fid,'MaxWaitingTime : [0] \n');
fprintf (fid,'MaxBreakDuration: [11] \n' );
fprintf(fid,'TimeBigM : [79] \n');
fprintf (fid,'\n\n');
fprintf (fid,'FuelPrice : [14.84] \n');
fprintf(fid,'FuelConsumptionEmptyTruckPerKm : [0.42] \n ');
fprintf( fid,'FuelConsumptionPerTonPerKm : [0.01] \n ');
fprintf(fid, 'LabourCostPerHour : [469] \n' );
fprintf( fid, 'OtherDistanceDependentCostsPerKm : [3.55] \n' );
fprintf(fid,'OtherTimeDependentCostsPerHour : [199] \n');
fprintf(fid,'TimeTonService : [0.1] \n');
fprintf(fid,'Revenue : [100] \n');

fclose(fid);
end 

