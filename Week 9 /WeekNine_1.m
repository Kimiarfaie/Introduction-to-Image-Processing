clc
clear all
close all
I = imread("Grayscale Image 256x256.jpg");
I = I - 128;
% size of the block
Blocksize = 8;

% Size of 3D matrix that I want to store the 8x8 blocks in
im_tensor = zeros(Blocksize, Blocksize, numel(I)/(Blocksize^2));

% Loop through the Image and extract 8x8 blocks
count = 1;
for i = 1:Blocksize:size(I, 1)
    for j = 1:Blocksize:size(I, 2)

        % select 8x8 block
        Block = I(i:i+Blocksize-1, j:j+Blocksize-1);
        
        % Store the block in a 3D matrix
        im_tensor(:,:,count) = Block;
        
        % increase the counter
        count = count + 1;
    end
end

% Computing DCT of each block
num_blocks = numel(I)/(Blocksize^2); %number of blocks
y = zeros(Blocksize, Blocksize, numel(I)/(Blocksize^2));
for k = 1:num_blocks
    y(:,:,k) = dct2(im_tensor(:,:,k)); %y is the DCT
end

% Quantization
Q = [16	11	10	16	24	40	51	61;
12	12	14	19	26	58	60	55;
14	13	16	24	40	57	69	56;
14	17	22	29	51	87	80	62;
18	22	37	56	68	109	103	77;
24	35	55	64	81	104	113	92;
49	64	78	87	103	121	120	101;
72	92	95	98	112	100	103	99];

y_Q = zeros(Blocksize, Blocksize, numel(I)/(Blocksize^2));

for k = 1:num_blocks
    y_Q(:,:,k) = round(y(:,:,k)./Q); %y_Q is the quantized y
end

% zigzag scanning

z_y = zeros(Blocksize*Blocksize, numel(I)/(Blocksize^2));

for k = 1:num_blocks
    z_y(:,k) = zigzag(y_Q(:,:,k)); % each columns represents one block
end

% CODING for AC components

%going through columns of z_y, each column is one 8x8 block
for j=1:1024
    if j==1 %going through each block
        AC_Components = []; 
        temp = DifferentialCoding(z_y(:,j));
        AC_Components = [AC_Components; temp];
    else
        AC_Components = [AC_Components; [0 0 0]]; 
        temp = DifferentialCoding(z_y(:,j));
        AC_Components = [AC_Components; temp];
    end
end

% for printing and finding the block
for j=1:1024
    if j==1 %going through each block
        AC_ComponentsP = [1 0 0]; % for marking the blocks
        tempp = DifferentialCoding(z_y(:,j));
        AC_ComponentsP = [AC_ComponentsP; tempp];
    else
        AC_ComponentsP = [AC_ComponentsP; [j 0 0]]; %between each block there is a [j,0,0] for marking
        tempp = DifferentialCoding(z_y(:,j));
        AC_ComponentsP = [AC_ComponentsP; tempp];
    end
end

% Calculating DC components
for i=1:1024 %going though each block
DC_Coeffs(i) = y_Q(1,1,i);
end
%we have 1024 blocks, so it is a 32x32 blocks of 8x8
DC_Coeffs = reshape(DC_Coeffs,32,32);
DC_Coeffs = DC_Coeffs';

% Calculating DPCM
for j=1:32
if j==1;
    DCPM(:,j) = DC_Coeffs(:,j);
else
    DCPM(:,j) = (DC_Coeffs(:,j)-DC_Coeffs(:,j-1)); %subtracting neighboring DC coeffs
end
end
%Results for a specific block

n = 263; %number of block

%original 8x8 block

OriginalBlock = im_tensor(1:8,1:8,n) + 128;
f1=figure;
imshow(OriginalBlock,[]);

%8x8 block - 128
DecreasedBlock = im_tensor(1:8,1:8,n);
figure;
imshow(DecreasedBlock,[]);


%DCT value of the block

DCTBlock = y(1:8,1:8,n);
figure;
imshow(DCTBlock,[]);

% Quantization of the block

QBlock = y_Q(1:8,1:8,n);
figure;
imshow(QBlock,[]);

% AC  Component of the Block

%we look for components with third value being 0, and first being the block number get index
%find the index of it and for the next one too, because the block is
%between them
index1 = find(AC_ComponentsP(:, 1) == n & AC_ComponentsP(:, 3) == 0, 1);
index2 = find(AC_ComponentsP(:, 1) == n+1 & AC_ComponentsP(:, 3) == 0, 1);
ACBlock = AC_ComponentsP(index1+1:index2-1,:); %inside the two index, so we plus and minus 1
% print the coding
for i = 1:length(ACBlock)
    fprintf('[(%d, %d), %d]\n', ACBlock(i, 1), ACBlock(i, 2), ACBlock(i, 3),[0 0 0]);
end

