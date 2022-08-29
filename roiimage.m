function [roi_image] = roiimage(imageid, base, index, x_coord)
    y_coord = 5;
    x_width = 250;
    y_width = 90;
    basepic = imread(imageid, base);
    cellpic = imread(imageid, index);

    % binary image analysis
    I = basepic - cellpic;
    BW = I>= 1;
    BW = double(BW);
    BW = imbinarize(BW);
    BW = imclearborder(BW);
    BWf = imfill(BW, 'holes');

    range = [1000, 5000];
    filt_image = bwareafilt(BWf, range);

    %roi initiation
    imshow(filt_image)
    ROI = drawrectangle('Position', [x_coord, y_coord, x_width, y_width],'Color', 'r');

    mask = ROI.createMask;
    S = regionprops(mask, 'BoundingBox');
    b = floor(S(1).BoundingBox);

    roi_image = filt_image(b(2):b(2)+b(4), b(1):b(1)+b(3));
    maskcut = double(mask(b(2):b(2)+b(4), b(1):b(1)+b(3)));
end

