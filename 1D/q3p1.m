% extract pixel value (matrix) of image
input = double(imread('cameraman.tif'))

% quantisation weight
q_mat = [ 16 11 10 16 24 40 51 61;
          12 12 14 19 26 58 60 55;
          14 13 16 24 40 57 69 56;
          14 17 22 29 51 87 80 62;
          18 22 37 56 68 109 103 77;
          24 35 55 64 81 104 113 92;
          49 64 78 87 103 121 120 101;
          72 92 95 98 112 100 103 99];

I = imread('cameraman.tif');
I = im2double(I);
T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T' * q_mat;
B = blockproc(I,[8 8],dct);
imshow(B)
