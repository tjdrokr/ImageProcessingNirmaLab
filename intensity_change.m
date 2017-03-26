a=imread('C:\Users\TANAY\Pictures\Camera Roll\t2.jpg');
i=rgb2gray(a);
[rows,cols]=size(i);
img=zeros(rows/2,cols/2);

for c = 1:cols
    for r = 1:rows
            if mod(r,2) == 0 && mod(c,2) ==0
                img(r/2,c/2) = i(r,c);
            end
    end
end

imshow(uint8(img));
[r,c]=size(img);
disp(r);
disp(c);
