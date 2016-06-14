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

%% global variables
snr = -20:1:20;
step = floor( length(Seq33)/length(snr));
step2 = floor( length(Seq22)/length(snr));

%% Seq 3
%add Gaussian noise to the seqence
Noisy = Noise(Seq33);
%make a desicion if the recieved bit is a 0 or a 1
Decided = Decision(Noisy);
%calculate the amount of errors for the reference signal
ErrorRow = biterr(Decided',Seq33,'row-wise');
%ErrorRow = ((Decided' == Seq33)==0);

%Process the 7 bit transmission system
EncodedData1 = DataEncoder(1,Seq33);
Noisy1 = Noise(EncodedData1);
Decided1 = Decision(Noisy1);
%decode the stream of bits
DecodedData1 = DataDecoder(1,Decided);
%caclulate the amount of errors & error rate
ErrorRow1 = biterr(DecodedData1',Seq33,'row-wise');

%Process the 15 bit transmission system
EncodedData2 = DataEncoder(2,Seq33);
Noisy2 = Noise(EncodedData2);
Decided2 = Decision(Noisy2);
DecodedData2 = DataDecoder(2,Decided2);
ErrorRow2 = biterr(DecodedData2',Seq33,'row-wise');

%% Seq 2 
%add Gaussian noise to the seqence
Noisy = Noise(Seq22);
%make a desicion if the recieved bit is a 0 or a 1
Decided01 = Decision(Noisy);
%calculate teh amount of errors for the reference signal
ErrorRow01 = biterr(Decided01',Seq22,'row-wise');
%Process the 7 bit transmission system
EncodedData11 = DataEncoder(1,Seq22);
Noisy11 = Noise(EncodedData11);
Decided11 = Decision(Noisy11);
%decode the stream of bits
DecodedData11 = DataDecoder(1,Decided11);
%caclulate the amount of errors & error rate
ErrorRow11 = biterr(DecodedData11',Seq22,'row-wise');
%Process the 15 bit transmission system
EncodedData21 = DataEncoder(2,Seq22);
Noisy21 = Noise(EncodedData21);
Decided21 = Decision(Noisy21);
DecodedData21 = DataDecoder(2,Decided21);
ErrorRow21 = biterr(DecodedData21',Seq22,'row-wise');

for i = 1:1:41
    ErrorArray_temp(i) = sum( (ErrorRow((step*i - step+1):(step*i)) ));
    %ErrorArray_tempTest(i) = cumsum( (ErrorRow(p:(step*p)) ))
    ErrorArray1_temp(i) = sum( ( ErrorRow1((step*i - step +1):(step*i)) ));
    ErrorArray2_temp(i) = sum(  (ErrorRow2((step*i - step +1):(step*i)) ));
    ErrorArray11_temp(i) = sum( (ErrorRow11((step2*i - step2 +1):(step2*i)) ));
    ErrorArray01_temp(i) = sum( (ErrorRow01((step2*i - step2 +1):(step2*i)) ));
    ErrorArray21_temp(i) = sum( (ErrorRow21((step2*i - step2 +1):(step2*i)) ));
end

% for p = 1:41
% ErrorArray_temp(p) = sum(ErrorRow(p:(step*p)));
% ErrorArray1_temp(p) = sum(ErrorRow1(p:(step*p)));
% ErrorArray2_temp(p) = sum(ErrorRow2(p:(step*p)));
% ErrorArray11_temp(p) = sum(ErrorRow11(p:(step2*p)));
% ErrorArray01_temp(p) = sum(ErrorRow01(p:(step2*p)));
% ErrorArray21_temp(p) = sum(ErrorRow21(p:(step2*p)));
% end

% ErrorArray = (step / ErrorArray_temp  );
% ErrorArray1 = (step / ErrorArray1_temp ) ;
% ErrorArray2 = (step / ErrorArray2_temp );
% 
% ErrorArray01 = (step2 / ErrorArray01_temp);
% ErrorArray11 = (step2/ ErrorArray11_temp);
% ErrorArray21 = (step2 / ErrorArray21_temp);

ErrorArray = (ErrorArray_temp ./ length(Seq33) );
ErrorArray1 = (ErrorArray1_temp ./ length(Seq33)) ;
ErrorArray2 = (ErrorArray2_temp ./ length(Seq33));

ErrorArray01 = (ErrorArray01_temp ./ length(Seq22));
ErrorArray11 = (ErrorArray11_temp ./ length(Seq22));
ErrorArray21 = (ErrorArray21_temp ./ length(Seq22));


% ErrorArray = fliplr((ErrorArray_temp ./ length(Seq33) ));
% ErrorArray1 = fliplr((ErrorArray1_temp ./ length(Seq33)) );
% ErrorArray2 = fliplr((ErrorArray2_temp ./ length(Seq33)));
% 
% ErrorArray01 = fliplr((ErrorArray01_temp ./ length(Seq22)));
% ErrorArray11 = fliplr((ErrorArray11_temp ./ length(Seq22)));
% ErrorArray21 = fliplr((ErrorArray21_temp ./ length(Seq22)));

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
        
        if (ErrorArray2(p) > 0.95*ErrorArray(o) && ErrorArray2(p) < 1.05*ErrorArray(o) )
        Gain01(p) = o-p
        end
        if (ErrorArray21(p) > 0.95*ErrorArray01(o) && ErrorArray21(p) < 1.05*ErrorArray01(o) )
        Gain11(p) = o-p
        end
    end
end


%% Plot of BER
%% Seq 3
figure('Name','Seq3');
semilogy(snr,ErrorArray,'-.',snr,ErrorArray1,snr,ErrorArray2);
hold on;
grid on;
h= legend('Reference','7 Bit Hammning coder','15 Bit Hammning coder');
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

%%coding gain
figure('Name','Gain');
plot(snr,abs(Gain),snr,abs(Gain01),snr,abs(Gain1),snr,abs(Gain11)         );
hold on;
grid on;
h= legend('Seqence 3 7 bit transmission','Seqence 3 15 bit transmission','Seqence 2 7 bit transmission','Seqence 2 15 bit transmission','Seqence 1 7 bit transmission','Seqence 1 15 bit transmission');
set(h,'Interpreter','latex');
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Coding Gain','Interpreter','latex')