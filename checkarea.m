function [areatable] = checkarea(filtered_image)
    areatable = regionprops("table", filtered_image, "Area");
