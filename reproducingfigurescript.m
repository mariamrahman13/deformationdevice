imageid = "27418_1_103.tif";
base = 37;
track = 1;
size = [1 6];
emptyarray = zeros(size);
centroid = [0,0];
totaltable = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformation', 'Index', 'Track'});
totaltable.Centroid = centroid;
for index = 1:15000
    index;
    track = index;
    table = celltrack(imageid, index, base, track);
    totaltable = vertcat(totaltable, table);
end
totaltable;
writetable(totaltable, 'cellparams-6-10-1.xls');