function [] = ToCSV(filename)
    % This file converts a .mat file to a csv file in the same location.
    
    % Load in .mat file
    FileData = load(filename);
    % Specify the columns you want to extract
    Columns = {'ET', 'AMBTMP', 'FX', 'FY', 'IA', 'MX', 'MZ', 'N', 'NFX', 'NFY', 'P', 'RE', 'RL', 'RST', 'RUN', 'SA', 'SL', 'SR', 'TSTC', 'TSTI', 'V'};
    
    % Intialize array of values
    M = zeros(length(FileData.ET), length(Columns));
    
    % For each value in columns
    for i = 1:length(Columns)
        % Retrive value from struct
        header = Columns{i};
        data = FileData.(header);   
        
        % Add to matrix
        M(1:length(data), i) = data;
    end
    
    % Convert to table, add header names, then write to csv at same location
    Table = array2table(M);
    Table.Properties.VariableNames(1:length(Columns)) = Columns;
    writetable(Table, [filename(1:end-4) '.csv']);
    
    disp(['Converted ' filename ' to csv']);
end