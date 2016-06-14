n = 15;                % Code length
k = 11;                % Message length
data = randi([0 1],k,1);
encData = encode(data,n,k,'hamming/decimal');
encData(4) = ~encData(4);
encData(7) = ~encData(7);
decData = decode(encData,n,k,'hamming/decimal');

numerr = biterr(data,decData)