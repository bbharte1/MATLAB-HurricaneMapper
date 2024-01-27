function createFigureWithBackground()
%create figure, add background image of to axes
%the limits of the axes are approximate for this quadrant 
%of the Earth in the Atlantic Ocean, image obtain from
%https://visibleearth.nasa.gov 
%DO NOT MODIFY THIS FUNCTION, use it ONCE BEFORE plotting.
xAxes = [-1.8 , -0.3];
yAxes = [0.0175, 0.75];
img = flip(imread('atlantic-basin.png'));
imagesc(xAxes, yAxes, img);
%flip the y axes again
set(gca,'ydir','normal');
hold on %plotting AFTER this function is called will show on the same figure
end

