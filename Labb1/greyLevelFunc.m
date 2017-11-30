

function greyScale = greyLevelFunc(Im, n)
    m = 512 / n;
    Im2 = Im / m;
    Im3 = round(Im2);
    greyScale = Im3 * m;
end
