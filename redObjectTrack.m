clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear; 

    data = imread('img2.jpg');
    % Now to track red objects in real time
    % we have to subtract the red component 
    % from the grayscale image to extract the red components in the image.
    diff_im = imsubtract(data(:,:,1), rgb2gray(data));
    %Use a median filter to filter out noise
    diff_im = medfilt2(diff_im, [3 3]);
    % Convert the resulting grayscale image into a binary image.
    diff_im = im2bw(diff_im,0.18);
    
    % Remove all those pixels less than 300px
    diff_im = bwareaopen(diff_im,300);
    
    % Label all the connected components in the image.
    bw = bwlabel(diff_im, 8);
    % Here we do the image blob analysis.
    % We get a set of properties for each labeled region.
    stats = regionprops(bw, 'BoundingBox', 'Centroid');
    
    % Display the image
    imshow(data)
   
    hold on
    
    %This is a loop to bound the red objects in a rectangular box.
    for object = 1:length(stats)
        bb = stats(object).BoundingBox+5;
        bc = stats(object).Centroid+5;
        rectangle('Position',bb,'EdgeColor','b','LineWidth',1)
        plot(bc(1),bc(2), '-m+')
        a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
        BW = imcrop(data,bb-5);
       % imshow(imresize(BW, [100 100]));
       [centers, radii] = find_circles(BW, [100,100]);
       circle = circles_draw(BW, centers, radii);
        if(circle==1)
         scan(BW);  
        else
        result = tri(BW);
             figure();
        imshow(BW);
        scan(BW);
       
        end
    end
   
    hold off
      

% Both the loops end here.

% Stop the video aquisition.


% Flush all the image data stored in the memory buffer.


% Clear all variables
clear all
sprintf('%s','Thanks for following the traffic rules!!! :) ')
