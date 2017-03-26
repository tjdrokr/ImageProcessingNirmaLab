%Butter worth low-pass Filter

im=imread('C:\Users\TANAY\Desktop\ippr lab\abcl.jpg');
%im=rgb2gray(im);

figure,imshow(im);

%Shifting Function
[rows,cols]=size(im);
for i=1:rows
    for j=1:cols
        im(i,j)=im(i,j)*((-1)^(i+j));
    end
end

%Fourier Transform
im3=fft2(im);


rad=50;
n=2;
for i=1:rows
    for j=1:cols
        bin(i,j) = 1/((1+((((i-(rows/2))^2) + (j-(cols/2))^2)/(rad^2)))^2*n);
    end
end

for i=1:rows
    for j=1:cols
        im3(i,j)=im3(i,j)*bin(i,j);
    end
end

%Inverse Fourier Transform
im4=ifft2(im3);


%Inverse Shift
for i=1:rows
    for j=1:cols
        im4(i,j)=im4(i,j)*((-1)^(i+j));
    end
end

figure,imshow(im3);
figure,imshow(uint8(im4));