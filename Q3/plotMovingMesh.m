function plotMovingMesh(x,figStart,figTitle,figFilename)
% Creating surface plot
figure(figStart)
s=plot(x);
xlabel('$t$')
ylabel('$x$')
title(figTitle)
print(figFilename, '-dpng', '-r300');
end