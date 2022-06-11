function [xcoord] = centroidtrack(imageid, base, index, xcoord)
    BIN_I = bin_analysis(imageid, index, base);
    ROI_I = roicut(BIN_I, xcoord);
    prelim_I = filt_img(ROI_I);
    script = "original x coord = " + xcoord;
    paramtable = paramcheck(prelim_I, index);
    if ~isempty(paramtable)
        string = "centroid checking...";
        centroid = paramtable.Centroid(1,1);
        xcoord = xcoord + centroid - 100;
        ROI_I = roicut(BIN_I, xcoord);
    end