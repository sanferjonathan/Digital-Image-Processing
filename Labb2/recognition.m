function recognition(imnum)
    I1 = rgb2gray(imread(sprintf('C:\\Users\\Jonathan\\Documents\\MATLAB\\Labb2\\recognition\\query\\QueryImage%i.jpg',imnum)));
    pts1 = detectSURFFeatures(I1);
    [feats1,validPts1] = extractFeatures(I1,pts1);
    maxDist = 0;
    
    for i = 1:20
        I2 = rgb2gray(imread(sprintf('C:\\Users\\Jonathan\\Documents\\MATLAB\\Labb2\\recognition\\database\\DatabaseImage%i.jpg',i)));
        pts2 = detectSURFFeatures(I2);
        [feats2,validPts2] = extractFeatures(I2,pts2);
        % match feature sets from 2 images
        indexPairs = matchFeatures(feats1,feats2);
        matchedPoints1 = validPts1(indexPairs(:, 1));
        matchedPoints2 = validPts2(indexPairs(:, 2));
        dist = matchedPoints1.Count + matchedPoints2.Count;
        if dist > maxDist
            maxDist = dist;
            I = I2;
            matchedP1 = matchedPoints1;
            matchedP2 = matchedPoints2;
            im2 = i;
        end
    end
    fprintf('The best match for query image %i is database image %i\n',imnum,im2);
    figure(2);
    % visualise matched features
    showMatchedFeatures(I1,I,matchedP1,matchedP2,'montage')
end

