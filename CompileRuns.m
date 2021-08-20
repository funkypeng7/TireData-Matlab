function output = CompileRuns(filename, runNumbers)
    % This function takes an array (runNumbers) and combines them into a 
    % continous dataset. Then outputs the result as a .mat file of name 
    % filename. To capture full range set startTime to 0 and endTime to a
    % very large number
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

        % Index to place all new data into 
        newIndexes = index:index + length(ET) - 1;
        
        % Edit timestamp so it is continous
        newET = ET + ETStartValue;
        
        % Copy all run data across
        output.ET(newIndexes, 1) = newET;
        output.AMBTMP(newIndexes, 1) = AMBTMP;
        output.FX(newIndexes, 1) = FX;
        output.FY(newIndexes, 1) = FY;
        output.FZ(newIndexes, 1) = FZ;
        output.IA(newIndexes, 1) = IA;
        output.MX(newIndexes, 1) = MX;
        output.MZ(newIndexes, 1) = MZ;
        output.N(newIndexes, 1) = N;
        output.NFX(newIndexes, 1) = NFX;
        output.NFY(newIndexes, 1) = NFY;
        output.P(newIndexes, 1) = P;
        output.RE(newIndexes, 1) = RE;
        output.RL(newIndexes, 1) = RL;
        output.RST(newIndexes, 1) = RST;
        output.RUN(newIndexes, 1) = RUN;
        output.SA(newIndexes, 1) = SA;
        output.SL(newIndexes, 1) = SL;
        output.SR(newIndexes, 1) = SR;
        output.TSTC(newIndexes, 1) = TSTC;
        output.TSTI(newIndexes, 1) = TSTI;
        output.TSTO(newIndexes, 1) = TSTO;
        output.V(newIndexes, 1) = V;
            
        % Increment counter
        ETStartValue = output.ET(end) + (output.ET(end) - output.ET(end - 1));
        index = index + length(ET);
    end
    
    
    % Output result as .mat file
    save(['Output/' filename],'-struct','output')
    
    disp(['Completed combination of ' filename]);
end