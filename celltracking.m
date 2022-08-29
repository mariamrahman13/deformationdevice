function [trackingtable] = celltracking(imageid, index, track, base)
    basepic = imread(imageid, base);
    trackingtable = [];
    x_coord = 100;
    cellpic = imread(imageid, index);
    filt_imagetest = imageanaly4check(basepic, cellpic, x_coord);
    x_coord = centroidcheck(filt_imagetest, x_coord, cellpic, basepic);
    filt_imagetest = imageanaly4check(basepic, cellpic, x_coord)
    imshow(filt_imagetest)
    if isempty(checkarea(filt_imagetest)) ~= true;
        check = "not empty..."
        newimage = imageanaly(basepic, cellpic, x_coord);
        parametertable = regionprops("table", newimage, "Area", "Perimeter", "Circularity");
        parametertable.Deformity = 1 - parametertable.Circularity;
        parameter.Track = track;
        parameter.Index = index;
        x_coord = x_coord + Xboundcheck(newimage);
        index = index + 1;
        trackingtable = vertcat(tracktable, parametertable);
    else
        x_coord = x_coord + 20;
    end


