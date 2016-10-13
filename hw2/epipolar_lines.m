function [l,l_]=epipolar_lines(p,p_,F,image_1,image_2)
l_=F*p;
l=F'*p_;
x=1:size(image_1);
points_=zeros(2,size(x,2),size(l,2));
for i=1:size(l_,2)
    a=l_(1,i);
    b=l_(2,i);
    c=l_(3,i);
    y=(-c-a*x)/b;
    points_(1,:,i)=x;
    points_(2,:,i)=y;
    
end

points=zeros(2,size(x,2),size(l,2));
for i=1:size(l,2)
    a=l(1,i);
    b=l(2,i);
    c=l (3,i);
    y=(-c-a*x)/b;
    points(1,:,i)=x;
    points(2,:,i)=y;
    
end
figure;
imshow(image_1);
for i=1:size(l,2)
    hold on
    plot(p(1,i),p(2,i),'o');
    hold on
    plot(points(1,:,i),points(2,:,i));
    
    
end
figure;
imshow(image_2);
for i=1:size(l_,2)
    hold on
    plot(p_(1,i),p_(2,i),'o');
    hold on
    plot(points_(1,:,i),points_(2,:,i));
    
end

end