function afterimg=peppernoise(image,k1,k2)
% image=imread('lena.bmp');
[width,height]=size(image);

afterimg=image;


% k1=0.1;%pepper����
% k2=0.3;%salt����
a1=rand(width,height)<k1;
a2=rand(width,height)<k2;
afterimg(a2&~a1)=1;
afterimg(a1&~a2)=255;
% figure;
% subplot(1,2,1);
% imshow(image);title('ԭͼ');
% subplot(1,2,2);
% imshow(afterimg);title('�ӽ���������');