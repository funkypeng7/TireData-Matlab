function [] = ConvertAllToCSV(folder)
    % This function converts all .mat files in directory to csv files

    files = dir(folder);
    for i = 1:length(files)
        filepath = files(i).name;
        
        if(length(filepath) > 4 && strcmp(filepath(end-3:end), '.mat'))
            ToCSV([folder '/' filepath])
        end
    end

end