I=imread('lena.bmp');
figure,
subplot(2,3,1),imshow(I);title('origin');
I12=gaussnoise(I,0,0.1);
subplot(2,3,2),imshow(I12);title('avg=0,std=0.1');
I13=gaussnoise(I,0,0.5);
subplot(2,3,3),imshow(I13);title('avg=0,std=0.5');
I21=gaussnoise(I,0.5,0);
subplot(2,3,4),imshow(I21);title('avg=0.5,std=0');
I22=gaussnoise(I,0.5,0.1);
subplot(2,3,5),imshow(I22);title('avg=0.5,std=0.1');
I23=gaussnoise(I,0.5,0.5);
subplot(2,3,6),imshow(I23);title('avg=0.5,std=0.5');

%%
figure,
subplot(221),imshow(I12);title('noise');
AfterAvg=MyAvg(2,1,I12);
subplot(222),imshow(AfterAvg);title('Arithmetic');
AfterGeo=MyGeoAvg(2,1,I12);
subplot(223),imshow(AfterGeo);title('Geometric');
AfterMed=MyMed(2,1,I12);
subplot(224),imshow(AfterMed);title('Median');