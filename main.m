% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding excersie for the Tu/e course Telecommunication Systems
% This Matlab script makes use of the Communications Systems Toolbox
%and the LTE Systems Toolbox 

%clear variables;
clc; 
close all;

%% PRBS generation
Seq1 = ltePRBS(1,(2^7 -1 ));
Seq2 = ltePRBS(1,(2^11 -1 ));
Seq3 = ltePRBS(1,(10^6 ));

%convert to numbers instead of logical 1's and 0's
Seq3 = single(Seq3);
Seq1 = single(Seq1);
Seq2 = single(Seq2);
%add Gaussian noise to the seqence

Noisy = Noise(Seq3);
Decided = Decision(Noisy);

%calculate teh amount of errors for the reference signal
Error = biterr(Decided',Seq3)
ErrorRow = biterr(Decided',Seq3,'row-wise');
ErrorRate = sum(Error) / length(Seq3)

%encode the seqence of bits
EncodedData1 = DataEncoder(1,Seq3);
Noisy1 = Noise(EncodedData1);

%decide if the noisy bits are 0 or 1's
Decided1 = Decision(Noisy1);
%decode the stream of bits
DecodedData1 = DataDecoder(1,Decided);

%caclulate the amount of errors for the Hamming coded signal
Error1 = biterr(Decided1',Seq3)
ErrorRow1 = biterr(Decided1',Seq3,'row-wise');
ErrorRate1 = sum(Error1) / length(Seq3)


%%% 15 bit transmission

EncodedData2 = DataEncoder(2,Seq3);
Noisy2 = Noise(EncodedData2);

%decide if the noisy bits are 0 or 1's
Decided2 = Decision(Noisy2);
%decode the stream of bits
DecodedData2 = DataDecoder(2,Decided);

%caclulate the amount of errors for the Hamming coded signal
Error2 = biterr(Decided2',Seq3)
ErrorRow2 = biterr(Decided2',Seq3,'row-wise');
ErrorRate2 = sum(Error2) / length(Seq3)

snr = 1:1:20;
step = floor( length(Seq3)/length(snr));
for p = 1:20
ErrorArray1(p) = sum(ErrorRow1(p:(step*p)));
ErrorArray(p) = sum(ErrorRow(p:(step*p)));
ErrorArray2(p) = sum(ErrorRow2(p:(step*p)));
end

snr = 1:1:20;
figure();
plot(snr,ErrorArray,'b--o',snr,ErrorArray1,'--',snr,ErrorArray2,':');