function [im_out] = my_conv(im_in, kernel)
    % im_out = my_conv(im_in, kernel) convolves the input image im_in
    % with the filter kernel and returns the result in im_out
    % im_in, im_out, and kernel are of double precision
    
    [k_row, k_column] = size(kernel);
    round_row = round(k_row/2);
    round_column = round(k_column/2);
    
    im_in = padarray(im_in,[round_row-1 round_column-1],0);
    [i_row, i_column] = size(im_in);
  
    im_out = zeros(size(im_in));
    temp = zeros(size(kernel));

    for i = round_row:i_row-round_row-1
        for j = round_column:i_column-round_column-1
            for s = 1:k_row
                for k = 1:k_column
                    temp(s,k) = kernel(s,k) * im_in(i-round_row+s,j-round_column+k);
                end
            end
            im_out(i,j) = sum(temp(:));
        end
    end
end