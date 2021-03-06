I=im2double(imread('lena.bmp'));
[xs,ys,~] = size(I);
LEN = 21;
THETA = 45;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');
figure,
subplot(121),imshow(blurred);
title('Blurred Image');
%%
wnr1 = deconvwnr(blurred, PSF, 0);
subplot(122),imshow(wnr1);
title('Restored Image');

%%
noise_mean = 0;
noise_var = 0.01;
blurred_noisy = imnoise(blurred, 'gaussian', ...
                        noise_mean, noise_var);
figure,
subplot(121),imshow(blurred_noisy);
title('Simulate Blur and Noise');

wnr2 = deconvwnr(blurred_noisy, PSF, 0);
subplot(122),imshow(wnr2)
title('Restoration of Blurred, Noisy Image - NSR = 0')
%%
signal_var = var(I(:));
wnr3 = deconvwnr(blurred_noisy, PSF, noise_var / signal_var);
subplot(122),imshow(wnr3);
title('Restoration of Blurred');
%%
Pf = psf2otf(PSF,[xs,ys]);%退化函数的FFT
p = [0 -1 0;-1 4 -1;0 -1 0];%拉普拉斯模板
P = psf2otf(p,[xs,ys]);
figure,
for i=1:3
gama=[0.001,0.01,0.1]
% gama = 0.1;
If = fft2(blurred_noisy);
numerator = conj(Pf);%conj函数，用于求一个复数的复共轭
denominator = Pf.^2 + gama(i)*(P.^2);
deblurred2 = ifft2( numerator.*If./ denominator );%约束最小二乘方滤波在频率域中的表达式

subplot(1,3,i),imshow(deblurred2)
title({['约束最小二乘方滤波后'];['gama=',num2str(gama(i))]});
end
