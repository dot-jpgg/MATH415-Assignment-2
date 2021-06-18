function plotError(t,x,error,figStart)
%% Specifying slices
indices=[closest(t,0),
         closest(t,0.2),
         closest(t,0.4),
         closest(t,0.8),
         closest(t,1)];
     
errorSlices=[];
for i=indices
    errorSlices=[errorSlices,error(i,:)];
end

%% Plotting slices
figNums=1:length(errorSlices(:,1));
for figNum=figNums
    % Setting up figure
    f = figure(figStart);
    f.Units = 'inches';
    f.OuterPosition = [0.25 0.25 12 8];
    subplot(2,3,figNum)
    
    % Plotting
    errorSlice=errorSlices(figNum,:);
    plot(x,errorSlice)
    grid on
    
    % Adding details to figure
    sgtitle("Error in Approximation")
    title(sprintf("$t = %f$", t(indices(figNum))))
    figNum=figNum+1;
end
print('errors', '-dpng', '-r300');

end

