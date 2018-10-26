%Data=zeros(5,5,2);
x=zeros(31,4,5);
LDCindex=0;
for LDC=[30]
    
    LDCindex=LDCindex+1;
    LigandIndex=0;
    
    for LD=[5 10 20 50]
        
        LigandIndex=LigandIndex+1;
        
        
        for pass=0:50
            fileName=strcat('MultipleRandomRForL',num2str(LD),'_Pass',num2str(pass),'LDC',num2str(LDC),'.mat');
            load(fileName);

            %pause(1);
            %Data(Rindex,LigandIndex,1)=sum(sum(EBConcentrationTemp));
            x(pass+1,LigandIndex,LDCindex)=sum(sum(EBConcentrationTemp));
            clear EBConcentrationTemp
        end
    end
end

for LigandIndex=1:4
plot(0:50,x(1:51,LigandIndex,1));
hold on 
end

