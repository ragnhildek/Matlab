function [ EndDepotTime, EndDepotDistance] = FindDepotTime (EndDepots, MMPickupNodes)

Requests = length(MMPickupNodes);
EndDepotTime = zeros (length(EndDepots), length(MMPickupNodes));
EndDepotDistance= zeros (10);

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
            


EndDepotTime = Times (: , EndDepots);
EndDepotDistance = Distances (:, EndDepots ) ;

EndDepotTime = EndDepotTime (MMPickupNodes, :);
EndDepotDistance = EndDepotDistance (MMPickupNodes,:);



end
