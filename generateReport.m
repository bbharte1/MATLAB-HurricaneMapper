function generateReport(allHurricaneData)
% uses the hurricane data to create a report
% INPUT: allHurricaneData - Structure Array that has the data for all the
%        hurricanes with six fields: name, data, Xs, Ys, wind, pressure
% OUTPUT: a report stored in a CSV file called the hurricaneReport.csv
%         where each row has the following info:
%         Name of the hurricane, First Date, Last Date, Max Wind, Max
%         Pressure, Max Category
%         e.g. for hurricane cindy: Cindy, Jun 19, Jun 24, 60, 1004, 0

%opening a CSV file for writing 
myFID = fopen('hurricaneReport.csv','w');

for i = 1:length(allHurricaneData)
    % erasing the .csv
    name1 = allHurricaneData(i).name;
    name = erase(name1,'.csv');
    % start and end dates 
    starteDate = allHurricaneData(i).date{1};
    endDate = allHurricaneData(i).date{end};
    % max wind, pressure, and category
    maxWind = max(allHurricaneData(i).wind);
    maxPressure = max(allHurricaneData(i).pressure);
    maxCat = calcCategory(max(allHurricaneData(i).wind));
% pring the variables to the CSV file
    fprintf(myFID,'%s, %s, %s, %d, %d, %d \n', name, starteDate, endDate, maxWind, maxPressure, maxCat );
end
% close file
fclose(myFID);



