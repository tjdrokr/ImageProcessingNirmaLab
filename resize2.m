a=imread('C:\Users\TANAY\Pictures\Camera Roll\t2.jpg');
i=rgb2gray(a);
[rows,cols]=size(i);
img=zeros(rows*2,cols*2);
imgs=zeros(rows/2,cols/2);
for c = 1:cols
    for r = 1:rows
            img(2*r-1,2*c-1) = i(r,c);
            img(r*2-1,c*2) = i(r,c);
            img(r*2,c*2-1) = i(r,c);
            img(r*2,c*2) = i(r,c);
    end
end

figure,
imshow(uint8(img));
title('Double image');


for c = 1:cols
    for r = 1:rows
            if mod(r,2) == 0 && mod(c,2) ==0
                imgs(r/2,c/2) = i(r,c);
            end
    end
end

figure,
imshow(uint8(imgs));
title('Half image');
