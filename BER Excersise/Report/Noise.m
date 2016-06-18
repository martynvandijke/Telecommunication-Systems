function Output = Noise( InputData )
%NOISE Function will add gaussian white noise to the input with varying snr

snr1 = -20:1:20; %range of the snr input
step = floor( length(InputData)/length(snr1));


parfor i = 1:length(InputData);
    if (i/step) <= 1
        SnrInput = 1    ;     
%     else
%         SnrInput = floor( i/ step    ) ;
%         if SnrInput > length(snr1)
%             SnrInput = 41;
%         end
    end
    Noisy(i) = awgn(InputData(i),snr1(SnrInput));
end
Output = Noisy;
end

