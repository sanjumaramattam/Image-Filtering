clear all
close all

I=imread('peppers_gray.bmp');
subplot(131)
imshow(I)
title('Original Image(I)')

% Low pass filtering mask
  Lp1=1/4*[1 1;1 1];  %2 by 2 window
  Lp2=1/9*[1 1 1;1 1 1;1 1 1 ];  %3 by 3 window
  Lp4=1/25*ones(5,5) % 5 by 5 window
  
  I1=imfilter(I,Lp1)
  subplot(332)
  imshow(I1)
  title('Lowpass filtering by 2 x 2 window(I1)')
  
  %High Pass Filtering
  I1_h=I-I1
  subplot(333)
  imshow(I1_h)
  title('High pass filtering output(I-I1)')

  I2=imfilter(I,Lp2)
  subplot(335)
  imshow(I2)
  title('Lowpass filtering by 3 x 3 window(I2)')

  I2_h=I-I2
  subplot(336)
  imshow(I2_h)
  title('High pass filtering output(I-I2)')
  
  I4=imfilter(I,Lp4)
  subplot(338)
  imshow(I4)
  title('Lowpass filtering by 5 x 5 window(I4)')
  
  I4_h=I-I4
  subplot(339)
  imshow(I4_h)
  title('High pass filtering output(I-I4)')
  
   figure(2)
   % Band pass filtering
   subplot(131)
   imshow(I)
   title('Original Image(I)')
  
   subplot(132)
   I_12_bp=I1-I2
   imshow(I_12_bp)
   title('Bandpass filtering(I1-I2)')
    
   subplot(133)
   I_14_bp=I1-I4
   imshow(I_14_bp)
   title('Bandpass filtering(I1-I4)')
   