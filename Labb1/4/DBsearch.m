function MyImCell = DBsearch(Path,ImgType,RowValue,ColumnValue,Colour)
    %reads in all the pictures in folder with the given image type and
    %sorts out all images that does not have the specified size.
    Imgs = dir([Path '\' ImgType]);
    NumImgs = size(Imgs,1);
    j = 0;
    MySortCell = cell(NumImgs,1);
    for i = 1:NumImgs
        image = imread([Path '\' Imgs(i).name]);
        if (size(image,1) == RowValue) && (size(image,2) == ColumnValue)
            j = j+1;
            MySortCell{j} = image;
        end
    end
    
    %sorts images by wheather they have colour or not.
    MyImCell = cell(j,1);
    k = 0;
    for i = 1:j
        if (Colour == 1) && (size(MySortCell{i},3) == 3)
            %colour
            k = k+1;
            MyImCell{k} = MySortCell{i};
        end
        if (Colour == 0) && (size(MySortCell{i},3) == 1)
            %grayscale
            k = k+1;
            MyImCell{k} = MySortCell{i};
        end
    end 
end

