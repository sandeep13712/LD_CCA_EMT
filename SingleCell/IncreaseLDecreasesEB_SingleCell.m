
function SimulateResult=IncreaseLDecreasesEB_SingleCell()
MaxLi=50;
Data=zeros(MaxLi,4);

for LigandDensity=1:MaxLi
    
    NewConcentration=findNewConcentration(LigandDensity,0,0,1,1);
    Data(LigandDensity,1:4)=NewConcentration(1:4);
end

fileName=strcat('IncreaseLDecreasesEBSingleCell.mat');
save(fileName,'Data');
SimulateResult=0;

plot(1:MaxLi,Data(:,1),'*');  %Em
hold on;
plot(1:MaxLi,Data(:,2),'+'); %EB
hold on;
plot(1:MaxLi,Data(:,3),'o');%Beta
hold on;
plot(1:MaxLi,Data(:,4),'-');%Ec
hold on;
end











