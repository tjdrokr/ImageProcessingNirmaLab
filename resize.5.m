a=imread('C:\Users\TANAY\Pictures\Camera Roll\t2.jpg');
[rows, cols, dim] = size(a);
img2 = im2double(a);


for c = 1:cols
    for r = 1:rows
            if mod(r,2) == 0 && mod(c,2) ==0
                img(r/2,c/2,:) = img2(r,c,:);
            end
    end
end

final = im2uint8(img);
imshow(final,[]);
