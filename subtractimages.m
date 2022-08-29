cellpic = imread("27418_1_81.tif",112);
basepic = imread("27418_1_81.tif", 1);

arearange = [2000, 5000];
% range of areas for only 1 cell

x_init = 100;
x_coord = x_init;
% would be a variable in function
y_coord = 5;
x_width = 250;
y_width = 90;

%% initial image analysis - subtraction, binary threshold

I = basepic - cellpic;
% subtracts images
BW = I >= 1;
% adds image threshold
BW = double(BW);
% makes it double

%% where the ROI cut would happen

imshow(BW);
% initializes image to be cut
ROI = drawrectangle('Position', [x_coord, y_coord, x_width, y_width]);
% creates ROI rectangle
mask = ROI.createMask;
S = regionprops(mask, 'BoundingBox');
% i have no idea what this does
b = floor(S(1).BoundingBox);


cut_image = BW(b(2):b(2)+b(4), b(1):b(1)+b(3));

% cuts out parts of the images
imshow(cut_image);

%% final image analysis step - filling holes

cut_image = imbinarize(cut_image);
% makes it black and white
cut_image = imclearborder(cut_image);
% gets rid of objects touching border
cut_image = imfill(cut_image, "holes");
% fills in any holes
% end of image analysis

filtered_image = bwareafilt(cut_image, arearange);
% only returns object with area within range

imshow(filtered_image)

measured = regionprops("table", filtered_image, "Area", "Perimeter", "Circularity");
measured.Deformity = 1-measured.Circularity;

centroid_coord = regionprops(filtered_image, "Centroid");

boundingbox = regionprops("table", filtered_image, "BoundingBox");
Xbound_coord = boundingbox.BoundingBox(1) + boundingbox.BoundingBox(3);
