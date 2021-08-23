clear all
close all

I=imread('peppers_gray.bmp');
dim_1=size(I);
I=double(I);

%Zero Padding the image
Ip=[I  zeros(dim_1); zeros(dim_1) zeros(dim_1)];
dim_2=size(Ip)

figure(1)
subplot(121)
imshow(uint8(I))
title('Original Image')
subplot(122)
imshow(uint8(Ip))
title('Image after Zero Padding')

%Creating meshgrid
x = 1:dim_2(1);
y = 1:dim_2(2);
[X,Y]=meshgrid(x,y);
M=(-1).^(X+Y);

%2-D Gaussian filter
n=2; %order of filter
P=dim_2(1);
Q=dim_2(2);
D0=100; %cutoff- frequency
D=((X-P/2).^2+(Y-Q/2).^2).^.5;

%Gaussian Lowpass
H_l=exp((-D.^2)/(2*D0^2));
%Gaussian Highpass
H_h=1.-H_l;

%2-D filter plot
figure(2)
subplot(221)
surfc(X,Y,H_l)
shading interp    
title('Gaussian Lowpass Filter')

subplot(222)
surfc(X,Y,H_h)
shading interp
title('Gaussian Highpass Filter')

%Lowpass filter mask
subplot(223)
imshow(H_l)
title('Gaussian Lowpass Filter')

%Highpass filter mask
subplot(224)
imshow(H_h)
title('Gaussian Highpass Filter')

% Frequency Domain Filtering using fft
 I_f=fft2(M.*Ip);
 I_l=I_f.*H_l;
 I_h=I_f.*H_h;
 I1=real(ifft2(I_l)).*M;
 I2=real(ifft2(I_h)).*M;
 
 figure(3)
 subplot(131)
 imshow(uint16(I_f))
 title('Fourier Transform of Image')
 subplot(232)
 imshow(uint16(I_l))
 title('Image after Low Pass Filtering(Frequency Domain)')
 subplot(233)
 imshow(uint16(I_h))
 title('Image after High Pass Filtering(Frequency Domain)')
 
 subplot(235)
 imshow(uint8(I1))
 title('Image after Low Pass Filtering')
 subplot(236)
 imshow(uint8(I2))
 title('Image after High Pass Filtering')
 
 figure(4)
 subplot(121)
 imshow(uint8(I1(1:dim_1(1),1:dim_1(2))))
 title('Image after Low Pass Filtering')
 subplot(122)
 imshow(uint8(I2(1:dim_1(1),1:dim_1(2))))
 title('Image after High Pass Filtering')
 