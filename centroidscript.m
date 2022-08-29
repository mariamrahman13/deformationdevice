imageid = "27418_1_103.tif";
base = 37;
index = 176;
xcoord = 100;
x = centroidtrack(imageid, base, index, xcoord);
binimage = bin_analysis(imageid, index, base);
roicut(binimage, xcoord);
finimage = filt_img(binimage);
testparam = regionprops("table", finimage, "Area", "Centroid", "Perimeter", "Circularity");
testparam.Deformation = 1 - testparam.Circularity;
testparam