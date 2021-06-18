function plotApprox(t,x,U,figStart,figTitle,figFilename)
%% Specifying slices
indices=[closest(t,0),
         closest(t,0.2),
         closest(t,0.4),
         closest(t,0.8),
         closest(t,1)];
     
USlices=[];
for i=indices
    USlices=[USlices,U(i,:)];
end

%% Plotting slices
figNums=1:length(USlices(:,1));
for figNum=figNums
    % Setting up figure
    f = figure(figStart);
    f.Units = 'inches';
    f.OuterPosition = [0.25,0.25,12,8];
    subplot(2,3,figNum)
    
    % Plotting
    USlice=USlices(figNum,:);
    plot(x,USlice)
    grid on
    xlim([0,1])
    ylim([-1,1.5])
    
    % Adding details to figure
    sgtitle(figTitle)
    title(sprintf("$t = %f$", t(indices(figNum))))
    figNum=figNum+1;
end
print(figFilename, '-dpng', '-r300');

end

