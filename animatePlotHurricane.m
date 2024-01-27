function animatePlotHurricane(hurricaneData)
% plots and animates a specific hurricane
% INPUT: hurricaneData - Structure for a specific hurricane with six
%                        fields:
%                        name, data, Xs, Ys, wind, pressure
% OUTPUT: a plot, where each data point of the hurricane is plotted ONE by
%         ONE (so it looks animated), as a dot in MarkerSize 15, and the
%         color of the dot is determined based on the strength of the wind
%         for that data point
% HINTS: use the calcCategory() function to get the color of the dots
%        - pause for .01 seconds for the animation between points
%        - this function DOES NOT print, it plots
%        - this function does NOT set the background Earth image of the
%          plot, that is done in the main script hurricaneMapper.m

for i = 1:length(hurricaneData.Xs)
    % pulling out the xs and ys of the data
    x = hurricaneData.Xs(i);
    y = hurricaneData.Ys(i);
    %getting the cat and color from the data
    [~, color] = (calcCategory(hurricaneData.wind(i)));
    MarkerColor = colormap(color);
    % plotting point
    plot(x,y,'.','MarkerSize',15,'Color',MarkerColor);
    pause(.01)
    hold on
end

