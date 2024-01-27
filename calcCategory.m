function [category, color] = calcCategory(wind)
% based on wind strength determines hurricane category and color
% INPUT: wind - a number for the wind speed(mph) of particular hurricane
%               data point.
% RETURNS: category - an integer based between 0-5 for hurricane category
%                     based on wind speed
%          color - triple value RGB color
%
%          category 0:   <=38,     color [0 1 1],     turquoise
%          category 0:   39-73,    color [0.25 1 0],  green
%          category 1:   74-95,    color [ 1 1 0],    yellow
%          category 2:   96-110,   color [1 0.75 0],  orange
%          category 3:   111-129,  color [1 0 0],     red
%          category 4:   120-156,  color [0.75 0 1],  violet
%          category 5:   >=157,    color [1 0 1],     pink

% if else statement on the colors based on wind 
if wind <= 38
    color = [0 1 1]; % turquoise
    category = 0;
elseif wind >= 39 && wind <= 73
    color = [0.25 1 0]; % green
    category = 0;
elseif wind >= 74 && wind <= 95
    color = [1 1 0]; % yellow
    category = 1;
elseif wind >= 96 && wind <= 110
    color = [1 0.75 0]; % orange
    category = 2;
elseif wind >= 111 && wind <= 129
    color = [1 0 0]; % red
    category = 3;
elseif wind >= 120 && wind <= 156
    color = [0.75 0 1]; % violet
    category = 4;
elseif wind >= 157
    color = [1 0 1]; % pink
    category = 5;
end

