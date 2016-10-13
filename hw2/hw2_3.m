close all;
clear;
clc;
[p,p_]=readTextFiles;
F=eight_point(p,p_);
[q,T] = get_T_matrix(p);
[q_,T_] = get_T_matrix(p_);
Fq=eight_point(q,q_);
F_=T_'*Fq*T;
image1=imread('set2\image1.jpg');
image2=imread('set2\image2.jpg');
[l,l_]=epipolar_lines(p,p_,F_,image1,image2);
err_F=err_dist(p,p_,F);
err_N=err_dist(p,p_,F_);
[rmse_x,rmse_y,H_l,H_r]=image_rect(F_,image1,p,p_);
H_l_=projective2d(H_l.');
im1=imwarp(image1,H_l_);
H_r_=projective2d(H_r.');
im2=imwarp(image2,H_r_);
figure
imshow(im1);
figure
imshow(im2);
