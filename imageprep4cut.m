function [bin_image] = imageprep4cut(basepic, cellpic)
% 1st step of analysis: image subtraction, binary threshold, results in image after being subtracted

I = basepic - cellpic;
% subtracts images

BW = I>= 1;
% adds image threshold to clear up image

bin_image = double(BW);
% makes it double to view image