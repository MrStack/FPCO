function I = negtiveTransform(I)
I = imadjust(I,[0 1],[1,0]);