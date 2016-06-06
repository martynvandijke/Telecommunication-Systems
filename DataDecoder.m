function Output = DataDecoder(start,EncodedData)
%   Decoder for the data of the hamming Encoder n stands for the number of bits to
%   be coded (7 or 15)
%   Detailed explanation goes here

n = 7;                % Code length
k = 4;                % Message length
n1 = 15;
k1 = 11;
Output = [];

if start ==1
    Output = decode(EncodedData,n,k,'hamming/decimal');

elseif start == 2
    Output = decode(EncodedData,n1,k1,'hamming/decimal');
else
    disp('Wrong input');
    
end

end

