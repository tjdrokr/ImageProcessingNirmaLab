%Marr Hildreth
clear all
im=imread('lena.gif');
im=im2double(im);

mat= [0 0 1 0 0 0 1 2 1 0 1 2 -16 2 1 0 1 2 1 0 0 0 1 0 0];
%Filter application
im1=conv2(im,double(mat));
[rows,cols]=size(im1);
imo=zeros([rows,cols]);
imfinal=zeros([rows,cols]);

%Zero crossings
for i=2:rows-1
    for j=2:cols-1
        if ( im1(i,j) > 0 )
            if ( im1(i-1,j+1)>=0 && im1(i+1,j-1)<0) || (im1(i-1,j+1)<0 && im1(i+1,j-1)>=0 )
                  imo(i,j)=im1(i,j+1);
            end 
            if ( im1(i+1,j+1)>=0 && im1(i-1,j-1)<0) || (im1(i+1,j+1)<0 && im1(i-1,j-1)>=0 )
                  imo(i,j)= im1(i,j+1);
            end
            if ( im1(i,j+1)>=0 && im1(i,j-1)<0) || (im1(i,j+1)<0 && im1(i,j-1)>=0 )
                  imo(i,j)= im1(i,j+1);      
            end
            if ( im1(i+1,j)>=0 && im1(i-1,j)<0) || (im1(i+1,j)<0 && im1(i-1,j)>=0 )
                  imo(i,j)= im1(i,j+1);
            end
        end
    end
end

imo=im2uint8(imo);
%Thresholding
for i=1:rows
    for j=1:cols
        if imo(i,j)>150
            imfinal(i,j)=imo(i,j);
        end
    end
end


figure,imshow(im);title('Original Image');
figure,imshow(im1);title('Filter applied Image');
figure,imshow(imo);title('Output image');
figure,imshow(imfinal);title('Output image with threshold');