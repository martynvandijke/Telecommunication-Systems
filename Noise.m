function Output = Noise( InputData )
%NOISE Function will add gaussian white noise to the input with varying snr

snr = -20:1:20; %range of the snr input
step = floor( length(InputData)/length(snr));

for i = 1:length(InputData);
    if i/step <= 1
        SnrInput = 1 ;
    else
        SnrInput = floor( i/ step    );
    end
    Noisy(i) = awgn(InputData(i),snr(SnrInput));
end
Output = Noisy;
end

