clear all;
clc
close all;

load('TestV3.mat');

% S/N 

ErrorRateArray = ErrorArray ./ step;
ErrorRateArray1 = ErrorArray1 ./ step;
ErrorRateArray2 = ErrorArray2 ./ step;

ErrorRateArray = fliplr(ErrorRateArray);
ErrorRateArray1 = fliplr(ErrorRateArray1);
ErrorRateArray2 = fliplr(ErrorRateArray2);


figure();
subplot(2,1,1)
plot(snr,ErrorRateArray,snr,ErrorRateArray1,'--',snr,ErrorRateArray2,':');
hold on;
grid on;
legend('Without Hamming coder','7 Bit Hammning coder','15 Bit Hammning coder')
xlabel('SNR [dB]')
ylabel('Bit error Rate')

subplot(2,1,2)