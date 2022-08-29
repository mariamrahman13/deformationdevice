function [paramtable] = paramcheck(fin_image, index)
    paramtable = regionprops("table", fin_image, "Area", "Perimeter", "Circularity", "Centroid");
    paramtable.Deformation = 1-paramtable.Circularity;
    if ~isempty(paramtable)
        paramtable = paramtable(1,:);
        paramtable.Index = index;
    else
        paramtable = array2table(zeros(0, 6));
    end
end