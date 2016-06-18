function Output = DataDecoder(start,EncodedData)
%   Decoder for the data of the hamming Encoder n stands for the number of bits to
%   be coded (7 or 15)

n = 7;                % Code length for the 7 bit transmission
k = 4;                % Message length for the 7bit transmisiion
n1 = 15;              % Code length for the 15 bit transmission
k1 = 11;              % Code length for the 15 bit transmission

EncodedData = single(EncodedData);
if start ==1
   Var = decode(EncodedData,n,k,'hamming');
elseif start == 2
   Var = decode(EncodedData,n1,k1,'hamming');
else
    disp('Wrong input');
end

Output = single(Var);
end

