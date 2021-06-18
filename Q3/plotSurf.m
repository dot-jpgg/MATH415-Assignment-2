function plotSurf(t,x,U,figStart,figTitle,figFilename)
% Creating surface plot
figure(figStart)
s=surf(x,t,U);
s.EdgeColor = 'none';
xlabel('$x$')
ylabel('$t$')
zlabel('Temperature')
view(60,60)
%view(220,40)
title(figTitle)
print(figFilename, '-dpng', '-r300');

end

