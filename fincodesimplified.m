index = 112;

cellpic = imread("27418_1_81.tif", index);
basepic = imread("27418_1_81.tif", 1);

totalindexes = size(imfinfo("27418_1_81.tif"),1);

x_init = 100;
x_coord = x_init;
% initializing x coordinate for ROI

x_width = 250;
% only needed for calculation for ROI center

ROI_center = x_coord + x_width/2 - x_init;
% ROI center for centroid tracking

bin_image = imageprep4cut(basepic, cellpic);

cut_image = roicut(bin_image, x_coord);

filtered_image = finimage(cut_image);

imshow(filtered_image)

centroid_coord = regionprops(filtered_image, "Centroid");
centroidX = centroid_coord.Centroid(1,1);
% establishes centroid for tracking

if ROI_center ~= centroidX
    diff = centroidX - ROI_center;
    x_coord = x_coord + diff;
end
% convert to while, see if there are an ideal number of iterations

cut_image = roicut(bin_image, x_coord);
% new cut image with altered ROI
 
filtered_image = finimage(cut_image);
% new fiiltered image

imshow(filtered_image)

measured = regionprops("table", filtered_image, "Area", "Perimeter", "Circularity");
measured.Deformity = 1-measured.Circularity;
% calculates deformation property table

boundingbox = regionprops("table", filtered_image, "BoundingBox");
Xbound_coord = boundingbox.BoundingBox(1) + boundingbox.BoundingBox(3);
% calculates bounding box for later instance

% Create check if empty code
% if isempty(centroid_coord):
%     index = index + 1
% else
