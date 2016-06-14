function Output = Decision( InputData )
%Desicion function in order to decide if the incoming data is a logical '1'
%or a logical 'o'
tresshold = 0.5; %thresshold to be defined 

parfor i = 1:length(InputData)
    if InputData(i) <= tresshold
        Output(i) = 0;
    else
        Output(i) = 1;
    end    
end
end

