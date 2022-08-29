tic
imageid = "27418_1_103.tif";
base = 37;
track = 1;
size = [15000 6];
emptyarray = zeros(size);
totaltable = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformation', 'Index', 'Track'});
size = [15000 2];
totaltable.Centroid = zeros(size);
rowindex = 1;
for index = 1:1500
    track = index;
    table = celltrack(imageid, index, base, track);
    tableheight = height(table);
    rows = rowindex:rowindex + tableheight - 1;
    totaltable(rows, :) = table;
    rowindex = rowindex + 1 + tableheight;
end
totaltable(~totaltable.Area,:) = []
writetable(totaltable, 'cellparams-8-29-1.xls');
toc