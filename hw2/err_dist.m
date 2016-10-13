function err=err_dist(p,p_,F)
l_=F*p;
l=F'*p_;
distp_=0;
distp=0;
for i=1:size(p,2)
distp_=abs((l_(1,i)*p_(1,i)+l_(2,i)*p_(2,i)+l_(3,i))/sqrt(l_(1,i)^2+l_(2,i)^2))+distp_;
distp=abs((l(1,i)*p(1,i)+l(2,i)*p(2,i)+l(3,i))/sqrt(l(1,i)^2+l(2,i)^2))+distp;
end

distp_=distp_/37;
distp=distp/37;
err=(distp_+distp)/2;
end