function Image = stats(img)
% allocate space for output image
output_img = zeros(size(img));

% loop over all rows and columns
for i = 2:size(img,1)-1
    for j = 2:size(img,2)-1
        %put all neighbors in an array
        array = [img(i,j) img(i,j+1) img(i,j-1) img(i+1,j) img(i-1,j)];
        %calculate max and min values and take the difference
        output_img(i,j) = max(array) - min(array);
    end
end
Image = output_img;

end

