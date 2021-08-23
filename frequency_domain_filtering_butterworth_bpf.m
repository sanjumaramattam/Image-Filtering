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

%2-D butterworth filter
n=2; %order of filter
P=dim_2(1);
Q=dim_2(2);
D0=100;%Lower cutoff- frequency
D1=200;%upper cutoff- frequency
D=((X-P/2).^2+(Y-Q/2).^2).^.5;

%Butterworth Lowpass_1
H_L1=1./(1+(D/D0).^(2*n));
%Butterworth Lowpass_2
H_L2=1./(1+(D/D1).^(2*n));

%Butterworth Bandpass
H_bp=H_L2-H_L1;
H_bs=1-(H_L2-H_L1);

%2-D filter plot
figure(2)
subplot(221)
surfc(X,Y,H_bp)
shading interp    
title('Butterworth Bandpass Filter')

subplot(222)
surfc(X,Y,H_bs)
shading interp
title('Butterworth Bandstop Filter')

%Lowpass filter mask
subplot(223)
imshow(H_bp)
title('Butterworth Bandpass Filter')

%Highpass filter mask
subplot(224)
imshow(H_bs)
title('Butterworth Bandstop Filter')

% Frequency Domain Filtering using fft
 I_f=fft2(M.*Ip);
 I_bp=I_f.*H_bp;
 I_bs=I_f.*H_bs;
 I1=real(ifft2(I_bp)).*M;
 I2=real(ifft2(I_bs)).*M;
 
 figure(3)
 subplot(131)
 imshow(uint16(I_f))
 title('Fourier Transform of Image')
 subplot(232)
 imshow(uint16(I_bp))
 title('Image after Band Pass Filtering(Frequency Domain)')
 subplot(233)
 imshow(uint16(I_bs))
 title('Image after Band Stop Filtering(Frequency Domain)')
 
 subplot(235)
 imshow(uint8(I1))
 title('Image after Band Pass Filtering')
 subplot(236)
 imshow(uint8(I2))
 title('Image after Band Stop Filtering')
 
 figure(4)
 subplot(121)
 imshow(uint8(I1(1:dim_1(1),1:dim_1(2))))
 title('Image after  Band Pass Filtering')
 subplot(122)
 imshow(uint8(I2(1:dim_1(1),1:dim_1(2))))
 title('Image after  Band Stop Filtering')
 