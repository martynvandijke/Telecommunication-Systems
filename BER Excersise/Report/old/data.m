function [] = data()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

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
Generator = [p_1,p_2,p_3,p_4, d_1,d_2,d_3,d_4,d_5,d_6,d_7];
Encoder = [ 1, 0, 0 ,0, p_1'; 0,1,0,0 , p_2'; 0,0,1,0, p_3'; 0,0,0,1,p_4'];
Decoder = [0,0,0,0,d_1';0,0,0,0,d_2';0,0,0,0,d_3';0,0,0,0,d_4';0,0,0,0,d_5';0,0,0,0,d_6';0,0,0,0,d_7';];
end

