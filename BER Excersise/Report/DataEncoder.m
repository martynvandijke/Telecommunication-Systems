function Output = DataEncoder(start,Data )
%   Desicion 

n = 7;                % Code length for the 7 bit transmission
k = 4;                % Message length for the 7bit transmisiion
n1 = 15;              % Code length for the 15 bit transmission
k1 = 11;              % Code length for the 15 bit transmission

Data= single(Data);
if start ==1
Var =     encode(Data,n,k,'hamming');
elseif start == 2
Var =    encode(Data,n1,k1,'hamming');
else
    disp('Wrong input');  
end

Output = single(Var); %de2bi(Var);
end

