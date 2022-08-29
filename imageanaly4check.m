function [filt_imag] = imageanaly4check(basepic, cellpic, x_coord)
    bin_image = imageprep4cut(basepic, cellpic);
    roiimage = roicut(bin_image, x_coord);

    % next will be finimage function without border object filtering

    arearange = [2000, 10000];
    cut_image = imbinarize(roiimage);
    cut_image = imfill(cut_image, "holes");

    filt_imag = bwareafilt(cut_image, arearange);