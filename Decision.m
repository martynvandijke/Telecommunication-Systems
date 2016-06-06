function Output = Decision( InputData )
%PBRS Summary of this function goes here
%   Detailed explanation goes here
tresshold = 0.5;

for i = 1:length(InputData)
    if InputData(i) <= tresshold
        Output(i) = 0;
    else
        Output(i) = 1;
    end
    
    
end

end

