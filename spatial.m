a=imread('C:\Users\TANAY\Desktop\a.jpg');
i=rgb2gray(a);

[rows,cols]=size(i);
n=input('Enter the operation to be done: 1 for average filter, 2 for weighted average, 3 for min, 4 for max and 5 for median\n');
out=zeros(rows,cols,'double');
x=input('Enter the size of the filter matrix');
l=floor(x/2);

%average
if(n==1)
    for c = 1 : cols
        for r = 1 : rows
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    out(r,c) = out(r,c) + i(nx,mx)/(x*x);
                end
            end
        end
    end
figure,imshow(uint8(i)),title('original');
figure,imshow(uint8(out)),title('average');
end

%weighted average
if(n==2)
    for c = 1 : cols
        for r = 1 : rows
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    out(r,c) = out(r,c) + i(nx,mx)/(x*x);
                end
            end
        end
    end
figure,imshow(uint8(i)),title('original');
figure,imshow(uint8(out)),title('weighted average');
end

%minimum
if(n==3)
    for c = 1 : cols
        for r = 1 : rows
            min=255;
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    if (i(nx,mx)<min)
                        min=i(nx,mx);
                    end
                end
                out(r,c)=min;
            end
        end
    end
figure,imshow(uint8(i)),title('original');
figure,imshow(uint8(out)),title('Minimum');
end

%maximum
if(n==4)
    for c = 1 : cols
        for r = 1 : rows
            max=0;
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    if (i(nx,mx)>max)
                        max=i(nx,mx);
                    end
                end
                out(r,c)=max;
            end
        end
    end
figure,imshow(uint8(i)),title('original');
figure,imshow(uint8(out)),title('Maximum');
end

%median
if(n==5)
a=zeros(x*x);
s=1;
    for c = 1 : cols
        for r = 1 : rows
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    a(s)=i(mx,nx);
                end
            end
            for a = 1 : ((x*x)/2)
                for b = 2 : x
                       
                end
            end
        end
    end
figure,imshow(uint8(i)),title('original');
figure,imshow(uint8(out)),title('Median');
end