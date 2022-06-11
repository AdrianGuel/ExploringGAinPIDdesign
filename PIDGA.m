%Autor Adrian Josue Guel Cortez 2020
%Please cite one of my works if you are using this algorithm.
%https://scholar.google.com.mx/citations?user=gZcBLuoAAAAJ&hl=es

clearvars
close all

timerVal=tic;
a=0;
b=10;
totalpop=100;
mutationRate = .1;     
population=DNA.empty(0,totalpop);
auxf=zeros(1,totalpop);

%inicializar la poblacion
parfor i=1:totalpop
   population(i)=DNA(3,0,a,b);
   population(i).fitness=exp(-response(population(i).genes));
   auxf(i)=population(i).fitness;
end

dist=abs(auxf-1);
minDist=min(dist);
idx=find(dist==minDist);

z=1;
while z<3%minDist>0.5
    
child=DNA.empty();
newpopulation=DNA.empty(0,totalpop);
parfor i=1:totalpop
    partnerA=acceptReject(population);
    partnerB=acceptReject(population);
    child=crossover(partnerA,partnerB);
    child=mutate(child,mutationRate,a*50,b*50);
    newpopulation(i)=child;
end
population=newpopulation;

%calculate fitness
parfor i=1:totalpop
   population(i).fitness=exp(-response(population(i).genes));
   auxf(i)=population(i).fitness;
end

dist=abs(auxf-1);
minDist=min(dist);
idx=find(dist==minDist);

z=z+1;
clear child
end


Elapsetime=toc(timerVal);
k=population(idx).genes;
[RMSE,t,y,unitstep]=response(k);


figure
plot(t,unitstep,t,y)
xlabel('t (s)','Interpreter','Latex','FontSize', 12)
ylabel('$y(t)$','Interpreter','Latex','FontSize', 12)
set(gcf,'color','w');


