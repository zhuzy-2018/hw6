function AftImg=MyAnti(N,m,q,image)
N_row = 2*N+1;%模板大小
%隔m个像素遍历
[sx,sy]=size(image);

AftImg=uint8(zeros(sx,sy));
MidImg=double(padarray(image,[N_row N_row],'replicate'));
MidImg2=MidImg;

for i=N+1:m:N_row+sx+N+1
    for j=N+1:m:N_row+sx+N+1
        temp=MidImg(i-N:i+N,j-N:j+N);
        temp2=temp.^(q+1);
        temp3=temp.^(q);
        MidImg2(i,j)=mean(temp2(:))/mean(temp3(:));
    end
end
MidImg2=uint8(MidImg2);
for i=1:sx
    for j=1:sy
        AftImg(i,j)=MidImg2(i+N_row,j+N_row);
    end
end
% WTF=sum(sum(AftImg-image,2))
% figure,imshow(AftImg);