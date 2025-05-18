function [x_fracture_positions, y_fracture_positions, mre_x_fracture_positions, mre_y_fracture_positions, trench_length, FZW, fault_half_width, trench_half_width, mredist] = process_trench_points_no_georef(T,msz)
%function to set the scale of the trench log coordinate sytem
%and to make calculations of the geometric properties of the fracture
%network
%T has the points in it including
%T.trench_scale -- the horizontal distance in meters between the two scale
%points:
%T.trench_scale_pts -- two points that give us the scale. Assume horizontal
%T.imageendpts -- end points of the trench.
%T.imagepts -- points on the tops of the fractures.

%plot the points back on the image
plot(T.trench_scale_pts(:,1),T.trench_scale_pts(:,2), 'k+', 'MarkerSize',msz)
plot(T.imageendpts(:,1),T.imageendpts(:,2), 'b.', 'MarkerSize',msz)
plot(T.imagepts(1,1),T.imagepts(1,2), 'ro', 'MarkerSize',msz)
plot(T.imagepts(:,1),T.imagepts(:,2), 'r.', 'MarkerSize',msz)

xorigin=T.trench_scale_pts(1,1); %set a local horizontal origin at the first trench scale points
yorigin=T.trench_scale_pts(1,2); %set a local vertical origin at the first trench scale points
T.trench_scale_pts(:,1)=T.trench_scale_pts(:,1)-xorigin;
pixeldist=abs(T.trench_scale_pts(1,1)-T.trench_scale_pts(2,1)); 
scaler=T.trench_scale/pixeldist;
t=(T.imageendpts(:,1)-xorigin).*scaler;
trench_length=abs(t(2)-t(1));

x_fracture_positions=(T.imagepts(:,1)-xorigin).*scaler;
FZW=max(x_fracture_positions)-min(x_fracture_positions);
fault_half_width=[abs(max(x_fracture_positions)-x_fracture_positions(1)) abs(min(x_fracture_positions)-x_fracture_positions(1))];
trench_half_width=[abs(t(2)-x_fracture_positions(1)) abs(t(1)-x_fracture_positions(1))];

y_fracture_positions=(T.imagepts(:,2)-yorigin).*scaler;

if(isfinite(T.mrepts))
    plot(T.mrepts(:,1),T.mrepts(:,2), 'g.', 'MarkerSize',msz)
    mre_x_fracture_positions=(T.mrepts(:,1)-xorigin).*scaler;
    mre_y_fracture_positions=(T.mrepts(:,2)-yorigin).*scaler;
    mredist=0;
    for i=1:length(mre_x_fracture_positions)
        dist=max(abs(mre_x_fracture_positions(i)-x_fracture_positions));
        if dist>mredist
            mredist=dist;
        end
    end
else
    mredist=NaN;
end