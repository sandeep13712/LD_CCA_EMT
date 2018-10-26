Data=zeros(5,1,2);
x=zeros(21,5);
EMTCCIndex=0;
LigandDensityIndex=0;
for PercetangeEMTCellCount=[90]
    EMTCCIndex=EMTCCIndex+1;
    
    for LigandDensity=[15]
        LigandDensityIndex=LigandDensityIndex+1;
        
        for pass=0:20
            
            fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'.mat');
            load(fileName);
            EBConcentrationTemp
            %image(EBConcentrationTemp*1457);
            %pause(0.2);
            x(pass+1,LigandDensityIndex)=sum(sum(EBConcentrationTemp));
            clear EBConcentrationTemp;
        end
        
         plot(0:20,x(1:21,LigandDensityIndex));
         hold on;
    
        Data(LigandDensityIndex,EMTCCIndex,1)=x(1,LigandDensityIndex);
        Data(LigandDensityIndex,EMTCCIndex,2)=x(16,LigandDensityIndex);
    end
end



