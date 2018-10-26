
function SimulateResult=Analysis()
clc

Data=zeros(5,5,2,1);

PercetangeEMTCellCountIndex=0;
for PercetangeEMTCellCount=[50]
    PercetangeEMTCellCountIndex=PercetangeEMTCellCountIndex+1;
    LigandDensityIndex=0;
    for LigandDensity=[5]
        LigandDensityIndex=LigandDensityIndex+1;
        
        NewLD=1;
        
        pass=15;
        
        fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
        load(fileName);
        Original=sum(sum(EBConcentrationTemp));
        clear EBConcentrationTemp;
        
        NewLDIndex=0;
        for NewLD=[1 10]
            NewLDIndex=NewLDIndex+1;
            pass=30;
            fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
            load(fileName);
            AfterRecover=sum(sum(EBConcentrationTemp));
            
            Data(LigandDensityIndex,NewLDIndex,1,PercetangeEMTCellCountIndex)=Original;
            Data(LigandDensityIndex,NewLDIndex,2,PercetangeEMTCellCountIndex)=AfterRecover;
        end
        
    end
    save('AlLitoLI_nalysis_LD50mat','Data');
    SimulateResult=0;
end

    
    % Time Dynamics Plot
    x=zeros(3,60);
PercetangeEMTCellCountIndex=0;
for PercetangeEMTCellCount=[50]
    PercetangeEMTCellCountIndex=PercetangeEMTCellCountIndex+1;
    LigandDensityIndex=0;
    for LigandDensity=[5]
        LigandDensityIndex=LigandDensityIndex+1;
        
        NewLD=1;
        
        for pass=1:30
        
        fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
        load(fileName);
        x(LigandDensityIndex,pass)=sum(sum(EBConcentrationTemp));
        clear EBConcentrationTemp; 
        end
        
        plot(1:30, x(LigandDensityIndex,1:30));
        hold on;
        
        NewLD=10;
        y=x;
        for pass=16:30
        
        fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
        load(fileName);
        y(LigandDensityIndex,pass)=sum(sum(EBConcentrationTemp));
        clear EBConcentrationTemp;
        
        end
        
        %plot(1:30, y(LigandDensityIndex,1:30));
        hold on;
  
    end
    save('AlLitoLI_nalysis.mat','Data');
    SimulateResult=0;
end
end











