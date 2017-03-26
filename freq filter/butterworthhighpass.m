%Butterworth High Pass Filter

clear all;
im=imread('C:\Users\TANAY\Desktop\a.jpg');
im=rgb2gray(im);

figure,imshow(im);

[rows,cols]=size(im);

[rows,cols]=size(im);
for i=1:rows
    for j=1:cols
        im(i,j)=im(i,j)*((-1)^(i+j));
    end
end

im3=fftshift(fft2(double(im)));
bin=zeros(rows,cols);
rad=50;
n=2;
for i=1:rows
    for j=1:cols
        bin(i,j) = 1/(1+((rad.^2)/(((i-(rows/2)).^2) + (j-(cols/2)).^2)))^.2*n;
    end
end

for i=1:rows
    for j=1:cols
        im3(i,j)=im3(i,j)*bin(i,j);
    end
end

im4=uint8(abs(ifft2(ifftshift(im3))));
figure,imshow(uint8(im3));
figure,imshow(uint8(im4));