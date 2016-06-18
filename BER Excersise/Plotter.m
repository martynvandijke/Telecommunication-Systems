%clear all;
clc
close all;

load('FinalDataV2.mat');


% 
% FitArray = [ErrorArray;ErrorArray01;ErrorArray02];
% 
% fitted = fit([ErrorArray',ErrorArray01'],snr','poly22');
% for i = 1:41
%     for o = 1:41
%     if ErrorArray(i) == ErrorArray01(o)
%        gainV2 =  o-p;
%     end
%     end
% end
% %pdist(ErrorArray,'hamming');
% 
% test = setdiff(ErrorArray,ErrorArray01)




figure('Name','Seq2');
plot(ErrorArray01,snr);;
hold on;
grid on;
h= legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder');
set(h,'Interpreter','latex');
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Bit Error Rate','Interpreter','latex')


% testV2 = ErrorArray1 - ErrorArray;
% grad = gradient(ErrorArray);
% gain = testV2 .* grad*10^3;
% fitted = fit(snr',gain','poly2');
% 
% 
% diff2 = ErrorArray2 - ErrorArray;
% grad2 = gradient(ErrorArray);
% gain2 = diff2 .* grad2*10^3;
% fitted2 = fit(snr',gain2','poly2');
% 
% figure();
% plot(snr,gain);
% figure();
% grid on;
% %hold on;
% plot(fitted,'fit');
%plot(fitted2,'fit');
%hold off;
% figure('Name','Gain');
% plot(snr,Gain,snr,Gain01,snr,Gain1,snr,Gain1,snr,Gain12,snr,Gain22       );
% hold on;
% grid on;
% h= legend('Seqence 3 7 bit transmission','Seqence 3 15 bit transmission','Seqence 2 7 bit transmission','Seqence 2 15 bit transmission','Seqence 1 7 bit transmission','Seqence 1 15 bit transmission');
% set(h,'Interpreter','latex');
% xlabel('SNR [dB]','Interpreter','latex')
% ylabel('Coding Gain','Interpreter','latex')
