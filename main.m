% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding excersie for the Tu/e course Telecommunication Systems
% This Matlab script makes use of the Communications Systems Toolbox
%and the LTE Systems Toolbox 

clc; 
close all;

%% PRBS generation (using the LTE Systems Toolbox)
Seq1 = ltePRBS(1,(2^7 -1 ));
Seq2 = ltePRBS(1,(2^11 -1 ));
Seq3 = ltePRBS(1,(10^6 ));
%convert the seqence to numbers instead of logical 1's and 0's
Seq3 = single(Seq3);
Seq1 = single(Seq1);
Seq2 = single(Seq2);

%% global
snr = -20:1:20;
step = floor( length(Seq3)/length(snr));
step2 = floor( length(Seq2)/length(snr));


%% Seq 3
%add Gaussian noise to the seqence
Noisy = Noise(Seq3);
%make a desicion if the recieved bit is a 0 or a 1
Decided = Decision(Noisy);

%calculate teh amount of errors for the reference signal
Error = biterr(Decided',Seq3)
ErrorRow = biterr(Decided',Seq3,'row-wise');
%ErrorRate = sum(Error) / length(Seq3)
%ErrorRateArray = ErrorRow ./ Seq3;

%Process the 7 bit transmission system
EncodedData1 = DataEncoder(1,Seq3);
Noisy1 = Noise(EncodedData1);
Decided1 = Decision(Noisy1);
%decode the stream of bits
DecodedData1 = DataDecoder(1,Decided);
%caclulate the amount of errors & error rate
Error1 = biterr(Decided1',Seq3)
ErrorRow1 = biterr(Decided1',Seq3,'row-wise');
%ErrorRateArray1 = ErrorRow1 ./ Seq3;
%ErrorRate1 = sum(Error1) / length(Seq3)

%Process the 15 bit transmission system
EncodedData2 = DataEncoder(2,Seq3);
Noisy2 = Noise(EncodedData2);
Decided2 = Decision(Noisy2);
DecodedData2 = DataDecoder(2,Decided2);
Error2 = biterr(Decided2',Seq3)
ErrorRow2 = biterr(Decided2',Seq3,'row-wise');
%ErrorRate2 = sum(Error2) / length(Seq3)
%ErrorRateArray2 = ErrorRow2 ./ Seq3;

%ErrorRateArray1 = ErrorArray1 ./ step;
%ErrorRateArray2 = ErrorArray2 ./ step;

%% Seq 2 
%add Gaussian noise to the seqence
Noisy = Noise(Seq2);
%make a desicion if the recieved bit is a 0 or a 1
Decided01 = Decision(Noisy);

%calculate teh amount of errors for the reference signal
Error01 = biterr(Decided01',Seq2)
ErrorRow01 = biterr(Decided01',Seq2,'row-wise');
%ErrorRateArray01 = ErrorRow01 ./ Seq2;
%ErrorRate01 = sum(Error01) / length(Seq2)

%Process the 7 bit transmission system
EncodedData11 = DataEncoder(1,Seq2);
Noisy11 = Noise(EncodedData11);
Decided11 = Decision(Noisy11);
%decode the stream of bits
DecodedData11 = DataDecoder(1,Decided11);
%caclulate the amount of errors & error rate
Error11 = biterr(Decided11',Seq2)
ErrorRow11 = biterr(Decided11',Seq2,'row-wise');
%ErrorRateArray11 = ErrorRow11 ./ Seq2;
%ErrorRate11 = sum(Error11) / length(Seq2)

%Process the 15 bit transmission system
EncodedData21 = DataEncoder(2,Seq2);
Noisy21 = Noise(EncodedData21);
Decided21 = Decision(Noisy21);
DecodedData21 = DataDecoder(2,Decided21);
Error21 = biterr(Decided21',Seq2)
ErrorRow21 = biterr(Decided21',Seq2,'row-wise');
%ErrorRateArray21 = ErrorRow21 ./ Seq2;
%ErrorRate21 = sum(Error21) / length(Seq2)





figure();
plot(snr,ErrorArray,'b--o',snr,ErrorArray1,'--',snr,ErrorArray2,':');