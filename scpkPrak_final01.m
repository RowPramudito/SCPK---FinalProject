dataset = xlsread('ahp_alts.xlsx','Sheet1','B2:D22');

c1 = zeros(21,1);
c2 = zeros(21,1);
c3 = zeros(21,1);

for i=1:21,
    c1(i,1) = dataset(1,1) / dataset(i,1);
    c2(i,1) = dataset(1,2) / dataset(i,2);
    c3(i,1) = dataset(1,3) / dataset(i,3);
end;

c1w = calc_norm(c1);

c2w = calc_norm(c2);

c3w = calc_norm(c3);


MPB = [1 1 1;
       1 1 1;
       1 1 1];
MPBw = calc_norm(MPB);
[m n] = size(MPBw);
for i=1:m,
    sumRow = 0;
    for j=1:n,
        sumRow = sumRow + MPBw(i,j);
    end;
    V(i) = (sumRow);
end;
MPBw = transpose(V)/m;

wM = [c1w c2w c3w];
MC_scores = wM * MPBw;
result = max(MC_scores);

function [normvect ] = calc_norm(M)
    sM = sum(M);
    normvect = M./sM;
end
