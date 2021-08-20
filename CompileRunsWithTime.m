function output = CompileRunsWithTime(fileName, runNumbers, startTimes, endTimes)
    % This function takes an array (runNumbers) and combines them into a 
    % continous dataset. Then outputs the result as a .mat file of name 
    % filename. 
    % To capture full range set endTime smaller than startTime
    index = 1;
    ETStartValue = 0;
    for i = 1:length(runNumbers)
        % Load data
        load(sprintf('Source/B1965raw%d', runNumbers(i)));
        
        % Give information about each run.
        output.channel(i) = channel;
        output.sourceP{i} = source;
        output.testid{i} = testid;
        output.tireid{i} = tireid;  
        
        % Say where each individual run started 
        output.startIndexes(i) = index;
        
        % Calculate start and end indexs by finding closest ET Value to
        % each time
        if(endTimes(i) > startTimes(i))
            [~, startIndex] = min(abs(ET-startTimes(i)));
            [~, endIndex] = min(abs(ET-endTimes(i)));
            ET = ET(startIndex:endIndex);
        else
            startIndex = 1;
            endIndex = length(ET);
        end
         
        % Index to place all new data into 
        newIndexes = index:index + length(ET) - 1;
        
        % Edit timestamp so it is continous
        newET = ET + ETStartValue;
        
        % Copy all run data across
        output.ET(newIndexes, 1) = newET;
        output.AMBTMP(newIndexes, 1) = AMBTMP(startIndex:endIndex);
        output.FX(newIndexes, 1) = FX(startIndex:endIndex);
        output.FY(newIndexes, 1) = FY(startIndex:endIndex);
        output.FZ(newIndexes, 1) = FZ(startIndex:endIndex);
        output.IA(newIndexes, 1) = IA(startIndex:endIndex);
        output.MX(newIndexes, 1) = MX(startIndex:endIndex);
        output.MZ(newIndexes, 1) = MZ(startIndex:endIndex);
        output.N(newIndexes, 1) = N(startIndex:endIndex);
        output.NFX(newIndexes, 1) = NFX(startIndex:endIndex);
        output.NFY(newIndexes, 1) = NFY(startIndex:endIndex);
        output.P(newIndexes, 1) = P(startIndex:endIndex);
        output.RE(newIndexes, 1) = RE(startIndex:endIndex);
        output.RL(newIndexes, 1) = RL(startIndex:endIndex);
        output.RST(newIndexes, 1) = RST(startIndex:endIndex);
        output.RUN(newIndexes, 1) = RUN(startIndex:endIndex);
        output.SA(newIndexes, 1) = SA(startIndex:endIndex);
        output.SL(newIndexes, 1) = SL(startIndex:endIndex);
        output.SR(newIndexes, 1) = SR(startIndex:endIndex);
        output.TSTC(newIndexes, 1) = TSTC(startIndex:endIndex);
        output.TSTI(newIndexes, 1) = TSTI(startIndex:endIndex);
        output.TSTO(newIndexes, 1) = TSTO(startIndex:endIndex);
        output.V(newIndexes, 1) = V(startIndex:endIndex);
            
        % Increment counter
        ETStartValue = output.ET(end) + (output.ET(end) - output.ET(end - 1));
        index = index + length(ET);
    end
    
    
    % Output result as .mat file
    save(['Output/' fileName],'-struct','output')
    
    disp(['Completed combination of ' filename]);
end