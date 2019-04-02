I=imread('lena.bmp');
figure,
subplot(2,2,1),imshow(I);title('origin');
P12=peppernoise(I,0.05,0);
subplot(2,2,2),imshow(P12);title('pepper=0 salt=0.05');
P21=peppernoise(I,0,0.05);
subplot(2,2,3),imshow(P21);title('pepper=0.05 salt=0');
P22=peppernoise(I,0.05,0.05);
subplot(2,2,4),imshow(P22);title('pepper=0.05 salt=0.05');

%%
foruse=P22;
figure,
subplot(221),imshow(foruse);title('noise');
AfterAvg=MyAvg(2,1,foruse);
subplot(222),imshow(AfterAvg);title('Arithmetic');
AfterGeo=MyGeoAvg(2,1,foruse);
subplot(223),imshow(AfterGeo);title('Geometric');
AfterMed=MyMed(2,1,foruse);
subplot(224),imshow(AfterMed);title('Median');

%%
foruse=P12;
figure,
subplot(221),imshow(foruse);title('salt=0.05');
A1=MyAnti(2,1,1,foruse);
subplot(222),imshow(A1);title('Q=1');
A_1=MyAnti(2,1,-1,foruse);
subplot(223),imshow(A_1);title('Q=-1');
A0=MyAnti(2,1,0,foruse);
subplot(224),imshow(A0);title('Q=0');
