function Output = DataDecoder(start,EncodedData)
%   Decoder for the data of the hamming Encoder n stands for the number of bits to
%   be coded (7 or 15)
%   Detailed explanation goes here

n = 7;                % Code length
k = 4;                % Message length
n1 = 15;
k2 = 11;
Output = [];

if start ==1
    Output = decode(EncodedData,n,k,'hamming/decimal');
%     for j = 8:8:length(Output)
%         %disp(j)
%         %disp(j + 7)
%     %Output = Var((j):(j+7));
%     Output(j) = [];
%     end   
%     
elseif start == 2
    Var = decode(EncodedData,n1,k1);
else
    disp('Wrong input');
    
end

end

