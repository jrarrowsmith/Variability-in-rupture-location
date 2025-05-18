function write_to_main_table(Operator, fault_name, site_name, trench_name, georeference, reference, facies, latitude, longitude, elevation, trench_length,FZW, fault_half_width,trench_half_width, landforms, geologic_unit, dist2landform, notes, slip_sense, slip, max_age, site_type,x_fracture_positions, event, mredist, angle_rel2_landform)
%Writes out all results for the trench to a single row in the master table
outputs=fullfile('../Outputs/');
fileID = fopen(strcat(outputs,'SummaryTable.csv'), 'r');
% Check if the file exists
if fileID == -1 %need to add first row
    fid = fopen(strcat(outputs,'SummaryTable.csv'), 'a+'); %csv is comma separated, a+ is append
    fprintf(fid, 'Date and Time,');
    fprintf(fid, 'Operator,');
    fprintf(fid, 'Slip Sense,'); %SS for strike slip; N for normal; R for reverse
    fprintf(fid, 'Fault,');
    fprintf(fid, 'Site,');
    fprintf(fid, 'Type,');
    fprintf(fid, 'Trench,');
    fprintf(fid, 'Event,');
    fprintf(fid, 'Georeference (1=Yes),');
    fprintf(fid, 'Reference(s),');
    fprintf(fid, 'Lithofacies,');
    fprintf(fid, 'Geologic unit,');
    fprintf(fid, 'Indicating Landform(s),');
    fprintf(fid, 'Landform to trench distance (m),');
    fprintf(fid, 'Angle between fault trend and feature (deg),');
    fprintf(fid, 'Notes,');
    fprintf(fid, 'Latitude,');
    fprintf(fid, 'Longitude,');
    fprintf(fid, 'Elevation (m),');
    fprintf(fid, 'Trench length (m),');
    fprintf(fid, 'Fault zone width (m),');
    fprintf(fid, 'Trench half width (m),');
    fprintf(fid, ',');
    fprintf(fid, 'Fault zone half width (m),');
    fprintf(fid, ',');
    fprintf(fid, 'Number of secondary fractures,');
    fprintf(fid, 'Slip (m),');
    fprintf(fid, 'Max age (ka),');
    fprintf(fid, 'MRE max dist to any fracture (m)');


    fprintf(fid,'\n');
    fclose(fid);
    fclose('all'); 
end

fid = fopen(strcat(outputs,'SummaryTable.csv'), 'a+'); %csv is comma separated, a+ is append
fprintf(fid,datestr(datetime("now"))); fprintf(fid,', ');
fprintf(fid,Operator); fprintf(fid,', ');
fprintf(fid,slip_sense); fprintf(fid,', '); %SS for strike slip; N for normal; R for reverse
fprintf(fid,fault_name); fprintf(fid,', ');
fprintf(fid,site_name); fprintf(fid,', ');
fprintf(fid,site_type); fprintf(fid,', ');
fprintf(fid,trench_name); fprintf(fid,', ');
fprintf(fid,event); fprintf(fid,', ');
fprintf(fid,'%.f',georeference); fprintf(fid,', ');
fprintf(fid,reference); fprintf(fid,', ');
fprintf(fid,facies); fprintf(fid,', ');
fprintf(fid,geologic_unit); fprintf(fid,', ');
fprintf(fid,landforms); fprintf(fid,', ');
fprintf(fid,'%.1f', dist2landform); fprintf(fid,', ');
fprintf(fid,'%.1f', angle_rel2_landform); fprintf(fid,', ');
fprintf(fid,notes); fprintf(fid,', ');
fprintf(fid,'%.5f', latitude); fprintf(fid,', ');
fprintf(fid,'%.5f', longitude); fprintf(fid,', ');
fprintf(fid,'%.1f', elevation); fprintf(fid,', ');
fprintf(fid,'%.1f', trench_length); fprintf(fid,', ');
fprintf(fid,'%.1f', FZW); fprintf(fid,', ');
fprintf(fid,'%.1f', trench_half_width(1)); fprintf(fid,', ');
fprintf(fid,'%.1f', trench_half_width(2)); fprintf(fid,', ');
fprintf(fid,'%.1f', fault_half_width(1)); fprintf(fid,', ');
fprintf(fid,'%.1f', fault_half_width(2)); fprintf(fid,', ');
fprintf(fid,'%.d', length(x_fracture_positions)-1); fprintf(fid,', ');
fprintf(fid,'%.1f', slip); fprintf(fid,', ');
fprintf(fid,'%.2f', max_age); fprintf(fid,', ');
fprintf(fid,'%.1f', mredist); fprintf(fid,', ');


fprintf(fid,'\n');

fclose(fid);

fclose('all'); %clean up

end





