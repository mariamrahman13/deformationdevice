function [prelim_image] = filt_wo_area(roi_image)
    BW = imbinarize(roi_image);
    BW = imclearborder(BW);
    BWf = imfill(BW, 'holes');
    prelim_image = BWf;
    imshow(prelim_image);
end