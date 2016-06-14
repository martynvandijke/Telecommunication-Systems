% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding excersie for the Tu/e course Telecommunication Systems
% This Matlab script makes use of the Communications Systems Toolbox
%and the LTE Systems Toolbox adn the Parrel Computing Toolbox

clear all;
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

%% global variables
snr = -20:1:20;
step = floor( length(Seq3)/length(snr));
step2 = floor( length(Seq2)/length(snr));
step3 =  floor( length(Seq1)/length(snr));

%% Seq 3
%add Gaussian noise to the seqence
Noisy = Noise(Seq3);
%make a desicion if the recieved bit is a 0 or a 1
Decided = Decision(Noisy);

%calculate teh amount of errors for the reference signal
Error = biterr(Decided',Seq3)
ErrorRow = biterr(Decided',Seq3,'row-wise');
%Process the 7 bit transmission system
EncodedData1 = DataEncoder(1,Seq3);
Noisy1 = Noise(EncodedData1);
Decided1 = Decision(Noisy1);
%decode the stream of bits
DecodedData1 = DataDecoder(1,Decided);
%caclulate the amount of errors & error rate
Error1 = biterr(Decided1',Seq3)
ErrorRow1 = biterr(Decided1',Seq3,'row-wise');

%Process the 15 bit transmission system
EncodedData2 = DataEncoder(2,Seq3);
Noisy2 = Noise(EncodedData2);
Decided2 = Decision(Noisy2);
DecodedData2 = DataDecoder(2,Decided2);
Error2 = biterr(Decided2',Seq3)
ErrorRow2 = biterr(Decided2',Seq3,'row-wise');

%% Seq 2 
%add Gaussian noise to the seqence
Noisy = Noise(Seq2);
%make a desicion if the recieved bit is a 0 or a 1
Decided01 = Decision(Noisy);
%calculate teh amount of errors for the reference signal
Error01 = biterr(Decided01',Seq2)
ErrorRow01 = biterr(Decided01',Seq2,'row-wise');

%Process the 7 bit transmission system
EncodedData11 = DataEncoder(1,Seq2);
Noisy11 = Noise(EncodedData11);
Decided11 = Decision(Noisy11);
%decode the stream of bits
DecodedData11 = DataDecoder(1,Decided11);
%caclulate the amount of errors & error rate
Error11 = biterr(Decided11',Seq2)
ErrorRow11 = biterr(Decided11',Seq2,'row-wise');

%Process the 15 bit transmission system
EncodedData21 = DataEncoder(2,Seq2);
Noisy21 = Noise(EncodedData21);
Decided21 = Decision(Noisy21);
DecodedData21 = DataDecoder(2,Decided21);
Error21 = biterr(Decided21',Seq2)
ErrorRow21 = biterr(Decided21',Seq2,'row-wise');

%% Seq1
%add Gaussian noise to the seqence
Noisy = Noise(Seq1);
%make a desicion if the recieved bit is a 0 or a 1
Decided02 = Decision(Noisy);

%calculate teh amount of errors for the reference signal
Error02 = biterr(Decided02',Seq1)
ErrorRow02 = biterr(Decided02',Seq1,'row-wise');

%Process the 7 bit transmission system
EncodedData12 = DataEncoder(1,Seq1);
Noisy12 = Noise(EncodedData12);
Decided12 = Decision(Noisy12);
%decode the stream of bits
DecodedData12 = DataDecoder(1,Decided12);
%caclulate the amount of errors & error rate
Error12 = biterr(Decided12',Seq1)
ErrorRow12 = biterr(Decided12',Seq1,'row-wise');

%Process the 15 bit transmission system
EncodedData22 = DataEncoder(2,Seq1);
Noisy22 = Noise(EncodedData22);
Decided22 = Decision(Noisy22);
DecodedData22 = DataDecoder(2,Decided22);
Error22 = biterr(Decided22',Seq1)
ErrorRow22 = biterr(Decided22',Seq1,'row-wise');

parfor p = 1:41
ErrorArray1(p) = sum(ErrorRow1(p:(step*p)));
ErrorArray(p) = sum(ErrorRow(p:(step*p)));
ErrorArray2(p) = sum(ErrorRow2(p:(step*p)));
ErrorArray11(p) = sum(ErrorRow11(p:(step2*p)));
ErrorArray01(p) = sum(ErrorRow01(p:(step2*p)));
ErrorArray21(p) = sum(ErrorRow21(p:(step2*p)));
ErrorArray12(p) = sum(ErrorRow12(p:(step3*p)));
ErrorArray02(p) = sum(ErrorRow02(p:(step3*p)));
ErrorArray22(p) = sum(ErrorRow22(p:(step3*p)));
end

ErrorArray = fliplr((ErrorArray / length(Seq3) ));
ErrorArray1 = fliplr((ErrorArray1 / length(Seq3)) );
ErrorArray2 = fliplr((ErrorArray2 / length(Seq3)));

ErrorArray01 = fliplr((ErrorArray01/ length(Seq2)));
ErrorArray11 = fliplr((ErrorArray11/ length(Seq2)));
ErrorArray21 = fliplr((ErrorArray21/ length(Seq2)));

ErrorArray02 = fliplr((ErrorArray02/ length(Seq1)));
ErrorArray12 = fliplr((ErrorArray12/ length(Seq1)));
ErrorArray22 = fliplr((ErrorArray22/ length(Seq1)));

snr = -20:20;
%% Plotting of the Figure's

%% Seq 3
figure
semilogy(snr,ErrorArray,'-.',snr,ErrorArray1,'--',snr,ErrorArray2);
hold on;
grid on;
legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder','Interpreter','latex')
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Bit Error Rate','Interpreter','latex')


%% Seq2
figure
semilogy(snr,ErrorArray01,'-.',snr,ErrorArray11,'--',snr,ErrorArray21);
hold on;
grid on;
legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder','Interpreter','latex')
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Bit Error Rate','Interpreter','latex')

%% Seq1
figure
semilogy(snr,ErrorArray02,'-.',snr,ErrorArray12,'--',snr,ErrorArray22);
hold on;
grid on;
legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder','Interpreter','latex')
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Bit Error Rate','Interpreter','latex')