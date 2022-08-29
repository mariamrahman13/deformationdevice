function [filtered_image] = imageanaly(basepic, cellpic, x_coord)
    bin_image = imageprep4cut(basepic, cellpic);

    cut_image = roicut(bin_image, x_coord);

    filtered_image = finimage(cut_image);
    