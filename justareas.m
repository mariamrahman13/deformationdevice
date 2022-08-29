imageid = "27418_1_103.tif";
base = 37;
size = [1 5];
emptyarray = ones(size);
celltable = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformity', 'Index'});
for index = 1:200
    index;
    binimage = bin_analysis(imageid, index, base);
    finimage = filt_img(binimage);
    imshow(finimage)
    paramtable = paramcheck(finimage, index);
    if ~isempty(paramtable)
        celltable = vertcat(celltable,paramtable);
    end
end
writetable(celltable, 'cellparams6-8-1.xls');