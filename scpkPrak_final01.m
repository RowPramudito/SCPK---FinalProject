

dataset = xlsread('ahp_alts.xlsx','Sheet1','B2:D22');

c1 = zeros(21,1);
c2 = zeros(21,1);
c3 = zeros(21,1);

for i=1:21,
    c1(i,1) = dataset(i,1);
    c2(i,2) = dataset(i,2);
    c3(i,3) = dataset(i,3);
end;

c1b = calc_norm(c1);
[m n] = size(c1b);
for i=1:m,
    sumRow = 0;
    for j=1:n,
        sumRow = sumRow + c1b(i,j);
    end;
    V(i) = (sumRow);
end;
c1b = transpose(V) / m;

c2b = calc_norm(c2);
[m n] = size(c2b);
for i=1:m,
    sumRow = 0;
    for j=1:n,
        sumRow = sumRow + c2b(i,j);
    end;
    V(i) = (sumRow);
end;
c2b = transpose(V) / m;

c3b = calc_norm(c3);
[m n] = size(c3b);
for i=1:m,
    sumRow = 0;
    for j=1:n,
        sumRow = sumRow + c3b(i,j);
    end;
    V(i) = (sumRow);
end;
c3b = transpose(V) / m;



function [normvect ] = calc_norm(M)
    sM = sum(M);
    normvect = M./sM;
end