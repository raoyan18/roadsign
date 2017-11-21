function circle = lines_draw(img, centers, radii)
%size(centers, 1)
  %for i = 1 :1
      center_x = centers(1, 2);
      center_y = centers(1, 1);
   
      if(center_x > 30 && center_y >30)
            
        figure();
        title('Circle in image');
        imshow(img);
         c =1;
        hold on;
      else c= 0;
     
%        if(radii(i)>30)
%        r = radii(i);
%          else 
%             r=0;
%         end
        
%          theta = linspace(0, 2 * pi, 360);
%          xx = center_x + r * cos(theta);
%          yy = center_y + r * sin(theta);
%          plot(xx, yy,'g', 'LineWidth', 2);
      end    
 % end
   circle= c;

end
