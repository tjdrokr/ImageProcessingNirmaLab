im=imread('C:\Users\TANAY\Desktop\notch.tif');
%im=rgb2gray(im);

figure,imshow(im);

[rows,cols]=size(im);
for i=1:rows
    for j=1:cols
        im(i,j)=im(i,j)*((-1)^(i+j));
    end
end
im3=fft2(im);
figure,imshow(im3);

c=8;
in=c.*log(1.+im3);
figure,imshow(uint8(in));

for i=1:rows
    for j=1:cols
        new(i,j)=double(im3(i,j));
    end
end

x=real(in(rows/2,cols/2))+imag(in(rows/2,cols/2));
disp(x);
W=10;
n=2;            %order

for i=1:rows
    for j=1:cols
        if i>rows/2-20 && i<rows/2+20 && j>cols/2-20 && j<cols/2+20
            continue;
        end
        if in(i,j) > x
            for l= i-W/2 : i+W/2
                for m= j-W/2 : j+W/2
                    if l>0 && l<rows && m>0 && m<cols
                        new(l,m)=im3(l,m)*(1/(1+power(im3(l,m)*W/(im3(l,m)*im3(l,m)-x*x),2*n)));
                        %new(l,m)=0;
                    end
                end
            end
        end
    end
end

figure,imshow(uint8(new));
new=ifft2(new);
for i=1:rows
    for j=1:cols
        new(i,j)=new(i,j)*((-1)^(i+j));
    end
end

figure,imshow(uint8(new));