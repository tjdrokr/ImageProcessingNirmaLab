%   Ideal Low Pass Filter

im=imread('C:\Users\TANAY\Desktop\a.jpg');
im=rgb2gray(im);

figure,imshow(im);


% Perform Image Shift
[rows,cols]=size(im);
for i=1:rows
    for j=1:cols
        im(i,j)=im(i,j)*((-1)^(i+j));
    end
end

% Fourier Transform
im3=fft2(im);

% Ideal Filter Formula
rad=50;
for i=1:rows
    for j=1:cols
        if ((((i-(rows/2)).^2) + (j-(cols/2)).^2)) < rad.^2
            bin(i,j)=1;
        else 
            bin(i,j)=0;
        end
    end
end

%   Applying Ideal Filter
for i=1:rows
    for j=1:cols
        im3(i,j)=im3(i,j)*bin(i,j);
    end
end

%   Inverse Fourier Transform
im4=ifft2(im3);



%   Perform Inverse Shift
for i=1:rows
    for j=1:cols
        im4(i,j)=im4(i,j)*((-1)^(i+j));
    end
end

figure,imshow(im3);
figure,imshow(uint8(im4));
