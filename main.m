% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding excersie for the Tu/e course Telecommunication Systems
% This Matlab script makes use of the Communications Systems Toolbox
%and the LTE Systems Toolbox 

clear variables;
clc; 

%%the to encode bit stream
x =   [1;1;0;0;1;0;1];




%% encodeing & decoding
n = 7;                % Code length
k = 4;                % Message length

n1 = 15;
k2 = 11;

encData = encode(x,n,k);
encData(10) = ~encData(10);


decData = decode(encData,n,k);

DataEncoder();
DataDecoder()

disp('Decoding the bitstream');


%% PRBS
seq1 = ltePRBS(1,(2^7 -1 ));
seq2 = ltePRBS(1,(2^11 -1 ));


numerr = biterr(x,decData(1:7))
