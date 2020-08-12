function drawFirstArrivals(wave,firstArrivals,coverLayer,color,marker,markerSize)
if nargin <= 2
    coverLayer = 1;
    color = 'white';
    marker = 'o';
    markerSize = 4;
end
interval = 1;
hold on;
index = wave >= 0;
half_wave = zeros(size(wave));
half_wave(index) = wave(index);
if coverLayer > 0
    for i=1:size(wave,2)
        plot(0:size(wave,1)+1,[(i-1)*interval;wave(:,i)+(i-1)*interval;(i-1)*interval],'black');
        fill(0:size(wave,1)+1,[(i-1)*interval;half_wave(:,i)+(i-1)*interval;(i-1)*interval],'black');
    end
end
plot(firstArrivals,0:length(firstArrivals)-1,'color',color,'linestyle','none',...
    'marker',marker,'markersize',markerSize,'markerfacecolor','white');

hold off;
%Set the axis limits
axis([0 size(wave,1) 0 (size(wave,2)-1)*interval]);
xlabel('Samples');ylabel('Trace number');
%Set view
view([90,90]);
set(gca,'YAxisLocation','right');

return;