function Iafter=blur(I,a,b,T)
% a=0.1;%y轴速度
% b=0.1;%x轴速度
% T=1;%曝光时间
% I=imread('lena.bmp');
I2=double(I);

% Lx=floor(a*size(I,1));
% Ly=floor(b*size(I,2));
% h1=zeros(size(I,1),size(I,2));
% for x=1:Lx
%     h1(x,1)=1/Lx;
% end
% h2=zeros(size(I,1),size(I,2));
% for y=1:Ly
%     h2(1,y)=1/Ly;
% end
% H1=fftshift(fft2(h1));
% H2=fftshift(fft2(h2));
% H=H1.*H2;

% M=2*size(I,1);
% N=2*size(I,2);
% u=-M/2:(M/2-1);
% v=-N/2:(N/2-1);
% [U,V]=meshgrid(u,v);
% H=T./(pi.*(U.*a+V.*b)).*sin(pi.*(U.*a+V.*b)).*(-1).^(U.*a+V.*b);

H=complex(zeros(size(I,1),size(I,2)));
for u=1:size(H,1)
    for v=1:size(H,2)
        H(u,v)=T/(pi*(u*a+v*b))*sin(pi*(u*a+v*b))*(-1)^(u*a+v*b);
    end
end

Ifreq=fftshift(fft2(I2,size(H,1),size(H,2)));
G=Ifreq.*H;
Itemp=ifft2(ifftshift(G));
Itemp=Itemp(1:size(I,1),1:size(I,2));
Iafter=uint8(real(255*Itemp/max(Itemp(:))));
imshow(Iafter);
