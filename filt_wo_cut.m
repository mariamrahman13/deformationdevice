function filt_fullimage = filt_wo_cut(basepic, cellpic)

I = basepic - cellpic;
BW = I>= 1;
imshow(BW)

BW = double(BW);
imshow(BW)

BW = imbinarize(BW);


BW = imclearborder(BW);


BWf = imfill(BW, 'holes');


range = [1000, 5000];
filt_fullimage = bwareafilt(BWf, range);

end