a=imread('C:\Users\TANAY\Pictures\Camera Roll\t2.jpg');
i=rgb2gray(a);
levels=input('Enter the number of intensity levels:');
result=256/levels;

[rows,cols]=size(i);
img=double(i/result);
img=(img)*result+256/(8-levels);

imshow(uint8(img));