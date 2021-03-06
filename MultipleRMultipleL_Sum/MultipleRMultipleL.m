
function SimulateResult=MultipleRMultipleL()
clc
n=10;
m=10;

clc

for R=[90]%2 4 8 10
    
    EBConcentration=ones(n,m)*0.175;
    Em=ones(n,m)*0.649;
    Beta=ones(n,m)*31.752;
    Ec=ones(n,m)*0.175;
    
    %-------Generation of High Ligand Density---------%
    %For 30%
    
    if(R==30)
    for x=3:7
        for y=3:8
            EBConcentration(x,y)=0.0391;
            Em(x,y)=0.9218;
            Beta(x,y)=4.987;
            Ec(x,y)=.0391;
        end
    end
    
    elseif(R==60)
    %For 60%
    for x=2:9
        for y=2:9
            
            if (not((x==2 && y==2 ) || (x==2 && y==8) || (x==8 && y==2) || (x==8 && y==8)))
            EBConcentration(x,y)=0.0391;
            Em(x,y)=0.9218;
            Beta(x,y)=4.987;
            Ec(x,y)=.0391;
            end
            
        end
    end
    
    elseif(R==90)
       %For 90%
    for x=1:9
        for y=1:10
            
            EBConcentration(x,y)=0.0391;
            Em(x,y)=0.9218;
            Beta(x,y)=4.987;
            Ec(x,y)=.0391;
            
            
        end
    end
    end
    
    
    
    
    %-------Generation of High Ligand Density End---------%
    
    
    
    for LigandDensity=[1 5 10 20 50]
        
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
        
        fileName=strcat('MultipleRMultipleL',num2str(LigandDensity),'_Pass',num2str(pass),'R',num2str(R),'.mat');
        save(fileName,'EBConcentrationTemp');
        
        for pass=1:20
            
            fprintf('R=%d LigandDensity=%d Pass=%d\n',R,LigandDensity,pass)
            
            
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
                    NewEB(i,j)=(Sum+NewEBConcentrationTemp)/5;
                    
                    NewEm(i,j)=NewEmConcentrationTemp;
                    NewBeta(i,j)=NewBetaConcentrationTemp;
                    NewEc(i,j)=NewEcConcentrationTemp;
                end
            end
            EBConcentrationTemp(:,:)=NewEB(:,:);
            EmConcentrationTemp(:,:)=NewEm(:,:);
            BetaConcentrationTemp(:,:)=NewBeta(:,:);
            EcConcentrationTemp(:,:)=NewEc(:,:);
            
            fileName=strcat('MultipleRMultipleL',num2str(LigandDensity),'_Pass',num2str(pass),'R',num2str(R),'.mat');
            save(fileName,'EBConcentrationTemp');
            
            
        end
        
    end
    SimulateResult=0;
end

end











