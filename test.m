clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear; 
data = imread('img3.jpg');
 [centers, radii] = find_circles2(data, [30,100]);