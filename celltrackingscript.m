imageid = "27418_1_103.tif";
base = 37;
totalindices = 15994;
size = [1 5];
emptyarray = zeros(size);
celltable = array2table(emptyarray, "VariableNames", {"Area", "Circularity", "Perimeter", "Deformity", "Index"});
for index = 1:totalindices
    index
    