
function SimulateResult=AllLitoLi()
clc
n=10;
m=10;

EBConcentration=ones(n,m)*0.175;
Em=ones(n,m)*0.649;
Beta=ones(n,m)*31.752;
Ec=ones(n,m)*0.175;


clc

for PercetangeEMTCellCount=[90]
    
    EMTCellCount=(PercetangeEMTCellCount*n*m)/100;
    
    randomposition=randperm(n*m);
    randompositions=randomposition(1:EMTCellCount);
    
    for i=1:EMTCellCount
        %EBPresentStateInit(randompositions)=20;
        EBConcentration(randompositions)=0.0391;
        Em(randompositions)=0.922;
        Beta(randompositions)=4.987;
        Ec(randompositions)=0.0391;
    end
    
    
    for LigandDensity=[20] %10 20 50
        NewLD=1;
        
        pass=0;
        
        
        Matrix=ones(n,m)*LigandDensity;
        
        EBConcentrationTemp=EBConcentration;
        EmConcentrationTemp=Em;
        BetaConcentrationTemp=Beta;
        EcConcentrationTemp=Ec;
        
        NewEm=zeros(n,m);
        NewEB=zeros(n,m);
        NewBeta=zeros(n,m);
        NewEc=zeros(n,m);
        
        fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
        save(fileName,'EBConcentrationTemp');
        
        for pass=1:20
            
            fprintf('EMTCC=%d LigandDensity=%d Pass=%d\n',PercetangeEMTCellCount,LigandDensity,pass)
            
            
            for i=1:n
                for j=1:m
                    
                    NewConcentration=findNewConcentration(Matrix(i,j),EmConcentrationTemp(i,j),EBConcentrationTemp(i,j),BetaConcentrationTemp(i,j),EcConcentrationTemp(i,j));
                    NewEmConcentrationTemp=NewConcentration(1);
                    NewEBConcentrationTemp=NewConcentration(2);
                    NewBetaConcentrationTemp=NewConcentration(3);
                    NewEcConcentrationTemp=NewConcentration(4);
                    
                    if(i==1)
                        iUp=n;
                        iDown=i+1;
                    elseif (i==n)
                        iDown=1;
                        iUp=i-1;
                    else
                        iUp=i-1;
                        iDown=i+1;
                    end
                    
                    if(j==1)
                        jLeft=m;
                        jRight=j+1;
                    elseif (j==m)
                        jRight=1;
                        jLeft=j-1;
                    else
                        jLeft=j-1;
                        jRight=j+1;
                    end
                    
                    ConcentrationLeft=EBConcentrationTemp(i,jLeft);
                    ConcentrationRight=EBConcentrationTemp(i,jRight);
                    ConcentrationTop=EBConcentrationTemp(iUp,j);
                    ConcentrationBottom=EBConcentrationTemp(iDown,j);
                    
                    Sum=ConcentrationLeft+ConcentrationRight+ConcentrationTop+ConcentrationBottom;
                    
                    %NewEB(i,j)=NewEBConcentrationTemp;
                    NewEB(i,j)=((Sum)+NewEBConcentrationTemp)/5;
                    
                    NewEm(i,j)=NewEmConcentrationTemp;
                    NewBeta(i,j)=NewBetaConcentrationTemp;
                    NewEc(i,j)=NewEcConcentrationTemp;
                end
            end
            EBConcentrationTemp(:,:)=NewEB(:,:);
            EmConcentrationTemp(:,:)=NewEm(:,:);
            BetaConcentrationTemp(:,:)=NewBeta(:,:);
            EcConcentrationTemp(:,:)=NewEc(:,:);
            
            fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
            save(fileName,'EBConcentrationTemp');
            
            
            
        end
        
        OriginalEB=EBConcentrationTemp;
        OriginalEm=EmConcentrationTemp;
        OriginalEc=EcConcentrationTemp;
        OriginalBeta=BetaConcentrationTemp;
        
        
        for NewLD=[1 5 10 20 50]
%             pass=31;
            EBConcentrationTemp=OriginalEB;
            EmConcentrationTemp=OriginalEm;
            BetaConcentrationTemp=OriginalBeta;
            EcConcentrationTemp=OriginalEc;
            
            Matrix=ones(n,m)*NewLD;
            
            NewEm=zeros(n,m);
            NewEB=zeros(n,m);
            NewBeta=zeros(n,m);
            NewEc=zeros(n,m);
            
%             fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',numtostr(NewLD),'.mat');
%             save(fileName,'EBConcentrationTemp');
            
            for pass=21:40
                
               % fprintf('EMTCC=%d LigandDensity=%d Pass=%d\n',PercetangeEMTCellCount,LigandDensity,pass)
                
                
                for i=1:n
                    for j=1:m
                        
                        NewConcentration=findNewConcentration(Matrix(i,j),EmConcentrationTemp(i,j),EBConcentrationTemp(i,j),BetaConcentrationTemp(i,j),EcConcentrationTemp(i,j));
                        NewEmConcentrationTemp=NewConcentration(1);
                        NewEBConcentrationTemp=NewConcentration(2);
                        NewBetaConcentrationTemp=NewConcentration(3);
                        NewEcConcentrationTemp=NewConcentration(4);
                        
                        if(i==1)
                            iUp=n;
                            iDown=i+1;
                        elseif (i==n)
                            iDown=1;
                            iUp=i-1;
                        else
                            iUp=i-1;
                            iDown=i+1;
                        end
                        
                        if(j==1)
                            jLeft=m;
                            jRight=j+1;
                        elseif (j==m)
                            jRight=1;
                            jLeft=j-1;
                        else
                            jLeft=j-1;
                            jRight=j+1;
                        end
                        
                        ConcentrationLeft=EBConcentrationTemp(i,jLeft);
                        ConcentrationRight=EBConcentrationTemp(i,jRight);
                        ConcentrationTop=EBConcentrationTemp(iUp,j);
                        ConcentrationBottom=EBConcentrationTemp(iDown,j);
                        
                        Sum=ConcentrationLeft+ConcentrationRight+ConcentrationTop+ConcentrationBottom;
                        
                        %NewEB(i,j)=NewEBConcentrationTemp;
                        NewEB(i,j)=((Sum)+NewEBConcentrationTemp)/5;
                        
                        NewEm(i,j)=NewEmConcentrationTemp;
                        NewBeta(i,j)=NewBetaConcentrationTemp;
                        NewEc(i,j)=NewEcConcentrationTemp;
                    end
                end
                EBConcentrationTemp(:,:)=NewEB(:,:);
                EmConcentrationTemp(:,:)=NewEm(:,:);
                BetaConcentrationTemp(:,:)=NewBeta(:,:);
                EcConcentrationTemp(:,:)=NewEc(:,:);
                
                fileName=strcat('IncreaseLDecreasesEB',num2str(LigandDensity),'_Pass',num2str(pass),'_PercetangeEMTCellCount',num2str(PercetangeEMTCellCount),'_NewLD',num2str(NewLD),'.mat');
                save(fileName,'EBConcentrationTemp');

            end
            SimulateResult=0;
        end
    end
    
end











