clc
clear all
im=imread('a.jpg');
im=im2uint8(im);
figure,imshow(uint8(im));
title('Input image');

[rows,cols]=size(im);
imx=zeros(rows,cols);

disp(mean2(im));
c=mean2(im)/90;

for i=1:rows
    for j=1:cols
        if(im(i,j)>30)
            in(i,j)=double(im(i,j)).^c; 
        else
            in(i,j)=im(i,j);
        end
    end
end

figure,imshow(in);
title('Region with higher intensity selected');

for i=1:rows
    for j=1:cols
        if (in(i,j)>200)
            imx(i,j)=im(i,j);
        else
            imx(i,j)=uint8(in(i,j));
        end
        
    end
end

filt = imfilter(imx, ones(2)/4);
figure,imshow(uint8(filt)),title('Output image');
