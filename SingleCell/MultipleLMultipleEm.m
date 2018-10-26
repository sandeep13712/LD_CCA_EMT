
function SimulateResult=MultipleLMultipleEm()
MaxLi=50;
Data=zeros(5,16);

LigandDensityIndex=0;
for LigandDensity=[1 5 10 20 50]
    LigandDensityIndex=LigandDensityIndex+1;
    EmIndex=0;
    for Em=0:100:1500
    EmIndex=EmIndex+1;
    
    NewConcentration=findNewConcentration(LigandDensity,Em,0,35,0);
    Data(LigandDensityIndex,EmIndex)=NewConcentration(2);
    
    end
end

fileName=strcat('EmRequired.mat');
save(fileName,'Data');
SimulateResult=0;

end











