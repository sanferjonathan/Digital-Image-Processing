function recognition(imnum)
%   ubuntu path = '/home/jonathan/Schoolwork/MATLAB/Labb2/recognition/query/QueryImage%i.jpg';
%   windows path = 'C:\\Users\\Jonathan\\Documents\\MATLAB\\Labb2\\recognition\\database\\QueryImage%i.jpg';
    I1 = rgb2gray(imread(sprintf('/home/jonathan/Schoolwork/MATLAB/Labb2/recognition/query/QueryImage%i.jpg',imnum)));
    pts1 = detectSURFFeatures(I1);
    [feats1,validPts1] = extractFeatures(I1,pts1);
    maxSum = 0;
    
%   ubuntu path = '/home/jonathan/Schoolwork/MATLAB/Labb2/recognition/database/DatabaseImage%i.jpg';
%   windows path = 'C:\\Users\\Jonathan\\Documents\\MATLAB\\Labb2\\recognition\\database\\DatabaseImage%i.jpg';
    for i = 1:20
        I2 = rgb2gray(imread(sprintf('/home/jonathan/Schoolwork/MATLAB/Labb2/recognition/database/DatabaseImage%i.jpg',i)));
        pts2 = detectSURFFeatures(I2);
        [feats2,validPts2] = extractFeatures(I2,pts2);
        % match feature sets from 2 images
        indexPairs = matchFeatures(feats1,feats2);
        matchedPoints1 = validPts1(indexPairs(:, 1));
        matchedPoints2 = validPts2(indexPairs(:, 2));
        matchsum = matchedPoints1.Count + matchedPoints2.Count;
        if matchsum > maxSum
            maxSum = matchsum;
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

