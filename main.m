% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding excersie for the Tu/e course Telecommunication Systems
% This Matlab script makes use of the Communications Systems Toolbox
%and the LTE Systems Toolbox 

clear variables;
clc; 


%% PRBS generation
Seq1 = ltePRBS(1,(2^7 -1 ));
Seq2 = ltePRBS(1,(2^11 -1 ));
Seq3 = ltePRBS(1,(10^6 ));

%convert to numbers instead of logical 1's and 0's
Seq3 = single(Seq3);

snr = 1;

%add Gaussian noise to the seqence

%Noisy = Noise(Seq3);
%Noisy = Seq3;
snr = 1:1:20;
step = floor( length(Seq3)/length(snr))

% for i = 1:length(Seq3)
%     if i <= step
%         SnrInput = 1 ;
%     else
%         SnrInput = floor( length(Seq3(1:i)) / length(snr) );
%     end
%      Noisy = awgn(Seq3,snr(SnrInput));
% end
Decided = Decision(Noisy);

%calculate teh amount of errors for the reference signal
Error = biterr(Decided',Seq3)
ErrorRate = sum(Error) / length(Seq3)

%encode the seqence of bits
EncodedData1 = DataEncoder(1,Seq3);
Noisy1 = awgn(EncodedData1,10,'measured');
%decide if the noisy bits are 0 or 1's
Decided1 = Decision(Noisy1);
%decode the stream of bits
DecodedData1 = DataDecoder(1,Decided);

%caclulate the amount of errors for the Hamming coded signal
Error1 = biterr(Decided1',Seq3)
ErrorRate = sum(Error1) / length(Seq3)



