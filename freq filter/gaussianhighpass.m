im=imread('C:\Users\TANAY\Desktop\a.jpg');
im=rgb2gray(im);
[rows,cols]=size(im);
figure,imshow(uint8(im));

for i=1:rows
    for j=1:cols
        im(i,j)=im(i,j)*((-1)^(i+j));
    end
end

im3=fft2(im);
rad=10;
for i=1:rows
    for j=1:cols
        bin(i,j) = 1 - (exp(1)^(-1*((((i-(rows/2))^2) + (j-(cols/2))^2)/(2*rad^2))));
    end
end

for i=1:rows
    for j=1:cols
        im3(i,j)=im3(i,j)*bin(i,j);
    end
end
im4=ifft2(im3);

for i=1:rows
    for j=1:cols
        im4(i,j)=im4(i,j)*((-1)^(i+j));
    end
end
figure,imshow(uint8(im3));
figure,imshow(uint8(im4));