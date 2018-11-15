
Im1=imread('J1.jpg');
Im2=imread('J2.jpg');
Im3=imread('J3.jpg');
Im4=imread('J4.jpg');
IBW1=rgb2gray(Im1);
IBW2=rgb2gray(Im2);
IBW3=rgb2gray(Im3);
IBW4=rgb2gray(Im4);

IBW1 = double(imresize(IBW1, [120 120])); 
IBW2 = double(imresize(IBW2, [120 120])); 
IBW3 = double(imresize(IBW3, [120 120])); 
IBW4 = double(imresize(IBW4, [120 120])); 
Cat = cat(3, IBW1, IBW2, IBW3,IBW4);
[h,p,n] = size(Cat);
d=p*h;
%Vectorize images
x = reshape(Cat,[d n]);
x=cat(2,x);

%Average Calc
sumx=0;
for i = 1:n
    sumx=x(:,i)+sumx;
end
avr=(1/n)*sumx;
A=x-avr;

%Covariance Matrix
C=A*transpose(A);
[u,V]=eig(A'*A);
U=A*V;
U=normc(U);

%Figures
figure;
RachelsMan=0;
for i = 1:n
    subplot(1,n,i)
    image=reshape(U(:,i),[120,120]);
    imshow(image,[0 0.002])
    w=(U(:,i))'*(A(:,i));
    RachelsMan=w*U(:,1)+RachelsMan;
end

%Summed Figure
subplot(1,2,1)
image1=reshape(RachelsMan(:,1),[120,120]);
imshow(image1,[-20,40])