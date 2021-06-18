function i=closest(x,val)
% Returns the index of x which has the closest value to val
closestVal=min(abs(x-val));
i=find(abs(x-val)==closestVal);
end

