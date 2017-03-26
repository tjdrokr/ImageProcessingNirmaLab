a=imread('C:\Users\TANAY\Desktop\a.jpg');
i=rgb2gray(a);

[rows,cols]=size(i);
n=input('Enter the operation to be done: \n1 for average \n2 for weighted average \n3 for min \n4 for max and \n5 for median\n');
out=zeros(rows,cols,'double');
wt=zeros(3);

x=input('Enter the size of the filter matrix');
l=floor(x/2);

j=imnoise(i,'salt & pepper');

%AVERAGE
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
subplot(1,2,1),imshow(uint8(i)),title('Original');
subplot(1,2,2),imshow(uint8(out)),title('Average');
end

%WEIGHTED AVERAGE
if(n==2)
su=0;
    for c = 1 : x
        for r = 1 : x
            wt(r,c)=input('Enter weights row wise:');
            su=su+wt(r,c);
        end
    end
    for c = 1 : cols
        for r = 1 : rows
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            j=1;
            for mx = c-l : c+l
                k=1;
                for nx = r-l : r+l
                    out(r,c) = out(r,c) + (wt(k,j)*i(nx,mx))/su;
                    k=k+1;
                end
                j=j+1;
            end
            %out(r,c)=out(r,c)/16;
        end
    end
subplot(1,2,1),imshow(uint8(i)),title('Original');
subplot(1,2,2),imshow(uint8(out)),title('Weighted average');
end

%MINIMUM
if(n==3)
    
    i=imnoise(i,'salt & pepper');
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
subplot(1,2,1),imshow(uint8(i)),title('Original');
subplot(1,2,2),imshow(uint8(out)),title('Minimum');
end

%MAXIMUM
if(n==4)
    
    i=imnoise(i,'salt & pepper');
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
subplot(1,2,1),imshow(uint8(i)),title('Original');
subplot(1,2,2),imshow(uint8(out)),title('Maximum');
end

%MEDIAN
arr=zeros(x*x);
if(n==5)
    i=imnoise(i,'salt & pepper');
    for c = 1 : cols
        for r = 1 : rows
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            count=1;
            arr=0;
            for mx = c-l : c+l
                for nx = r-l : r+l
                    arr(count)=i(nx,mx);
                    count=count+1;
                end
            end
            b=sort(arr);
            out(r,c)=b(floor((x*x)/2));
            
        end
    end
subplot(1,2,1),imshow(uint8(i)),title('Original');
subplot(1,2,2),imshow(uint8(out)),title('Median');
end