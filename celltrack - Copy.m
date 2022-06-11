function [tracktable] = celltrack(imageid, index, base, track)
    basepic = imread(imageid, base);
    cellpic = imread(imageid, index);
    size = [1 6];
    emptyarray = ones(size);
    tracktable = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformation', 'Centroid', 'Index'});
    Area = 0;
    Circularity = 0;
    Perimeter = 0;
    Deformation = 0;
    Index = 0;
    Track = 0;
    Centroid = [0,0];
    tracktable = table(Area, Circularity, Perimeter, Deformation, Index, Centroid, Track);
    xcoord = centroidtrack(imageid, base, index, 100);
    binimage = bin_analysis(imageid, index, base);
    roiimage = roicut(binimage, xcoord);
    filtimage = filt_img(roiimage);
    paramtable = paramcheck(filtimage, index);
    if ~isempty(paramtable)
        while xcoord < 1180
            binimage = bin_analysis(imageid, index, base);
            roiimage = roicut(binimage, xcoord);
            filtimage = filt_img(roiimage);
            if ~isempty(paramcheck(filtimage, index))
                paramtable = paramcheck(filtimage, index);
                paramtable.Track = track;
                tracktable = vertcat(tracktable, paramtable);
                index = index + 1;
            end
            xcoord = xcoord + 100;
            cellpic = imread(imageid, index);
            xcoord = centroidtrack(imageid, base, index, xcoord);
        end
        index = index + 1;
    end

