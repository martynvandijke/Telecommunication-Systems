%data coloum vectors
d_1 = [1;0;0;0;0;0;0];
d_2 = [0;1;0;0;0;0;0];
d_3 = [0;0;1;0;0;0;0];
d_4 = [0;0;0;1;0;0;0];
d_5 = [0;0;0;0;1;0;0];
d_6 = [0;0;0;0;0;1;0];
d_7 = [0;0;0;0;0;0;1];

%%second matrix for the 15 bit transmisson
d_11 = [1;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
d_21 = [0;1;0;0;0;0;0;0;0;0;0;0;0;0;0];
d_31 = [0;0;1;0;0;0;0;0;0;0;0;0;0;0;0];
d_41 = [0;0;0;1;0;0;0;0;0;0;0;0;0;0;0];
d_51 = [0;0;0;0;1;0;0;0;0;0;0;0;0;0;0];
d_61 = [0;0;0;0;0;1;0;0;0;0;0;0;0;0;0];
d_71 = [0;0;0;0;0;0;1;0;0;0;0;0;0;0;0];
d_8 =  [0;0;0;0;0;0;0;1;0;0;0;0;0;0;0];
d_9 =  [0;0;0;0;0;0;0;0;1;0;0;0;0;0;0];
d_10 = [0;0;0;0;0;0;0;0;0;1;0;0;0;0;0];
d_11 = [0;0;0;0;0;0;0;0;0;0;1;0;0;0;0];
d_12 = [0;0;0;0;0;0;0;0;0;0;0;1;0;0;0];
d_13 = [0;0;0;0;0;0;0;0;0;0;0;0;1;0;0];
d_14 = [0;0;0;0;0;0;0;0;0;0;0;0;0;1;0];
d_15 = [0;0;0;0;0;0;0;0;1;0;0;0;0;0;1];

%parity bit colum vectors
p_1 = [1;1;0;1;1;0;1];
p_2 = [1;0;1;1;0;1;1];
p_3 = [0;1;1;1;0;0;0];
p_4 = [0;0;0;0;1;1;1];

% second matrix for the 15 bit transmission
p_11 = [1;1;0;1;1;0;1;0;0;0;0;0;0;0;0];
p_21 = [1;0;1;1;0;1;1;0;0;0;0;0;0;0;0];
p_31 = [0;1;1;1;0;0;0;0;0;0;0;0;0;0;0];
p_41 = [0;0;0;0;1;1;1;0;0;0;0;0;0;0;0];
p_5  = [0;0;0;0;1;1;1;0;0;0;0;0;0;0;0];

%construct the generator matrix
Generator = [p_1,p_2,p_3,p_4, d_1,d_2,d_3,d_4,d_5,d_6,d_7];
Encoder = [ 1, 0, 0 ,0, p_1'; 0,1,0,0 , p_2'; 0,0,1,0, p_3'; 0,0,0,1,p_4'];
Decoder = [0,0,0,0,d_1';0,0,0,0,d_2';0,0,0,0,d_3';0,0,0,0,d_4';0,0,0,0,d_5';0,0,0,0,d_6';0,0,0,0,d_7';];

%second matrix for the 15 bit transmission
Generator1 = [p_11,p_21,p_31,p_41, p_5, d_11,d_21,d_31,d_41,d_51,d_61,d_71,d_8,d_9,d_10,d_11,d_12,d_13,d_14,d_15];
Encoder1 = [ 1, 0, 0 ,0, 0 p_11'; 0,1,0,0,0, p_21'; 0,0,1,0,0, p_31'; 0,0,0,1,0,p_41' ; 0,0,0,0,1 p_5' ];
Decoder1 = [0,0,0,0,0,d_11';0,0,0,0,0,d_21';0,0,0,0,0,d_31';0,0,0,0,0,d_41';0,0,0,0,0,d_51';0,0,0,0,0,d_61';0,0,0,0,0,d_71';0,0,0,0,0,d_8';0,0,0,0,0,d_9';0,0,0,0,0,d_10';0,0,0,0,0,d_11';0,0,0,0,0,d_12';0,0,0,0,0,d_13';0,0,0,0,0,d_14';0,0,0,0,0,d_15'];

Null = [0;0;0;0];
Null1 = [0;0;0;0;0];

%% do the actual computational work
disp('Encoding the bistream');
Encoded = mod( (Generator'*x),2)

%load other faulty encoded bit stream debugging purpose
%load('matlab2.mat')



disp('Caclulting the syndrome matrix');

not_done = true;

% if nnz(Syndrome) ~= 0
%     while not_done
%     FixedEncoded = Encoded2;
%     for j=1:1:4
%         if Syndrome(j) ~= 0;
%             ErrorPlace =  ErrorPlace + j
%         end
%     end
%     if ErrorPlace == 9 ||  ErrorPlace == 10 || ErrorPlace == 8 
%         
%     else
%         ErrorPlace = ErrorPlace + 4;
%     end
%     disp('Place')
%     disp(ErrorPlace);
%     if FixedEncoded((ErrorPlace)) == 1
%        FixedEncoded(ErrorPlace) = 0
%      else
%        FixedEncoded(ErrorPlace) = 1
%     end
%     disp('calculating syndrome again')
%     Syndrome = mod((Encoder*FixedEncoded),2)
%     %clear ErrorPlace;
%     ErrorPlace = 0;
%     disp(ErrorPlace)
%     if nnz(Syndrome) == 0;
%         not_done = false;
%     end
%     end
% end
Encoded2 = [0;0;1;0;1;1;0;      0;1;0;0];

Syndrome = mod((Encoder*Encoded2),2)
FixedEncoded =  Encoded;   

% if nnz(Syndrome) ~= 0
%     
%     disp('Errors revcieved');
%     ErrorPlace = 0;   
%     for j=1:1:4
%         if Syndrome(j) ~= 0;
%             ErrorPlace =  ErrorPlace + j
%         end
%     end
%     disp('Place')
%     disp(ErrorPlace);
%     if FixedEncoded((ErrorPlace)) == 1
%        FixedEncoded(ErrorPlace) = 0
%      else
%        FixedEncoded(ErrorPlace) = 1
%     end
% end


Decode = mod((Decoder*FixedEncoded),2);


%% encodeing & decoding
% n = 7;                % Code length
% k = 4;                % Message length
% 
% n1 = 15;
% k2 = 11;
% 
% encData = encode(x,n,k);
% encData(10) = ~encData(10);
% 
% 
% decData = decode(encData,n,k);

%Error1 = abs(Seq3 - DecodedData1);
%NumberOfErrors1 = sum(Error1)
%ErrorRate1 = sum(Error1) / length(Seq3)

%%the to encode bit stream
x =   [1;1;0;0;1;0;1;1;1;0;0;1;0;1;1;1;0;0;1;0;1];

%% Hamming encoder & decoder

EncodedData = DataEncoder(1,x);
DecodedData = DataDecoder(1,EncodedData);


%Noisy = Noise(Seq3);
%Noisy = Seq3;
% snr = 1:1:20;
% step = floor( length(Seq3)/length(snr))
% 
% for i = 1:10^6
%     if i/step <= 1
%         SnrInput = 1 ;
%     else
%         SnrInput = floor( i/ step    );
%     end
%     Noisy(i) = awgn(Seq3(i),snr(SnrInput));
% end

%Noisy1 = awgn(EncodedData1,10,'measured');

%     for j = 8:8:length(Output)
%         %disp(j)
%         %disp(j + 7)
%     %Output = Var((j):(j+7));
%     Output(j) = [];
%     end   
%     