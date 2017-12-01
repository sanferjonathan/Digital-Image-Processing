function hist_array = my_hist(im)
    % H = my_hist(im) computes the histogram for the intensity
    % image im (with values from 0 to 255) and returns a vector H
    % with 256 dimensions
    % get the image size: M = number of rows, N = number of columns
    [rows, columns] = size(im);
    % initialize the histogram to zero
    hist_array = zeros(1,256);
    
    for i = 1:rows
        for j = 1:columns
            hist_array(im(i,j)+1) = hist_array(im(i,j)+1) + 1;
        end
    end
end 
    
    