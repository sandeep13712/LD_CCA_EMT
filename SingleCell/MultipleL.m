
function SimulateResult=MultipleL()

obj = sbmlimport('EBModel.xml');
configsetObj = getconfigset(obj, 'active');
set(configsetObj, 'SolverType', 'ode23t');
set(configsetObj, 'StopTime', 30000);


scanData=[];

for LigandDensity=[1 5 10 20 50]
    obj.species(10).InitialAmount=LigandDensity;
    sd = sbiosimulate(obj);
    
    scanData=[scanData; sd];
end

[tscan, xscan] = selectbyname(scanData, 'EB');
EB=[tscan xscan]; 

[tscan, xscan] = selectbyname(scanData, 'B');
B=[tscan xscan]; 

[tscan, xscan] = selectbyname(scanData, 'Ec');
Ec=[tscan xscan]; 

[tscan, xscan] = selectbyname(scanData, 'Em');
Em=[tscan xscan]; 

save('MultipleLTimeDynamicsDataForEB.mat','EB');
save('MultipleLTimeDynamicsDataForB.mat','B');
save('MultipleLTimeDynamicsDataForEc.mat','Ec');
save('MultipleLTimeDynamicsDataForEm.mat','Em');

 
SimulateResult=0;

end











