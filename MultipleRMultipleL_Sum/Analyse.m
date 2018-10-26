clear
clc
% 
% Data=zeros(5,5,2);
% Rindex=0;
% for R=[30 60 90]
%     
%     Rindex=Rindex+1;
%     LigandIndex=0;
%     for LigandDensity=[1 5 10 20 50]
%         LigandIndex=LigandIndex+1;
%         
%         
%         pass=0;
%         fileName=strcat('MultipleRMultipleL',num2str(LigandDensity),'_Pass',num2str(pass),'R',num2str(R),'.mat');
%         load(fileName);
%         Data(Rindex,LigandIndex,1)=sum(sum(EBConcentrationTemp));
%         
%         clear EBConcentrationTemp
%         
%         pass=20;
%         fileName=strcat('MultipleRMultipleL',num2str(LigandDensity),'_Pass',num2str(pass),'R',num2str(R),'.mat');
%         load(fileName);
%         Data(Rindex,LigandIndex,2)=sum(sum(EBConcentrationTemp));
%         clear EBConcentrationTemp
%         
%     end
% end


% %% Time Dynamics
x=zeros(21,3);
Rindex=0;
for R=[30 60 90]
    Rindex=Rindex+1;
    
    LigandIndex=0;
    for LigandDensity=[50]
        LigandIndex=LigandIndex+1;
    
        for pass=0:20
        fileName=strcat('MultipleRMultipleL',num2str(LigandDensity),'_Pass',num2str(pass),'R',num2str(R),'.mat');
        load(fileName);
        x(pass+1,Rindex)=sum(sum(EBConcentrationTemp));
        
        clear EBConcentrationTemp
        end
        
        plot(0:20,x(:,Rindex));
        hold on;
        
    end
end
% 
% save('MultipleRTimeDynamicsL10','x');



