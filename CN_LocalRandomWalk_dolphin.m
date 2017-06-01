clear
load('fbnet.mat');
adj=fbnet;
[a,b]=rowwisse(adj);
A =full(a);
B =full(b);

CnScore=cn(B);
CnScore = full(CnScore); 
NScore = spdiags (1./sum (CnScore,2), 0, size(CnScore,1), size(CnScore,1)) * CnScore ;
NScore(isnan(NScore)) = 0; 
NScore(isinf(NScore)) = 0; 

val = zeros(1,15);
j=1;

for i= 0.1: 0.1 :1.0
    
Score=LRW(B,5,i);

ScoreS=dosym(B,Score);
CValue=commnval1(adj,ScoreS,5);
Precision = findpre(CValue,5,115);
val(j)= Precision;
j=j+1;
end