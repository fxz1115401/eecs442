function [rmse_x,rmse_y,H_l,H_r]=image_rect(F,image1,p,p_)

[U,S,V] = svd(F);
e_l=V(:,3);
e_r=U(:,3);

% e_l=(1/e_l(3))*e_l;
% e_r=(1/e_r(3))*e_r;
center=size(image1)./2;
T=[1 0 -center(1);0 1 -center(2);0 0 1];
e_r_=T*e_r;
theta=atan((e_r_(2))/(e_r_(1)));
R=[cos(theta) sin(theta) 0;-sin(theta) cos(theta) 0;0 0 1];
e_r_=R*e_r_;
G=[1 0 0;0 1 0;-1/(e_r_(1)/e_r_(3)) 0 1];
H_r=G*R*T;
% H_l=[1 0 0;-e_l(2)/e_l(1) 1 0; -1/e_l(1) 0 1];
e_r_x=[0 -e_r_(3) e_r_(2);e_r_(3) 0 -e_r_(1);-e_r_(2) e_r_(1) 0];
M=e_r_x*F+e_r*[1 1 1];
H0=H_r*M;
p_head=H_r*p_;
p_head = p_head ./ repmat( p_head(3,:), 3, 1 );
phead=H0*p;
phead = phead ./ repmat( phead(3,:), 3, 1 );
n=size(p,2);
A=[phead(1,:)',phead(2,:)',ones(n,1)];
b=p_head(1,:)';
x=A\b;
HA = [ x' ; 0 1 0 ; 0 0 1 ];

H_l=HA*H0;
phead=H_l*p;
phead = phead ./ repmat( phead(3,:), 3, 1 );
p_head=H_r*p_;
p_head = p_head ./ repmat( p_head(3,:), 3, 1 );
rmse_x = sqrt( mean(( phead(1,:) - p_head(1,:) ).^2 ));
rmse_y = sqrt( mean(( phead(2,:) - p_head(2,:) ).^2 ));

end

