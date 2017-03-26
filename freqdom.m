a=imread('C:\Users\TANAY\Desktop\a.jpg');
i=rgb2gray(a);
[rows,cols]=size(i);
x=zeros(rows,cols);
d0=3;

o=fft2(i);

for i = 1 : rows
    for j= 1 : cols
        if ( i > rows/2 - sqrt((i-d0)*(i-d0)+(j-d0)*(j-d0)) )
            x(i,j)=o(i,j);
        else
            x(i,j)=0;
        end
    end
end
            
imshow(x);