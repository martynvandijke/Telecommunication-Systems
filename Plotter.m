%clear all;
clc
close all;

load('FinalData.mat');

% step3 = 3;
% 
% parfor p = 1:41
% ErrorArray1(p) = sum(ErrorRow1(p:(step*p)));
% ErrorArray(p) = sum(ErrorRow(p:(step*p)));
% ErrorArray2(p) = sum(ErrorRow2(p:(step*p)));
% ErrorArray11(p) = sum(ErrorRow11(p:(step2*p)));
% ErrorArray01(p) = sum(ErrorRow01(p:(step2*p)));
% ErrorArray21(p) = sum(ErrorRow21(p:(step2*p)));
% ErrorArray12(p) = sum(ErrorRow12(p:(step3*p)));
% ErrorArray02(p) = sum(ErrorRow02(p:(step3*p)));
% ErrorArray22(p) = sum(ErrorRow22(p:(step3*p)));
% end
% 
% ErrorArray = fliplr((ErrorArray / length(Seq3) ));
% ErrorArray1 = fliplr((ErrorArray1 / length(Seq3)) );
% ErrorArray2 = fliplr((ErrorArray2 / length(Seq3)));
% 
% ErrorArray01 = fliplr((ErrorArray01/ length(Seq2)));
% ErrorArray11 = fliplr((ErrorArray11/ length(Seq2)));
% ErrorArray21 = fliplr((ErrorArray21/ length(Seq2)));
% 
% ErrorArray02 = fliplr((ErrorArray02/ length(Seq1)));
% ErrorArray12 = fliplr((ErrorArray12/ length(Seq1)));
% ErrorArray22 = fliplr((ErrorArray22/ length(Seq1)));
% 
% snr = -20:20;
% %% Seq 3
% figure
% %subplot(2,1,1)
% semilogy(snr,ErrorArray,'-.',snr,ErrorArray1,'--',snr,ErrorArray2);
% hold on;
% grid on;
% legend('Without Hamming coder','7 Bit Hammning coder','15 Bit Hammning coder')
% xlabel('SNR [dB]')
% ylabel('Bit Error Rate')
% 
% 
% %% Seq2
% %subplot(2,1,2)
% figure
% semilogy(snr,ErrorArray01,'-.',snr,ErrorArray11,'--',snr,ErrorArray21);
% hold on;
% grid on;
% legend('Without Hamming coder','7 Bit Hammning coder','15 Bit Hammning coder')
% xlabel('SNR [dB]')
% ylabel('Bit Error Rate')
% 
% %% Seq1
% %subplot(2,1,2)
% figure
% semilogy(snr,ErrorArray02,'-.',snr,ErrorArray12,'--',snr,ErrorArray22);
% hold on;
% grid on;
% legend('Without Hamming coder','7 Bit Hammning coder','15 Bit Hammning coder')
% xlabel('SNR [dB]')
% ylabel('Bit Error Rate')
FitArray = [abs(Gain),abs(Gain01),abs(Gain1),abs(Gain11),abs(Gain12),abs(Gain22)];

%fitted = fit(FitArray,snr ,'poly2');

figure('Name','Gain');
plot(snr,abs(Gain),snr,abs(Gain01),snr,abs(Gain1),snr,abs(Gain11),snr,abs(Gain12),snr,abs(Gain22) ,snr,fitted          );
hold on;
grid on;
h= legend('Seqence 3 7 bit transmission','Seqence 3 15 bit transmission','Seqence 2 7 bit transmission','Seqence 2 15 bit transmission','Seqence 1 7 bit transmission','Seqence 1 15 bit transmission');
set(h,'Interpreter','latex');
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Coding Gain','Interpreter','latex')
