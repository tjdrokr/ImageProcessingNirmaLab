clear all;
close all;
I=imread('C:\Users\TANAY\Desktop\ippr\ippr lab\dirty.jpg');
%I1=rgb2gray(I1);
%I=imnoise(I1,'salt & pepper',0.15);

[rows,cols]=size(I);
P=zeros(rows,cols);

s_max=7;
s=3;
l=floor(s/2);

for i=1:rows
    for j=1:cols
        if( i<=l || i>=rows-l || j<=l || j>=cols-l )
           P(i,j)=I(i,j);
           continue;
        end
       
       k=1;
       for x=i-l:i+l
           for y=j-l:j+l
               a(k)=I(x,y);
               k=k+1;               
           end      
       end
      
        a=sort(a);
        z_mid=a(((s*s)+1)/2);
        z_min=a(1);
        z_max=a(s*s);
        
        a1=z_mid-z_min;
        a2=z_mid-z_max;
      
        if( (a1>0) && (a2<0) )
        
            b1=I(i,j)-z_min;
            b2=I(i,j)-z_max;
            if((b1>0) && (b2<0))
                P(i,j)=I(i,j);
            else
                P(i,j)=z_mid;
            end
        else
                       
            if(s<=s_max)
                s=s+2;
                l=floor(s/2);
                a=zeros(s*s);
                continue;
            else
                P(i,j)=z_mid;
            end    
        end
    end
end

figure,
subplot(1,2,1);imshow(I);       title('Original');
subplot(1,2,2);imshow(uint8(P));title('Filtered');
         
        