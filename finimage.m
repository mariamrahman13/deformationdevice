function [filtered_image] = finimage(cut_image)
% Takes image from ROI and image analysis to clean it up

arearange = [2000, 5000];
% Max and min sizes for individual cells

cut_image = imbinarize(cut_image);
% makes it black and white

cut_image = imclearborder(cut_image);
% gets rid of objects touching border

cut_image = imfill(cut_image, "holes");
% fills in any holes

filtered_image = bwareafilt(cut_image, arearange);
% only returns object with area within range