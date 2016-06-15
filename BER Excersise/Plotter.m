%clear all;
clc
close all;

load('FinalDataV2.mat');

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


FitArray = [abs(Gain),abs(Gain01),abs(Gain1),abs(Gain11),abs(Gain12),abs(Gain22)];

%fitted = fit(FitArray,snr ,'poly2');

figure('Name','Gain');
plot(snr,Gain,snr,Gain01,snr,Gain1,snr,Gain1,snr,Gain12,snr,Gain22       );
hold on;
grid on;
h= legend('Seqence 3 7 bit transmission','Seqence 3 15 bit transmission','Seqence 2 7 bit transmission','Seqence 2 15 bit transmission','Seqence 1 7 bit transmission','Seqence 1 15 bit transmission');
set(h,'Interpreter','latex');
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Coding Gain','Interpreter','latex')
