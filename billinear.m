a=imread('C:\Users\TANAY\Pictures\Camera Roll\t2.jpg');
i=rgb2gray(a);
coln=input('Enter no of cols for new image:');
rown=input('Enter no of rows for new image:');
[rows,cols]=size(i);

rowrat=rown/rows;
colrat=coln/cols;

disp(colrat);
disp(rowrat);

img=zeros(rown,coln);

for c = 1:coln
    for r = 1:rown
        rf=(r-1)/rowrat;
        cf=(c-1)/colrat;
        delr=rf-floor(rf);
        delc=cf-floor(cf);
        if(rf<=1)
            rf=1;
        end
        if(cf <=1)
            cf=1;
        end
        if(cf>cols-1)
            cf=cols-1;
        end
        if(rf>rows-1)
            rf=rows-1;
        end
        img(r,c) = i(floor(rf),floor(cf))*(1-delr)*(1-delc) + i(ceil(rf),floor(cf))*(delr)*(1-delc)  + i(floor(rf),ceil(cf))*(1-delr)*(delc)  + i(ceil(rf),ceil(cf))*(delr)*(delc);
    end
end
figure,imshow(i);
imwrite(uint8(img),'abc.jpg');
figure,imshow(uint8(img));
title('bilinear through code');

imnew=imresize(i,[rown coln],'bilinear');
figure,imshow(uint8(imnew));
title('bilinear through function');