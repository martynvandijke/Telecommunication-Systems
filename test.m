% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding(11,7) excersie for the Tu/e course Telecommunication Systems
clear variables;
clc; 

%Gp = [ p_1 , p_2, p_3, p_4, d_1, d_2, d_3, d_4, d_5, d_6, d_7];
%general variables for the generator matrix
x =   [0;1;1;0;1;0;1];
%data coloum vectors
d_1 = [1;0;0;0;0;0;0];
d_2 = [0;1;0;0;0;0;0];
d_3 = [0;0;1;0;0;0;0];
d_4 = [0;0;0;1;0;0;0];
d_5 = [0;0;0;0;1;0;0];
d_6 = [0;0;0;0;0;1;0];
d_7 = [0;0;0;0;0;0;1];
%parity bit colum vectors
p_1 = [1;1;0;1;1;0;1];
p_2 = [1;0;1;1;0;1;1];
p_3 = [0;1;1;1;0;0;0];
p_4 = [0;0;0;0;1;1;1];
%construct the generator matrix
G = [ p_1 , p_2, d_1, p_3,d_2,d_3,d_4,p_4,d_5,d_6,d_7];
D = [
encode = mod( (G'*x),2)
%mod(encode,2)