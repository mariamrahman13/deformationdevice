tic
imageid = "27418_1_103.tif";
base = 37;
track = 1;
size = [1 6];
emptyarray = zeros(size);
centroid = [0,0];
totaltable = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformation', 'Index', 'Track'});
totaltable.Centroid = centroid;
for index = 1:1500
    track = index;
    table = celltrack(imageid, index, base, track);
    totaltable = vertcat(totaltable, table);
end
writetable(totaltable, 'cellparams-6-13-8.xls');
toc