 
  num=2;
  iter=5;
  threshDist=1;
  inlierRatio=0.5;
 
 %% Plot the data points
 figure;plot(data(1,:),data(2,:),'o');hold on;
 number = size(data,2); % Total number of points
 bestInNum = 0; % Best fitting line with largest number of inliers
 bestParameter1=0;bestParameter2=0; % parameters for best fitting line
 for i=1:iter
 %% Randomly select 2 points
     idx = randperm(number,num); sample = data(:,idx);   
 %% Compute the distances between all points with the fitting line 
     kLine = sample(:,2)-sample(:,1);% two points relative distance
     kLineNorm = kLine/norm(kLine);
     normVector = [-kLineNorm(2),kLineNorm(1)];%Ax+By+C=0 A=-kLineNorm(2),B=kLineNorm(1)
     distance = normVector*(data - repmat(sample(:,1),1,number));
 %% Compute the inliers with distances smaller than the threshold
     inlierIdx = find(abs(distance)<=threshDist);
     inlierNum = length(inlierIdx);
 %% Update the number of inliers and fitting model if better model is found     
     if inlierNum>=round(inlierRatio*number) && inlierNum>bestInNum
         bestInNum = inlierNum;
         parameter1 = (sample(2,2)-sample(2,1))/(sample(1,2)-sample(1,1));
         parameter2 = sample(2,1)-parameter1*sample(1,1);
         bestParameter1=parameter1; bestParameter2=parameter2;
     end
 end
 
 %% Plot the best fitting line
 xAxis = -number/2:number/2; 
 yAxis = bestParameter1*xAxis + bestParameter2;
 %plot(xAxis,yAxis,'r-','LineWidth',2);