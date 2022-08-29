basepic = imread("27418_1_81.tif",1);
cellpic = imread("27418_1_81.tif", 131);

I = basepic - cellpic;
BW = I>=1;
binimage = double(BW);
imshow(binimage)

y_coord = 5;
x_width = 250;
y_width = 90;
x_coord = 250;

ROI = drawrectangle('Position', [x_coord, y_coord, x_width, y_width]);

mask = ROI.createMask;
S = regionprops(mask, 'BoundingBox');
b = floor(S(1).BoundingBox);
cut_image = binimage(b(2):b(2)+b(4), b(1):b(1)+b(3));
maskcut = double(mask(b(2):b(2)+b(4), b(1):b(1)+b(3)));
imshow(cut_image)

arearange = [2000,5000];
cut_image = imbinarize(cut_image);
cut_image = imclearborder(cut_image);
cut_image = imfill(cut_image, "holes");
% imshow(cut_image)
filtered_image = bwareafilt(cut_image, arearange);
% imshow(filtered_image)
