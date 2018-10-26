function SimulateResult=MultipleLMultipleEc()

Data=zeros(7,15);

LigandDensityIndex=0;
for LigandDensity=[1 5 10 20 50 100 150]
    LigandDensityIndex=LigandDensityIndex+1;
    EcIndex=0;
    for Ec=1:1:15
    EcIndex=EcIndex+1;
    
    NewConcentration=findNewConcentration(LigandDensity,0,0,1,Ec);
    Data(LigandDensityIndex,EcIndex)=NewConcentration(4);
    
    end
end

save('MultipleLMultipleEc_Ec.mat','Data');
SimulateResult=0;

end
