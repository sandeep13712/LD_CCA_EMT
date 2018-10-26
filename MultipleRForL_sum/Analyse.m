x=zeros(31,4,5);
Rindex=0;

for R=[0 30 60 90]
    
    Rindex=Rindex+1;
    LigandIndex=0;
    
    for LD=[5 10 20 50]
        
        LigandIndex=LigandIndex+1;
        
        
        for pass=0:30
            fileName=strcat('MultipleRForL',num2str(LD),'_Pass',num2str(pass),'R',num2str(R),'.mat');
            load(fileName);
            %Data(Rindex,LigandIndex,1)=sum(sum(EBConcentrationTemp));
            x(pass+1,LigandIndex,Rindex)=sum(sum(EBConcentrationTemp));
            clear EBConcentrationTemp
        end
    end
end
% 
% for LigandIndex=1:5
% plot(0:30,x(:,LigandIndex,2));
% hold on 
% end

