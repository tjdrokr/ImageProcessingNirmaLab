clear all;
clc;
disp('USE THE VALUE OF D0 20 FOR BEST RESULT');
im=imread('notch.tif');

figure,imshow(im),title('Original image');

im_original=fftshift(fft2(im));
im=fftshift(fft2(im));


[rows,cols]=size(im);
c=0.05;
n=2;

for i=1:rows
    for j=1:cols
        im(i,j)=c*log(1+im(i,j));
    end
end 
figure,imshow(real(im)),title('Original tranform image');
u(1)=140;
v(1)=103;
u(2)=-78;
v(2)=85;
u(3)=0;
v(3)=25;
u(4)=0;
v(4)=30;
cut_off=input('Enter the value for D0k');

centre_x=round(rows/2);
centre_y=round(cols/2);

for i=1:rows
    for j=1:cols
        for k=1:2
            d(k,i,j)=((i-centre_x-u(k))^2+(j-centre_y-v(k))^2)^(1/2);
            dm(k,i,j)=((i-centre_x+u(k))^2+(j-centre_y+v(k))^2)^(1/2);
           
        end
    end
end 

for i=1:rows
    for j=1:cols
        h(i,j)=1;
    end
end


for i=1:rows
    for j=1:cols
        for k=1:2
            part1=1/(1+((cut_off/d(k,i,j))^(2*n)));
            part2=1/(1+((cut_off/dm(k,i,j))^(2*n)));
            h(i,j)=h(i,j)*part1*part2;
        end
    end
end    


for i=1:rows
    for j=1:cols
        outp_original(i,j)=h(i,j)*im_original(i,j);
        outp(i,j)=h(i,j)*im(i,j);
    end
end

figure,imshow(real(outp)),title('Filtered transform image');

outp1=(ifftshift(ifft2(outp_original)));




figure,imshow(uint8(outp1)),title('Final image');