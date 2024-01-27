function allHurricaneData = getAllHurricaneData(allHurricanesFileName)
% takes the NAME of the single CSV file that has a single column with the
% names of ALL the individual hurricanes CSV files. This function extracts
% hurricane data from the files into a structure array
%
% INPUT: allHurricanesFileName - char array, which is the name of input CSV
%                                file 
% RETURNS: allHurricaneData - Structure Array that has the data for all the
%                             hurricanes with six fields: 
%                             name, date, Xs, Ys, wind, pressure
% HINTs: 1) all the opening/closing of the individual hurricane files is
%        done in this function and NOT in the main script.
%        2: the hurricane data files are in a directory called data so to
%        open one of them, use the prefix 'data/'. For example, to get the
%        data about hurricane Katia, use 'data/Katia.csv'

% going through and getting the names
for h = 1:length(allHurricanesFileName{1})
    data(h) = allHurricanesFileName{1}(h);
end
% transpose to make easier to work with 
data = data';

% going through the printing the name,data,Xs,Ys,wind, and pressure
for j = 1:length(data)
    % opening the file from the data folder
    openFile = sprintf('data/%s', data{j}); % opening the file 
    file = fopen(openFile);
    header = fgetl(file);
    % pulling out each individual column from the file
    dataInfo = textscan(file, '%s %s %d %f %f %f %d %d', 'Delimiter', ',');
    % placing into allHurricaneData
    allHurricaneData(j).name = data{j};
    allHurricaneData(j).date = dataInfo{1}(1:end);
    allHurricaneData(j).Xs = dataInfo{5}(1:end);
    allHurricaneData(j).Ys = dataInfo{6}(1:end);
    allHurricaneData(j).wind = dataInfo{7}(1:end);
    allHurricaneData(j).pressure = dataInfo{8}(1:end);
end
fclose('all');


