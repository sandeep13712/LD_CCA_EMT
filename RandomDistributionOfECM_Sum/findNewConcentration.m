function Concentration=findNewConcentration(LigandDensity,CurrentEm,CurrentEB,CurrentBeta,CurrentEc)


obj = sbmlimport('EBModel.xml');
configsetObj = getconfigset(obj, 'active');
set(configsetObj, 'SolverType', 'sundials');
set(configsetObj, 'StopTime', 30000);



obj.species(10).InitialAmount=LigandDensity;
obj.species(12).InitialAmount=CurrentBeta;
obj.species(14).InitialAmount=CurrentEc;
obj.species(15).InitialAmount=CurrentEm;
obj.species(16).InitialAmount=CurrentEB;

[t,x,names]=sbiosimulate(obj);

Em=x(:,15);
EB=x(:,16);
Beta=x(:,12);
Ec=x(:,14);

Concentration(1)=Em(end);
Concentration(2)=EB(end);
Concentration(3)=Beta(end);
Concentration(4)=Ec(end);

obj.species(12).InitialAmount=1; %B
obj.species(16).InitialAmount=1; %EB
obj.species(14).InitialAmount=0; %Ec
obj.species(15).InitialAmount=0; %Em
obj.species(10).InitialAmount=1; %L

%fprintf('LigandDensity=%d CurrentEm=%d CurrentB=%d NextB=%d CurrentEB=%d NextEm=%d NextEB=%d\n',LigandDensity,CurrentEm,CurrentBeta,Concentration(3),CurrentEB,Concentration(1),Concentration(2));

clear obj;

end
