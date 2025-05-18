function write_out_results_no_georef(output_dir,trench_name, Operator, trench_length,FZW, fault_half_width,trench_half_width, x_fracture_positions, y_fracture_positions, mre_x_fracture_positions, mre_y_fracture_positions, mredist)
%write out summary file, points file, and shapefile
fid = fopen(strcat(output_dir,trench_name,'_summary.txt'), 'w');
fprintf(fid,date);
fprintf(fid,'\n');
fprintf(fid,Operator);
fprintf(fid,'\n');
fprintf(fid,trench_name);
fprintf(fid,'\n');
fprintf(fid,'No georef\n');
fprintf(fid,'Trench length = %.1f m\n', trench_length);
fprintf(fid,'Fault zone width = %.1f m\n', FZW);
fprintf(fid,'Trench half width = %.2f %.2f m\n', trench_half_width);
fprintf(fid,'Fault zone half width = %.2f %.2f m\n', fault_half_width);
fprintf(fid,'Number of secondary fractures = %.d\n', length(x_fracture_positions)-1);
fprintf(fid,'MRE max dist to any fracture = %.1f m\n', mredist);
fclose(fid);

fracture_tips=[x_fracture_positions y_fracture_positions; mre_x_fracture_positions mre_y_fracture_positions]

D={};
D{1}='P';
for i=2:length(x_fracture_positions)
    D{i}='S';
end
for i=length(x_fracture_positions)+1:length(fracture_tips(:,1))
    D{i}='MRE';
end


varNames = {'x_fracture_tips','y_fracture_tips', 'P or S or MRE'};
formatted_x = arrayfun(@(x) sprintf('%.2f', x), fracture_tips(:,1), 'UniformOutput', false);
formatted_y = arrayfun(@(y) sprintf('%.2f', y), fracture_tips(:,2), 'UniformOutput', false);
P=table(formatted_x, formatted_y, D','VariableNames',varNames);
writetable(P,strcat(output_dir,trench_name,'fracture_tips_pts.txt'))

figure(2)
    print('-dpng', strcat(output_dir,trench_name,'_Trench_log'))
    print('-dpdf', strcat(output_dir,trench_name,'_Trench_log'), '-bestfit')
    print('-depsc', strcat(output_dir,trench_name,'_Trench_log'))

end