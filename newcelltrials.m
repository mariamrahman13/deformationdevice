imageid = "27418_1_103.tif";
% cell goes from 175 to 180
cellpic = imread(imageid, 177);
imshow(cellpic)
basepic = imread(imageid, 5);
imshow(basepic)
subt_image = filt_wo_cut(basepic, cellpic);
parametertable = regionprops("table", subt_image, "Area", "Circularity");
parametertable.Deformation = 1-parametertable.Circularity;
parametertable

%% cell tracking

% base = 5;
% index = 175
% basepic = imread(imageid, base);
% trackingtable = [];
% x_coord = 100;
% for index = 175:180
%     cellpic = imread(imageid, index);
%     prelimcheck = filt_wo_cut(basepic, cellpic);



%% roi
binimage = bin_analysis(imageid, 177, 5);
roiimage = roicut(binimage, 500);
finimage = filt_img(roiimage);
paramtable = paramcheck(finimage)

%% centroid
