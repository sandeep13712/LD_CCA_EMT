
function SimulateResult=MultipleLWithEcEvent()

obj = sbmlimport('EBModelWithEcEvent.xml');

configsetObj = getconfigset(obj, 'active');
set(configsetObj, 'SolverType', 'sundials');
set(configsetObj, 'StopTime', 60000);

scanData=[];

for LigandDensity=[1 5 10 20 50]
    obj.species(10).InitialAmount=LigandDensity;
    sd = sbiosimulate(obj);
    scanData=[scanData; sd];
end
[tscan, xscan] = selectbyname(scanData, 'EB');
m=[tscan xscan]; 
save('MultipleLWithEcEventDynamicsData.mat','m');
SimulateResult=0;
end











