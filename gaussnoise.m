function afterimg=gaussnoise(image,av,std)
% image=imread('lena.bmp');
[width,height]=size(image);


% av=0;
% std=0.1;
u1=rand(width,height);
u2=rand(width,height);
x=std*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
afterimg=double(image)/255+x;
afterimg=uint8(255*afterimg);

% figure;
% subplot(1,2,1);
% imshow(image);
% title('原图');
% subplot(1,2,2);
% imshow(afterimg);
% title('加高斯噪声后');