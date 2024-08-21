clear;
close all;
ss = [0.25 0.3 0.2 0.08 0.12 0.05];

ss = ss / sum(ss); 
ss = sort(ss, 'descend');

n = length(ss);
siling = ceil(log2(1 ./ ss));

sf = cumsum(ss) - ss / 2;
hh = zeros(1, n);

for r = 1:n
    code = '';
    value = sf(r);
    length = siling(r);
    for p = 1:length
        value = value * 2;
        if value >= 1
            code = [code '1'];
            value = value - 1;
        else
            code = [code '0'];
        end
    end
    hh(r) = bin2dec(code);
end

for i = 1:n
    code = dec2bin(hh(i), siling(i));
    disp(code);
end
