function result = ransec(S)
%S = imread('tri.jpg');
result =0;
S = im2bw(S);
S2 = ~S;
%imshow(S2);
S3 = bwlabel(S2);
%imshow(S3,[]);
S4 = regionprops(S3,'Extrema','Centroid');
se = strel('disk',5);
for cnt = 1:length(S4)
temp = round(S4(cnt).Extrema);
temp(:,1) = temp(:,1) - min(temp(:,1)) + 1;
temp(:,2) = temp(:,2) - min(temp(:,2)) + 1;
mask = zeros(max(temp(:,1)),max(temp(:,2)));
for cnt2 = 1:8
mask(temp(cnt2,1),temp(cnt2,2))=1;
end
mask2 = imdilate(mask,se);
[labeled,numObjects(cnt)] = bwlabel(mask2,8);
end



score = (numObjects == 3);

for cnt = 1:length(S4)
%text(S4(cnt).Centroid(1),S4(cnt).Centroid(2),num2str(score(cnt)),'color','red');
if(score==3)
    result = 3;
end
end