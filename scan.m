function scan(im2)
%img = imresize(rgb2gray(imread('speed20.jpg')),[100 100]);
im1 = rgb2gray(im2);
img =imresize(im1,[100 100]);
imgPath = 'D:/Image processing/Image_roadsign/final/imageData/';
imgType = '*.jpg';
files = dir([imgPath imgType]);
n =length(files);
output = cell(10,2);
Source = detectSURFFeatures(img,'MetricThreshold',500.0,'NumOctaves',4, 'NumScaleLevels',5);

[features1 , validpoints] = extractFeatures(img,Source);
display(features1);
if( ~exist(imgPath,'dir') || n<1)
    display('Directory not found or no image found.');
end
for n = 1 : length(files)
    filename = files(n).name;
    file = imresize(rgb2gray(imread([imgPath filename])),[100 100]);
    %file = rgb2gray(imread([imgPath filename]));
 
  
    DataBase = detectSURFFeatures(file,'MetricThreshold',500.0,'NumOctaves',4, 'NumScaleLevels',5);
   
    [features2 , validpoints] = extractFeatures(file,DataBase);
    % display(features2);
    indexPairs = matchFeatures(features2,features1);
    display(indexPairs);
    
    output{n,1} = length(indexPairs);
    output{n,2} = files(n).name;
       display(output{n,1});
       display(output{n,2});
                    
end
max=0;
maxIndex=0;
for j = 1 : length(files)
    if(max<output{j,1})
        maxIndex=j;
        max=output{j,1};
    end
end
    %disp(output);
    
if(max~= 0) 
    C = strsplit(output{maxIndex,2},'.'); 
   % imshow(imresize(imread(output{maxIndex,2}), [100 100]));

    a=text(100,40,C(1));
    set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 30, 'Color', 'black');
    disp(output{maxIndex,2}); 
      %text to speech..
     NET.addAssembly('System.Speech');
     Speaker = System.Speech.Synthesis.SpeechSynthesizer;
     sentence = C(1);
       if  ~isa(sentence,'cell')
          sentence = {sentence};
       end
      for k = 1:length(sentence)
          Speaker.Speak (sentence{k});
      end
end 

end