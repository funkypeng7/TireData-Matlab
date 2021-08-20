function [] = CreateTireDataFile(fileName, runNumbers)

    load(sprintf('B1965raw%d', runNumbers(1)))
    
    for i = 1:length(runNumbers)
        
    end
    output.ET = ET;
    
    
    save(fileName,'-struct','output')
end