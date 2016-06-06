function Output = Noise( InputData )
%NOISE Function will add gaussian white noise to the input with varying snr
%   Detailed explanation goes here

snr = 1:1:30;
step = floor( length(InputData)/length(snr))
for i = 1:1:length(InputData)
    SnrInput = 1 + floor( step / length(InputData));
    Noisy(i) = awgn(InputData(i),snr(SnrInput));

end
Output = Noisy
end

