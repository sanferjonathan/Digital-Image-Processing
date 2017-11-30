function Image = colourstats(img)
% allocate space for output image
output_img = zeros(size(img));
%output_img_red = zeros(size(img));
%output_img_green = zeros(size(img));
%output_img_blue = zeros(size(img));

% loop over all rows and columns
for k = 1:3
    for i = 2:size(img,1)-1
        for j = 2:size(img,2)-1
            %put all neighbors in an array
            array = [img(i,j,k) img(i,j+1,k) img(i,j-1,k) img(i+1,j,k) img(i-1,j,k)];
            %calculate max and min values
            %take the difference
            if k == 1
                output_img(i,j,k) = max(array) - min(array);
            elseif k == 2
                output_img(i,j,k) = max(array) - min(array);
            else
                output_img(i,j,k) = max(array) - min(array);
            end
        end
    end
end
Image = output_img;
%[Image_red, Image_green, Image_blue]
%Image_red = output_img_red;
%Image_green = output_img_green;
%Image_blue = output_img_blue;
end



        
        

