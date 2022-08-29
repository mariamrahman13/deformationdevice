imageid = "largersliced.tif";
basepic = imread(imageid, 1);
cellpic = imread(imageid, 12);

subtractedimage = filt_wo_cut(basepic, cellpic);
imshow(subtractedimage)
