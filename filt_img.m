function [fin_image] = filt_img(roi_image)
    BW = imbinarize(roi_image);
    BW = imclearborder(BW);
    BWf = imfill(BW, 'holes');
    range = [2000, 5000];
    fin_image = bwareafilt(BWf, range);
end