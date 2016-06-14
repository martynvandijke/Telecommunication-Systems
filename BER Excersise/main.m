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

%convert the seqence to numbers instead of logical 1's and 0's
Seq1 = single(Seq1);
Seq2 = single(Seq2);

n1 = round(10^6/length(Seq1));
Seq33 = repmat(Seq1',1,n1);

n2 = round(10^6/length(Seq2));
Seq22 = repmat(Seq2',1,n2);

Seq22 = Seq22';
Seq33 = Seq33';
%Seq33 = repelem(Seq1,100);
% for i = 1:length(Seq1):10^6
%     for j = 1:length(Seq1)
%    Seq33 = Seq1(j) ; 
%     end
% end

%% global variables
snr = -20:1:20;
step = floor( length(Seq33)/length(snr));
step2 = floor( length(Seq22)/length(snr));
%step3 =  floor( length(Seq11)/length(snr));

%% Seq 3
%add Gaussian noise to the seqence
Noisy = Noise(Seq33);
%make a desicion if the recieved bit is a 0 or a 1
Decided = Decision(Noisy);

%calculate teh amount of errors for the reference signal
Error = biterr(Decided',Seq33)
ErrorRow = biterr(Decided',Seq33,'row-wise');
%Process the 7 bit transmission system
EncodedData1 = DataEncoder(1,Seq33);
Noisy1 = Noise(EncodedData1);
Decided1 = Decision(Noisy1);
%decode the stream of bits
DecodedData1 = DataDecoder(1,Decided);
%caclulate the amount of errors & error rate
Error1 = biterr(Decided1',Seq33)
ErrorRow1 = biterr(Decided1',Seq33,'row-wise');

%Process the 15 bit transmission system
EncodedData2 = DataEncoder(2,Seq33);
Noisy2 = Noise(EncodedData2);
Decided2 = Decision(Noisy2);
DecodedData2 = DataDecoder(2,Decided2);
Error2 = biterr(Decided2',Seq33)
ErrorRow2 = biterr(Decided2',Seq33,'row-wise');

%% Seq 2 
%add Gaussian noise to the seqence
Noisy = Noise(Seq22);
%make a desicion if the recieved bit is a 0 or a 1
Decided01 = Decision(Noisy);
%calculate teh amount of errors for the reference signal
Error01 = biterr(Decided01',Seq22)
ErrorRow01 = biterr(Decided01',Seq22,'row-wise');

%Process the 7 bit transmission system
EncodedData11 = DataEncoder(1,Seq22);
Noisy11 = Noise(EncodedData11);
Decided11 = Decision(Noisy11);
%decode the stream of bits
DecodedData11 = DataDecoder(1,Decided11);
%caclulate the amount of errors & error rate
Error11 = biterr(Decided11',Seq22)
ErrorRow11 = biterr(Decided11',Seq22,'row-wise');

%Process the 15 bit transmission system
EncodedData21 = DataEncoder(2,Seq22);
Noisy21 = Noise(EncodedData21);
Decided21 = Decision(Noisy21);
DecodedData21 = DataDecoder(2,Decided21);
Error21 = biterr(Decided21',Seq22)
ErrorRow21 = biterr(Decided21',Seq22,'row-wise');

% %% Seq1
% %add Gaussian noise to the seqence
% Noisy = Noise(Seq11);
% %make a desicion if the recieved bit is a 0 or a 1
% Decided02 = Decision(Noisy);
% 
% %calculate teh amount of errors for the reference signal
% Error02 = biterr(Decided02',Seq11)
% ErrorRow02 = biterr(Decided02',Seq11,'row-wise');
% 
% %Process the 7 bit transmission system
% EncodedData12 = DataEncoder(1,Seq11);
% Noisy12 = Noise(EncodedData12);
% Decided12 = Decision(Noisy12);
% %decode the stream of bits
% DecodedData12 = DataDecoder(1,Decided12);
% %caclulate the amount of errors & error rate
% Error12 = biterr(Decided12',Seq11)
% ErrorRow12 = biterr(Decided12',Seq11,'row-wise');
% 
% %Process the 15 bit transmission system
% EncodedData22 = DataEncoder(2,Seq11);
% Noisy22 = Noise(EncodedData22);
% Decided22 = Decision(Noisy22);
% DecodedData22 = DataDecoder(2,Decided22);
% Error22 = biterr(Decided22',Seq11)
% ErrorRow22 = biterr(Decided22',Seq11,'row-wise');

parfor p = 1:41
ErrorArray1(p) = sum(ErrorRow1(p:(step*p)));
ErrorArray(p) = sum(ErrorRow(p:(step*p)));
ErrorArray2(p) = sum(ErrorRow2(p:(step*p)));
ErrorArray11(p) = sum(ErrorRow11(p:(step2*p)));
ErrorArray01(p) = sum(ErrorRow01(p:(step2*p)));
ErrorArray21(p) = sum(ErrorRow21(p:(step2*p)));
%ErrorArray12(p) = sum(ErrorRow12(p:(step3*p)));
%ErrorArray02(p) = sum(ErrorRow02(p:(step3*p)));
%ErrorArray22(p) = sum(ErrorRow22(p:(step3*p)));
end

ErrorArray = fliplr((ErrorArray / length(Seq33) ));
ErrorArray1 = fliplr((ErrorArray1 / length(Seq33)) );
ErrorArray2 = fliplr((ErrorArray2 / length(Seq33)));

ErrorArray01 = fliplr((ErrorArray01/ length(Seq22)));
ErrorArray11 = fliplr((ErrorArray11/ length(Seq22)));
ErrorArray21 = fliplr((ErrorArray21/ length(Seq22)));

% ErrorArray02 = fliplr((ErrorArray02/ length(Seq11)));
% ErrorArray12 = fliplr((ErrorArray12/ length(Seq11)));
% ErrorArray22 = fliplr((ErrorArray22/ length(Seq11)));

snr = -20:20;

%% Coding Gain
%how much can the S/N ratio degrade while keeping the same BER
parfor p = 1:41
    for o = 1:41
        if (ErrorArray1(p) > 0.95*ErrorArray(o) && ErrorArray1(p) < 1.05*ErrorArray(o) )
        Gain(p) = o-p
        end
        if (ErrorArray11(p) > 0.95*ErrorArray01(o) && ErrorArray11(p) < 1.05*ErrorArray01(o) )
        Gain1(p) = o-p
        end
%         if (ErrorArray12(p) > 0.95*ErrorArray02(o) && ErrorArray12(p) < 1.05*ErrorArray02(o) )
%         Gain12(p) = o-p
%         end
        
        if (ErrorArray2(p) > 0.95*ErrorArray(o) && ErrorArray2(p) < 1.05*ErrorArray(o) )
        Gain01(p) = o-p
        end
        if (ErrorArray21(p) > 0.95*ErrorArray01(o) && ErrorArray21(p) < 1.05*ErrorArray01(o) )
        Gain11(p) = o-p
        end
%         if (ErrorArray22(p) > 0.95*ErrorArray02(o) && ErrorArray22(p) < 1.05*ErrorArray02(o) )
%         Gain22(p) = o-p
%         end
    end
end


%% Plotting of the Figure's

% figure('Name','Gain');
% plot(snr,abs(Gain),snr,abs(Gain01),snr,abs(Gain1),snr,abs(Gain11),snr,abs(Gain12),snr,abs(Gain22)           );
% hold on;
% grid on;
% h= legend('Seqence 3 7 bit transmission','Seqence 3 15 bit transmission','Seqence 2 7 bit transmission','Seqence 2 15 bit transmission','Seqence 1 7 bit transmission','Seqence 1 15 bit transmission');
% set(h,'Interpreter','latex');
% xlabel('SNR [dB]','Interpreter','latex')
% ylabel('Coding Gain','Interpreter','latex')


%% Plot of BER
%% Seq 3
figure('Name','Seq3');
semilogy(snr,ErrorArray,'-.',snr,ErrorArray1,'--',snr,ErrorArray2);
hold on;
grid on;
h= legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder','Interpreter','latex');
set(h,'Interpreter','latex');
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Bit Error Rate','Interpreter','latex')


%% Seq2
figure('Name','Seq2');
semilogy(snr,ErrorArray01,'-.',snr,ErrorArray11,'--',snr,ErrorArray21);
hold on;
grid on;
h= legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder');
set(h,'Interpreter','latex');
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Bit Error Rate','Interpreter','latex')
% 
% %% Seq1
% figure('Name','Seq1')
% semilogy(snr,ErrorArray02,'-.',snr,ErrorArray12,'--',snr,ErrorArray22);
% hold on;
% grid on;
% h = legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder','Interpreter','latex');
% set(h,'Interpreter','latex');
% xlabel('SNR [dB]','Interpreter','latex')
% ylabel('Bit Error Rate','Interpreter','latex')