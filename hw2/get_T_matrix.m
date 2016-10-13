function [q,T] = get_T_matrix(p)

centroid = mean(p,2);
dists = sqrt(sum((p - repmat(centroid,1,size(p,2))).^2,1));
mean_dist = mean(dists);
T = [sqrt(2)/mean_dist 0 -sqrt(2)/mean_dist*centroid(1);...
            0 sqrt(2)/mean_dist -sqrt(2)/mean_dist*centroid(2);...
            0 0 1];
q=T*p;

end