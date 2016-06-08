clear all;
clc
close all;

load('TestV5.mat');

% S/N 
% 
% ErrorRateArray = ErrorArray ./ step;
% ErrorRateArray1 = ErrorArray1 ./ step;
% ErrorRateArray2 = ErrorArray2 ./ step;
% 
% ErrorRateArray = fliplr(ErrorRateArray);
% ErrorRateArray1 = fliplr(ErrorRateArray1);
% ErrorRateArray2 = fliplr(ErrorRateArray2);

parfor p = 1:41
ErrorArray1(p) = sum(ErrorRow1(p:(step*p)));
ErrorArray(p) = sum(ErrorRow(p:(step*p)));
ErrorArray2(p) = sum(ErrorRow2(p:(step*p)));
ErrorArray11(p) = sum(ErrorRow11(p:(step2*p)));
ErrorArray01(p) = sum(ErrorRow01(p:(step2*p)));
ErrorArray21(p) = sum(ErrorRow21(p:(step2*p)));
end

% figure
% %subplot(2,1,1)
% plot(snr,ErrorArray,':',snr,ErrorArray1,'--',snr,ErrorArray2);
% hold on;
% grid on;
% legend('Without Hamming coder','7 Bit Hammning coder','15 Bit Hammning coder')
% xlabel('SNR [dB]')
% ylabel('Errors')


ErrorArray = fliplr((ErrorArray / length(Seq3) ));
ErrorArray1 = fliplr((ErrorArray1 / length(Seq3)) );
ErrorArray2 = fliplr((ErrorArray2 / length(Seq3)));

ErrorArray01 = fliplr((ErrorArray01/ length(Seq2)));
ErrorArray11 = fliplr((ErrorArray1/ length(Seq2)));
ErrorArray21 = fliplr((ErrorArray2/ length(Seq2)));

snr = -20:20;
%% Seq 3
figure
%subplot(2,1,1)
semilogy(snr,ErrorArray,'-.',snr,ErrorArray1,'--',snr,ErrorArray2);
hold on;
grid on;
legend('Without Hamming coder','7 Bit Hammning coder','15 Bit Hammning coder')
xlabel('SNR [dB]')
ylabel('Bit Error Rate')




%% Seq2
%subplot(2,1,2)
figure
semilogy(snr,ErrorArray01,'-.',snr,ErrorArray11,'--',snr,ErrorArray21);
hold on;
grid on;
legend('Without Hamming coder','7 Bit Hammning coder','15 Bit Hammning coder')
xlabel('SNR [dB]')
ylabel('Bit Error Rate')
