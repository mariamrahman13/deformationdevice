function [newxcoord] = centroidcheck(newimage, x_coord, cellpic, basepic)
    centroid_coords = regionprops(newimage, "Centroid");
    centroidX = centroid_coords.Centroid(1,1);

    ROI_center = x_coord + 250/2 - 100
    % 250 = x_width and 100 = x_initial

%     for k = [1:10]
%         k
%         diff = centroidX - ROI_center;
%         x_coord = x_coord + diff;
%         ROI_center = x_coord + 250/2 - 100;
%         newimage = imageanaly4check(basepic, cellpic, x_coord);
%         centroid_coords = regionprops(newimage, "Centroid");
%         centroidX = centroid_coords.Centroid(1,1)
%     end

    for k = 1:5
        centroid_coords = regionprops(newimage, "Centroid");
        if ~isempty(centroid_coords)
            k
            centroidX = centroid_coords.Centroid(1,1);
            diff = centroidX - ROI_center;
            newxcoord = x_coord + diff
            newimage = imageanaly4check(basepic, cellpic, newxcoord);
        else
            string = "closest we got"
            newxcoord = x_coord
        end
    end
