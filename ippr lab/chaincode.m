im1=imread('a.jpg');
im=rgb2gray(im1);
imshow(im);

[rows,cols]=size(im);

flag=0;
for i=1:rows
    for j=1:cols
        if im(i,j)>210
            im(i,j)=255;
            if flag==0
                x=i;y=j;flag=1;
            end
        else
            im(i,j)=0;
        end
    end
end
figure,imshow(uint8(im));

disp('Starting pixel');
disp(x);
disp(y);

cx=zeros();
cy=zeros();
cc=zeros();
i=1;
cx(1)=x;
cy(1)=y;
i=i+1;
cnt=1;
while cnt<2000
    cnt = cnt+1;
    if  im(cx(i-1),cy(i-1)+1) > 210 && cc(i-1)~=4
        cc(i)=0;
        cx(i)=cx(i-1);
        cy(i)=cy(i-1)+1;
    elseif (im(cx(i-1)+1,cy(i-1)+1))>210 && cc(i-1)~=3
        cc(i)=7;
        cx(i)=cx(i-1)+1;
        cy(i)=cy(i-1)+1;
    elseif (im(cx(i-1)+1,cy(i-1)))>210 && cc(i-1)~=2
        cc(i)=6;
        cx(i)=cx(i-1)+1;
        cy(i)=cy(i-1);
    elseif (im(cx(i-1)+1,cy(i-1)-1))>210 && cc(i-1)~=1
        cc(i)=5;
        cx(i)=cx(i-1)+1;
        cy(i)=cy(i-1)-1;
    elseif (im(cx(i-1),cy(i-1)-1))>210 && cc(i-1)~=0
        cc(i)=4;
        cx(i)=cx(i-1);
        cy(i)=cy(i-1)-1;
    elseif (im(cx(i-1)-1,cy(i-1)-1))>210 && cc(i-1)~=7
        cc(i)=3;
        cx(i)=cx(i-1)-1;
        cy(i)=cy(i-1)-1;
    elseif (im(cx(i-1)-1,cy(i-1)))>210 && cc(i-1)~=6
        cc(i)=2;
        cx(i)=cx(i-1)-1;
        cy(i)=cy(i-1);
    elseif (im(cx(i-1)-1,cy(i-1)+1))>210 && cc(i-1)~=5
        cc(i)=1;
        cx(i)=cx(i-1)-1;
        cy(i)=cy(i-1)+1;
    end
    if cx(i)==x && cy(j)==y
        disp('haha\n');
        break;
    end
    %disp(cc(i));
fprintf('%d ', cc(i));
    i=i+1;
end
fprintf('\n');

