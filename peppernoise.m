function afterimg=peppernoise(image,k1,k2)
% image=imread('lena.bmp');
[width,height]=size(image);

afterimg=image;


% k1=0.1;%pepper概率
% k2=0.3;%salt概率
a1=rand(width,height)<k1;
a2=rand(width,height)<k2;
afterimg(a2&~a1)=1;
afterimg(a1&~a2)=255;
% figure;
% subplot(1,2,1);
% imshow(image);title('原图');
% subplot(1,2,2);
% imshow(afterimg);title('加椒盐噪声后');