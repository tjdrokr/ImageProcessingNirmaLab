a=imread('C:\Users\TANAY\Desktop\ippr\a.jpg');
i=rgb2gray(a);
[rows,cols]=size(i);
figure,imshow(uint8(i));
title('original image');

img=(255.-i);
figure,imshow(uint8(img));
title('inverted image');

out=0;
for a = 1 : rows
       for b = 1 : cols
           out = out + double(i(a,b));
       end
end
avg=out/(rows*cols);
disp(avg);
x=avg/128;

c1=1;
gamma=1/x;
i=double(i);
img2=c1.*power(i,gamma);
figure,imshow(uint8(img2));
title('power law transform');

c2=20;
img3=c2.*log(1+i);
figure,imshow(uint8(img3));
title('log transform');