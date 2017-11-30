function equalized_im_hist = my_histeq(im_in)
    % im_out = my_histeq(im_in) performs a histogram equalization on the
    % input image im_in and returns the result in im_out
    % both input and output image are intensity images (values from 0 to
    % 255)
    [rows, columns] = size(im_in);
    pixels_tot = rows * columns;
    im_hist = my_hist(im_in);
    normalized_im_hist = zeros(1,256);
    equalized_im_hist = zeros(1,256);
    transform_im_hist = zeros(1,256);
    
    for i = 1:256
        for j = 1:i
            transform_im_hist(i) = transform_im_hist(i) + im_hist(j);
        end
        normalized_im_hist(i) = transform_im_hist(i) * (1/pixels_tot);
    end
    normalized_im_hist = round(normalized_im_hist * 255);
    
    for h = 1:255%max(normalized_im_hist)
        for k = 1:256
            %pick the position of all values that are equal to h and place
            %the sum of all those pixels togather in position h
            if normalized_im_hist(k) == h
                equalized_im_hist(h) = equalized_im_hist(h) + im_hist(k);
            end
        end
    end
end

