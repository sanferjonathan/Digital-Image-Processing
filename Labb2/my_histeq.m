function [im_out,equalized_im_hist,normalized_im_hist] = my_histeq(im_in)
    % im_out = my_histeq(im_in) performs a histogram equalization on the
    % input image im_in and returns the result in im_out
    % both input and output image are intensity images (values from 0 to
    % 255)
    [rows, columns] = size(im_in);
    pixels_tot = rows * columns;
    %frequency, counts the occurrence of each pixel value.
    frequency = my_hist(im_in); 
    normalized_im_hist = zeros(1,256);
    equalized_im_hist = zeros(1,256);
    transform_im_hist = zeros(1,256);

    %The cumulative distribution probability is calculated.
    for i = 1:256
        for j = 1:i
            transform_im_hist(i) = transform_im_hist(i) + frequency(j);
        end
        normalized_im_hist(i) = transform_im_hist(i)/pixels_tot;
        normalized_im_hist(i) = round(normalized_im_hist(i) * 255);
    end 
    
    for h = 1:max(normalized_im_hist)
        for k = 1:256
            %pick the position of all values that are equal to h and place
            %the sum of all those pixels togather in position h
            if normalized_im_hist(k) == h
                equalized_im_hist(h) = equalized_im_hist(h) + frequency(k);
            end
        end
    end
    
    im_out = uint8(zeros(size(rows, columns)));
    for u = 1:rows
        for v = 1:columns
            im_out(u,v) = normalized_im_hist(im_in(u,v)+1);
        end
    end
end

