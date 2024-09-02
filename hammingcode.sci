msg = [1 1 0 1];
k = length(msg);
m = ceil(log2(k + 1 + log2(k)));
n = m + k

p = zeros(1,3);

p(1) = bitxor(msg(1), bitxor(msg(2), bitxor(1,msg(4))));
p(2) = bitxor(msg(1), bitxor(msg(3), bitxor(1,msg(4))));
p(4) = bitxor(msg(2), bitxor(msg(3), msg(4)));

emsg = zeros(1, n);

j = 1;
k = 1;
for i = 1:n
    pos = 2^(k - 1);
    if i == pos then
        k = k + 1;
        emsg(8 - i) = p(i);
    else
        emsg(8 - i) = msg(5 - j);
        j = j + 1;
    end
end

disp("Number of parity bits: ");
disp(m);
disp("Encoded message: ");
disp(emsg);

