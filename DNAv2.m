%Autor Adrian Josue Guel Cortez 2021
%Please cite one of my works if you are using this algorithm.
%https://scholar.google.com.mx/citations?user=gZcBLuoAAAAJ&hl=es

classdef DNA
    properties 
        genes {mustBeNumeric}
        fitness {mustBeNumeric}
    end
    methods
        function obj=DNA(val,fit,a,b)
            if nargin==4
                obj.genes=a+(b-a).*rand(val,1);
                obj.fitness=fit;
            end
        end
        function child=crossover(PartnerA,PartnerB)
            alpha=0.01;
            beta=0.015;
            child=DNA(length(PartnerA.genes),0.0,1,1);
                if PartnerA.fitness>PartnerB.fitness
                        a=PartnerB.genes-alpha*(abs(PartnerA.genes-PartnerB.genes));
                        b=PartnerA.genes+beta*(abs(PartnerA.genes-PartnerB.genes));
                        child.genes=a+(b-a).*rand(length(PartnerA.genes),1);
                else
                        a=PartnerB.genes-beta*(abs(PartnerA.genes-PartnerB.genes));
                        b=PartnerA.genes+alpha*(abs(PartnerA.genes-PartnerB.genes));
                        child.genes=a+(b-a).*rand(length(PartnerA.genes),1);
                end
        end
        function obj1=mutate(obj2,mutationRate,a,b)
                if rand<mutationRate
                    obj2.genes=a+(b-a).*rand(length(obj2.genes),1);
                end
            obj1=obj2;
        end
        function obj=acceptReject(population)
            index=1;
            r=rand;
            while r>0
                r=r-population(index).fitness;
                index=index+1;
            end
            index=index-1;
            obj=population(index);
        end
    end
end

%N random numbers in the interval (a,b) with the formula r = a + (b-a).*rand(N,1).
