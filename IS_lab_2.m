clc;
clear all;
close all;

x = 0.1:1/22:1;
d = (1+0.6*sin(2*pi*x/0.7)+0.3*sin(2*pi*x))/2;


%random vertes

w1=[rand(1) rand(1) rand(1) rand(1) rand(1)];
w2=[rand(1) rand(1) rand(1) rand(1) rand(1)];
b1=[rand(1) rand(1) rand(1) rand(1) rand(1)];
b2=rand(1);



%mokymo zingsnis

niu = 0.1;


v_1=[];
y_1=[];


for l = 1:length(x)
    for i = 1:length(w1)
   v_1(i) = w1(i)*x(l)+b1(i);
   y_1(i) = 1/(1+exp(-v_1(1)));
    end
    v_2=y_1(1)*w2(1)+y_1(2)*w2(2)+y_1(3)*w2(3)+y_1(4)*w2(4)+y_1(5)*w2(5)+b2;
    y(l)=v_2;
end    

e=d(1) - y(1);

sig=[];
iteration=0;
while iteration < 100000
for n = 1:length(x)
    for i = 1:length(w1)
   v_1(i) = w1(i)*x(n)+b1(i);
   y_1(i) = 1/(1+exp(-v_1(i)));
    end
    
    
    v_2=y_1(1)*w2(1)+y_1(2)*w2(2)+y_1(3)*w2(3)+y_1(4)*w2(4)+y_1(5)*w2(5)+b2;
    y=v_2;
    e=d(n)-y;
	
for g = 1:length(w2)
   w2(g)=w2(g)+niu*e*y_1(g);
end
  
    b2=b2 + niu*e; 
    
   for z=1:length(w1)
         sig=y_1(z)*(1-y_1(z))*e*w2(z);
         w1(z)=w1(z)+niu*sig*x(n);
         b1(z)=b1(z)+niu*sig;
   end
end
iteration=iteration+1;
end

for l=1:length(x)
    for i=1:length(w1)
        vg1(i)=w1(i)*x(l)+b1(i);
        yg1(i)=1/(1+exp(-vg1(i)));
    end
    yg(l)=yg1(1)*w2(1)+yg1(2)*w2(2)+yg1(3)*w2(3)+yg1(4)*w2(4)+yg1(5)*w2(5)+b2;
end

figure(1)
plot(x,d,'kx',x,d,'blue',x,yg,'o',x,yg,'red'); grid on;
