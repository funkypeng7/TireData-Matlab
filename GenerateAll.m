% This script generates all output files for each run.

CompileRuns('43075 R25B 7in', [1 2 4]);
CompileRuns('43075 R25B 8in', [5 6 7]);
CompileRuns('43070 R25B 6in', [8 9 10]);
CompileRuns('43070 R25B 7in', [11 12 13]);
CompileRuns('43075 LCO 8in', [14 15 16]);
CompileRuns('43075 LCO 7in', [17 18 19]);
CompileRuns('43070 LCO 6in', [20 21 22]);
CompileRuns('43070 LCO 7in', [23 24 25]);

ConvertAllToCSV('Output')