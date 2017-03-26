% image restoration

clear all;
close all;

I = imread('C:\Users\TANAY\Desktop\ippr/ippr lab\distortion.tif');  % original image
[rows,cols] = size(I);

%imshow(I);

J = zeros(rows,cols);       % frequency domain of I
H = ones(rows,cols);        % filter
u = zeros(rows);            
v = zeros(cols);            
M = zeros(rows,cols);       % filtered output
L = zeros(rows,cols);       % inverse log  output
M1 = zeros(rows,cols);      % ifft output
M2 = zeros(rows,cols);      % final output

H = double(H);
M = double(M);

% for i =1:rows
%     for j= 1:cols
%           J(i,j) =    I(i,j) * power(-1,i+j);               % shifting 
%     end
% end
% 
% %figure;
% %imshow(J);
% 
% J = fft2(J);               % fourier transform

J=fftshift(fft2(I));

F = J;
% log transformation

J = double(J);

for i=1:rows
    for j=1:cols
       J(i,j)= 10 * log(1+J(i,j));      
    end
end

%figure;
%imshow(uint8(J));

centre_x = round(rows/2);
centre_y = round(cols/2);

temp = J(centre_x,centre_y);

n =2;                          %order
d0=10;
k=1;

for i=1:centre_x
    for j=1:centre_y
      
        if abs(temp - J(i,j)) <= 15
          
            u(k) = i;
            v(k) = j;
            k = k+1;  
                   
            u(k) = -i;
            v(k) = -j;
            k = k+1;  
            
            u(k) = -i;
            v(k) = j;
            k = k+1;  
            
            u(k) = i;
            v(k) = -j;
            k = k+1;  
            
        end
    end
end

limit = k-1;

d  = zeros(limit,rows,cols);
dm = zeros(limit,rows,cols);

for i=1:rows
    for j=1:cols
        for k=1:limit
            %if abs(temp - J(i,j)) <= 15
                d(k,i,j)=((i-centre_x-u(k))^2+(j-centre_y-v(k))^2)^(1/2);
                dm(k,i,j)=((i-centre_x+u(k))^2+(j-centre_y+v(k))^2)^(1/2);
            
            %end
           
        end
    end
end 

for i=1:rows
    for j=1:cols
        for k=1:4%limit
           %if abs(temp - J(i,j)) <= 15
            part1=1/(1+((d0/d(k,i,j))^(2*n)));
            part2=1/(1+((d0/dm(k,i,j))^(2*n)));
            H(i,j)=H(i,j)*part1*part2;
          % end
        end
    end
end    

%for i=1:rows
 %   for j=1:cols
  %     J(i,j)= exp(J(i,j)/10) - 1;       % inverse log transform
   % end
%end

for i=1:rows
    for j=1:cols
        M(i,j)= H(i,j)*F(i,j)*1.2;
    end
end

%for i=1:rows
 %   for j=1:cols
  %      M1(i,j)= M(i,j)*F(i,j);
   % end
%end

%figure;
%imshow(uint8(M));


M1 = ifft2(ifftshift(M));             % inverse fft

%figure;
%imshow(uint8(M1));
% % 
% for i =1:rows
%     for j= 1:cols
%           
%         M1(i,j) = I(i,j) - real(M1(i,j));
% %          M2(i,j) =   M1(i,j) * power(-1,i+j);   % translating back
%           
%     end
% end



figure;     imshow(uint8(I));                      title('Original');
figure;     imshow(uint8(J));                      title('transform image');
figure;     imshow(uint8(real(M)));                title('filtered image');        
figure;     imshow(uint8(M1));                    title('Output image');
