clear all
close all

I=imread('peppers_gray.bmp');
subplot(231)
imshow(I)
title('Original Image')

% Low pass filtering mask
  Lp1=1/4*[1 1;1 1];  %2 by 2 window
  Lp2=1/9*[1 1 1;1 1 1;1 1 1 ];  %3 by 3 window
  Lp3=[0 1/8 0; 1/8 1/4 1/8;0 1/8 0];  % 5 point weighted average filter
  Lp4=1/25*ones(5,5) % 5 by 5 window
  Lp5=1/49*ones(7,7) % 5 by 5 window
  
  I1=imfilter(I,Lp1)
  subplot(232)
  imshow(I1)
  title('Lowpass filtering by 2 x 2 window filter')
  
  I2=imfilter(I,Lp2)
  subplot(233)
  imshow(I2)
  title('Lowpass filtering by 3 x 3 window filter')
  
  I3=imfilter(I,Lp3)
  subplot(234)
  imshow(I3)
  title('Lowpass filtering 5-point weighted average filter')

  
  I4=imfilter(I,Lp4)
  subplot(235)
  imshow(I4)
  title('Lowpass filtering 5 x 5 window filter')

  I5=imfilter(I,Lp5)
  subplot(236)
  imshow(I5)
  title('Lowpass filtering 7 x 7 window filter')
  
 