function [rangeMatrix,bias] = extractRangeMatrix(wave,rangeLine,window)
if(mod(window,2) == 0)
    window = window+1;
end
bias = floor(window/2);
halfWindow = bias;
rangeMatrix = zeros(window,size(wave,2));
wave = [zeros(bias,size(wave,2));wave];
for j = 1:size(wave,2)
    if(rangeLine(j)-halfWindow+bias < 1)
        rangeMatrix(:,j) = [zeros(abs(rangeLine(j)-halfWindow+bias),1);wave(1:rangeLine(j)+halfWindow+bias,j)];
        continue;
    end
    if(rangeLine(j)+halfWindow+bias > size(wave,1))
        rangeMatrix(:,j) = [wave(rangeLine(j)-halfWindow+bias:end,j);zeros(rangeLine(j)+halfWindow+bias-size(wave,1),1)];
        continue;
    end
    rangeMatrix(:,j) = wave(rangeLine(j)-halfWindow+bias:rangeLine(j)+halfWindow+bias,j);
end