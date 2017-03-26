% frequency domain filter 20 Aug

clear all;
close all;

I = imread('C:\Users\TANAY\Desktop\ippr\ippr lab\abcl.jpg');  % original image
[rows,cols] = size(I);

figure,imshow(I);

J = zeros(rows,cols);       % frequency domain of I

H1 = zeros(rows,cols);      % filter function Ideal LP
H2 = zeros(rows,cols);      % filter function Butter worth
H3 = zeros(rows,cols);      % filter function Gaussian


G1 = zeros(rows,cols);      % G = I * H1
G2 = zeros(rows,cols);      % G = I * H2
G3 = zeros(rows,cols);      % G = I * H3

G4 = zeros(rows,cols);      % G = I * H1
G5 = zeros(rows,cols);      % G = I * H2
G6 = zeros(rows,cols);      % G = I * H3

X1 = zeros(rows,cols);     % ideal low pass filter
X2 = zeros(rows,cols);     % Butter worth low pass filter
X3 = zeros(rows,cols);     % Gaussian low pass filter

X4 = zeros(rows,cols);     % ideal high pass filter
X5 = zeros(rows,cols);     % Butter worth high pass filter
X6 = zeros(rows,cols);     % Gaussian high pass filter

for i =1:rows
    for j= 1:cols
          J(i,j) =    I(i,j) * power(-1,i+j);   % shifting 
    end
end
figure;
imshow(J);

J = fft2(J);               % fourier transform

%figure;
%imshow(I);

rad = input('Enter the value of radius : ');

n = 2;                                         % generally order in butter worth for best results

for u= 1:rows
    for v=1:cols
        
        dist = sqrt((power((u-(rows/2)),2))+ (power((v-(cols/2)),2)));
        
        if dist <= rad
            H1(u,v) = 1;
        else 
            H1(u,v) =0;
        end
        
        H2(u,v) = 1/(1+power((dist/rad),2*n));
        
        temp = (dist*dist)/(2*rad*rad);
        H3(u,v) = exp(-temp);
    end
end

for u= 1:rows
    for v=1:cols
       
       G1(u,v) = H1(u,v)*J(u,v);
       G2(u,v) = H2(u,v)*J(u,v);
       G3(u,v) = H3(u,v)*J(u,v);
       
       G4(u,v) = (1-H1(u,v))*J(u,v);
       G5(u,v) = (1-H2(u,v))*J(u,v);
       G6(u,v) = (1-H3(u,v))*J(u,v);
 
    end
end
  
%figure;
%imshow(G);

G1 = ifft2(G1);             % inverse fft
G2 = ifft2(G2);             % inverse fft
G3 = ifft2(G3);             % inverse fft

G4 = ifft2(G4);             % inverse fft
G5 = ifft2(G5);             % inverse fft
G6 = ifft2(G6);             % inverse fft

for i =1:rows
    for j= 1:cols
          
          X1(i,j) =    G1(i,j) * power(-1,i+j);   % translating back
          X2(i,j) =    G2(i,j) * power(-1,i+j);   % translating back
          X3(i,j) =    G3(i,j) * power(-1,i+j);   % translating back
          
          X4(i,j) =    G4(i,j) * power(-1,i+j);   % translating back
          X5(i,j) =    G5(i,j) * power(-1,i+j);   % translating back
          X6(i,j) =    G6(i,j) * power(-1,i+j);   % translating back
    
    end
end
%imshow(uint8(real(X1)));   % displaying real part (quiet blurred with ringing effect)

figure;

subplot(3,3,1);            imshow(uint8(I));                      title('Original');
subplot(3,3,2);            imshow(uint8((X1)));               title('Ideal LP');         % displaying real part (quiet blurred with ringing effect)
subplot(3,3,3);            imshow(uint8((X2)));               title('Butter worth LP');
subplot(3,3,4);            imshow(uint8((X3)));               title('Gaussian LP');
subplot(3,3,5);            imshow(uint8((X4)));               title('Ideal HP');
subplot(3,3,6);            imshow(uint8((X5)));               title('Butter worth HP');
subplot(3,3,7);            imshow(uint8((X6)));               title('Gaussian HP');