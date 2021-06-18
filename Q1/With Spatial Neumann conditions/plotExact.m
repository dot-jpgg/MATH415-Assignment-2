function plotExact(t,x,u,figStart)
%% Specifying slices
indices=[closest(t,0),
         closest(t,0.2),
         closest(t,0.4),
         closest(t,0.8),
         closest(t,1)];
     
uSlices=[];
for i=indices
    uSlices=[uSlices,u(i,:)];
end

%% Plotting slices
figNums=1:length(uSlices(:,1));
for figNum=figNums
    % Setting up figure
    f = figure(figStart);
    f.Units = 'inches';
    f.OuterPosition = [0.25 0.25 12 8];
    subplot(2,3,figNum)
    
    % Plotting
    uSlice=uSlices(figNum,:);
    plot(x,uSlice)
    grid on
    xlim([0,1])
    ylim([-1,1.5])
    
    % Adding details to figure
    sgtitle("Exact Solution")
    title(sprintf("$t = %f$", t(indices(figNum))))
    figNum=figNum+1;
end
print('exacts', '-dpng', '-r300');

end

