function [tracktable] = celltrack(imageid, index, base, track)
    size = [1 6];
    emptyarray = zeros(size);
    centroid = [0,0];
    tracktable = array2table(emptyarray, "VariableNames", {'Area', 'Circularity', 'Perimeter', 'Deformation', 'Index', 'Track'});
    tracktable.Centroid = centroid;
    xcoord = centroidtrack(imageid, base, index, 100);
    binimage = bin_analysis(imageid, index, base);
    roiimage = roicut(binimage, xcoord);
    filtimage = filt_img(roiimage);
    paramtable = paramcheck(filtimage, index);
    if ~isempty(paramtable)
        while xcoord < 1100
            binimage = bin_analysis(imageid, index, base);
            roiimage = roicut(binimage, xcoord);
            filtimage = filt_img(roiimage);
            if ~isempty(paramcheck(filtimage, index))
                paramtable = paramcheck(filtimage, index);
                paramtable.Track = track;
                tracktable = vertcat(tracktable, paramtable);
                index = index + 1;
            end
            xcoord = xcoord + 180;
            xcoord = centroidtrack(imageid, base, index, xcoord);
        end
    end
    tracktable(~tracktable.Area,:) = [];

