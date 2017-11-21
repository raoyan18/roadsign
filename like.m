function like(im, points, files , net)
  %  hs = imhist(rgb2gray(imresize(im,[50 50])));
    hs = detectSURFFeatures(rgb2gray(im));
    %cls = vec2ind(net(hs));

   disp('aoyan');
     
    [~, n] = size(points);
    disp(n);
    for i = 1 : n
     % disp(net(points(:, i)));
      % indexPairs = matchFeatures(points(:, i),hs);
       % if(cls == vec2ind(net(points(:, i))))
           % figure('name', files(i).name);
           % fprintf('%s',files(i).name)
           % fprintf('\b\b\b\b\n')
           % imshow(imresize(imread(files(i).name), [100 100]))
      %  end
      disp(indexPairs);
    end
end