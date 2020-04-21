function I = scale2Fit(I)
I = imresize(I,[512,512],'bilinear');