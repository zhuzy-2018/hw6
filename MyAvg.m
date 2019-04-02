function AftImg=MyAvg(N,m,image)
N_row = 2*N+1;%模板大小
%隔m个像素遍历
[sx,sy]=size(image);

AftImg=uint8(zeros(sx,sy));
MidImg=padarray(image,[N_row N_row],'replicate');
MidImg2=MidImg;

for i=N+1:m:N_row+sx+N+1
    for j=N+1:m:N_row+sx+N+1
        temp=MidImg(i-N:i+N,j-N:j+N);
        MidImg2(i,j)=mean(temp(:));
    end
end

for i=1:sx
    for j=1:sy
        AftImg(i,j)=MidImg2(i+N_row,j+N_row);
    end
end
% WTF=sum(sum(AftImg-image,2))
% figure,imshow(AftImg);