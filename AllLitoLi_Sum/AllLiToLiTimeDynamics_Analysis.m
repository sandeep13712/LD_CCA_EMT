
function SimulateResult=AllLiToLiTimeDynamics_Analysis()

 x=zeros(31,5);
    y=zeros(31,5);
    
% clc
% 
% Data=zeros(5,5,2,1);
% 
% PercetangeEMTCellCountIndex=0;
% for PercetangeEMTCellCount=[50]
%     PercetangeEMTCellCountIndex=PercetangeEMTCellCountIndex+1;
%     LigandDensityIndex=0;
%     for LigandDensity=[5]
%         LigandDensityIndex=LigandDensityIndex+1;
%         
%         NewLD=1;
%         
%         pass=15;
%         
%         fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
%         load(fileName);
%         Original=sum(sum(EBConcentrationTemp));
%         clear EBConcentrationTemp;
%         
%         NewLDIndex=0;
%         for NewLD=[1 10]
%             NewLDIndex=NewLDIndex+1;
%             pass=30;
%             fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
%             load(fileName);
%             AfterRecover=sum(sum(EBConcentrationTemp));
%             
%             Data(LigandDensityIndex,NewLDIndex,1,PercetangeEMTCellCountIndex)=Original;
%             Data(LigandDensityIndex,NewLDIndex,2,PercetangeEMTCellCountIndex)=AfterRecover;
%         end
%         
%     end
%     save('AlLitoLI_nalysis_LD50mat','Data');
%     SimulateResult=0;
% end

    
    % Time Dynamics Plot
    

PercetangeEMTCellCountIndex=0;
for PercetangeEMTCellCount=[30]
    PercetangeEMTCellCountIndex=PercetangeEMTCellCountIndex+1;
    LigandDensityIndex=0;
    for LigandDensity=[50]
        LigandDensityIndex=LigandDensityIndex+1;
        
        NewLD=1;
        
        for pass=0:20
        
        fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
        load(fileName);
        x(pass+1,LigandDensityIndex)=sum(sum(EBConcentrationTemp));
        clear EBConcentrationTemp; 
        end

        %plot(0:30, x(1:31,LigandDensityIndex));
        %hold on;
       
        NewLIndex=0;
       for NewLD=[1 5 10 20 50]
           NewLIndex=NewLIndex+1;
        y(1:21,NewLIndex)=x(1:21,LigandDensityIndex);
        for pass=21:40
        
        fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
        load(fileName);
        %y(pass+1,LigandDensityIndex)=sum(sum(EBConcentrationTemp));
        y(pass+1,NewLIndex)=sum(sum(EBConcentrationTemp));
        
        clear EBConcentrationTemp;

        end
        %plot(0:40, y(1:41,LigandDensityIndex));
        plot(0:40, y(1:41,NewLIndex));
        hold on;
        
        fileName=strcat('TimeDynamicsLD',num2str(LigandDensity),'NewLD',num2str(NewLD));
        save(fileName,'y');
       end

    end
  
end
SimulateResult=0;
end











