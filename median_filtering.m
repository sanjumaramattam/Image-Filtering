clear all
close all

I=imread('peppers_gray.bmp');
dim=size(I)
subplot(131)
imshow(I)
title('Original Image')

%Adding salt & pepper noise to image
I_noisy=imnoise(I,'salt & pepper')
subplot(132)
imshow(I_noisy)
title('Noisy Image')

% Image Denoising using Median Filtering
I1=medfilt2(I_noisy)
subplot(133)
imshow(I1)
title('Image after Median Filtering')