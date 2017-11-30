function OutputImage = ReadDB(Path,ImgType,InputImg)
    %vector with normalised values that represents intensity for each bin. 
    %there are 256 bins and each bin have been scaled by a factor of 256 for 
    %more accurate numbers.
    InputVector = imhist(InputImg) * (256/imhist(InputImg, 1));
    Imgs = dir([Path '\' ImgType]);
    NumImgs = size(Imgs,1);
    %initialising some variables with all relevant values of the first
    %image.
    image = im2double(imread([Path '\' Imgs(1).name]));
    TestVector = imhist(image) * (256/imhist(image, 1));
    minimum = sum(abs(InputVector - TestVector));
    OutputImage = image;
    %loop through all images in directory and compare the eucledian
    %distance for each image. The shorter the distance the better the
    %match.
    for i = 1:NumImgs
        image = im2double(imread([Path '\' Imgs(i).name]));
        TestVector = imhist(image) * (256/imhist(image, 1));
        result = sum(abs(InputVector - TestVector));
        if result < minimum
            minimum = result;
            OutputImage = image;
        end 
    end
end

