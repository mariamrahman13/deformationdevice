function [Xbound] = Xboundcheck(newimage)
    boundingbox = regionprops("table", newimage, "BoundingBox");
    boundingbox
    Xbound = boundingbox.BoundingBox(1) + boundingbox.BoundingBox(3);