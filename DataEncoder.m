function Output = DataEncoder(start,Data )
%   Encoder for the data of the hamming n stands for the number of bits to
%   be coded (7 or 15)

n = 7;                % Code length
k = 4;                % Message length
n1 = 15;
k1 = 11;


if start ==1
Output=     encode(Data,n,k,'hamming/decimal');
elseif start == 2
Output =    encode(Data,n1,k1,'hamming/decimal');
else
    disp('Wrong input');
    
end


end

