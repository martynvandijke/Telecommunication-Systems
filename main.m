% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding excersie for the Tu/e course Telecommunication Systems
% This Matlab script makes use of the Communications Systems Toolbox
%and the LTE Systems Toolbox 

clear variables;
clc; 

%%the to encode bit stream
x =   [1;1;0;0;1;0;1;1;1;0;0;1;0;1;1;1;0;0;1;0;1];

%% Hamming encoder & decoder

EncodedData = DataEncoder(1,x);
DecodedData = DataDecoder(1,EncodedData);


%% PRBS generation
Seq1 = ltePRBS(1,(2^7 -1 ));
Seq2 = ltePRBS(1,(2^11 -1 ));
Seq3 = ltePRBS(1,(10^6 ));

%convert to numbers
Seq3 = single(Seq3);

snr = 1

%add Gaussian noise to the seqence
Noisy = awgn(Seq3,snr,'measured');

%meassure the amount of errors 
Error = abs(Seq3 - round(Noisy));
NumberOfErrors = sum(Error)
ErrorRate = sum(Error) / length(Seq3)

%
EncodedData1 = DataEncoder(1,Seq3);
Noisy1 = awgn(EncodedData1,100,'measured');

DecodedData1 = DataDecoder(1,Noisy1);
Error1 = abs(Seq3 - DecodedData1);
NumberOfErrors1 = sum(Error1)
ErrorRate1 = sum(Error1) / length(Seq3)


