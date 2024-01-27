% Brianna Harte
% bbharte@ncsu.edu
% 11/7/22
% Lab section #207
% Project 3: Hurricane Mapper, Fall 2022
%% Get all hurricane data in this script
data1 = fopen('data/allHurricanes.csv');
data = textscan(data1, '%s','Delimiter',',');
allHurricaneData = getAllHurricaneData(data);


%% Get User Input

% display welcome message
disp('----------------------------------');
disp('Welcome to the Hurricane Analysis');
disp('----------------------------------');

% print the options and ask for an input
fprintf('Animate specific Hurricane[1]\n    Animate All Hurricanes[2]\n  Create Hurricane Report [3]\n');
userInput = input('             Select action: ');

% if statement depending on user input
if userInput == 1
    % display a dialog
    allHurricanes = {'Cindy', 'Don', 'Emily', 'Franklin', 'Gert', 'Harvey','Irma','Jose','Katia',...
        'Lee','Maria','Nate','Ophelia'};
    [thingChosen, tf] = listdlg('ListString',allHurricanes,'SelectionMode','single'); %tf is 0 if none selected
    %use the number to index into the data
    specificHurricane = allHurricaneData(thingChosen);
    % call the animatePlotHurricane Function with background
    createFigureWithBackground();
    % adding title to the graph
    name = specificHurricane(1).name;
    newName = erase(name,'.csv');
    title(sprintf('Hurricane %s 2017',newName));
    % animate the plot
    animatePlotHurricane(specificHurricane);

    
    

elseif userInput == 2
    % animating all the hurricanes
    createFigureWithBackground() % create the figure outside loop 
    for i = 1:length(allHurricaneData)
        thisHurricane = allHurricaneData(i); % go through each hurricane and plot
        animatePlotHurricane(thisHurricane);
        pause(.01)
        hold on
        title('Hurricanes in 2017'); % add title
        %delete the .csv at end
        name = thisHurricane(1).name;
        newName = erase(name, '.csv');
        % add text to the graph
        text(thisHurricane(1).Xs(1),thisHurricane(1).Ys(1),sprintf('%s',newName),'Color','w');
    end


elseif userInput == 3 % creating a CSV file for all hurricanes
    generateReport(allHurricaneData) % open by rightclicking and opening as text

else 
    disp('Exiting program. Incorrect action.');
end



