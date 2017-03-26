a=imread('C:\Users\TANAY\Desktop\ippr\a.jpg');
i=rgb2gray(a);

[rows,cols]=size(i);
b=zeros(256);
o=zeros(256);
p=zeros(256);
s=zeros(256);
oi=zeros(rows,cols);

for c = 1:cols
    for r = 1:rows
            b(i(r,c)+1)=b(i(r,c)+1)+1;
    end
end

no_of_pixels=rows*cols;
sum=0;
for n = 1:256
           p(n)=double(b(n))/no_of_pixels;
           sum=sum+p(n);
           disp(p(n));
           s(n)=round(255*sum);
end


for n = 1:256
          o(s(n)+1)=o(s(n)+1)+p(n);
end

for c = 1:cols
    for r = 1:rows
          oi(r,c)=s(i(r,c)+1);
    end
end

J=histeq(i,256);

n=1:256;   
subplot(2,2,1),stem(n,p,'.');title('PDF input'),axis tight;
subplot(2,2,2),stem(n,s,'.');title('CDF'),axis tight;
subplot(2,2,3),stem(n,o,'.');title('PDF output'),axis tight;
subplot(2,2,4),imhist(J);title('inbuilt histogram');

figure,imshow(J);title('inbuilt histogram image');
figure,imshow(uint8(oi));title('processed image');