%script to analyze trenches and fault zones for PGE
%JRA modified from Nagra code Feb 2024
%major update in July 2024; this one does not georeference so most of the
%Nagra input is now gone
%clean up
clear all
close all

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%set parameters
msz=14; %markersize for plots
data_dir=fullfile('../Data/Pamir/');
output_dir=fullfile('../Outputs/Pamir/');
georeference = 0; %set as 1 for yes
trench_image=fullfile(data_dir, 'T5W.png');
trench_name=('Patyniak Tashkungey T5W');
Operator=('JRA');
fault_name=('PFT');
slip_sense=('R'); %SS for strike slip; N for normal; R for reverse
site_name=('Tashkungey');
site_type=('R'); %Research (R) or Consultant (C)
reference=('Patyniak et al. 2021'); %NO COMMAS
geologic_unit=('T3'); %maybe can use B for bedrock and then Qy, Qi, Qo for relative ages of surficial units
event=('C'); %Cumulative (C), MRE, PEN, or event N with 1 = MRE
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%if georeference == 1 % here is the big switch
%deleted this part of the code
   %this would be for non georeferenced conditions
    %set the trench log scale; assume 1:1
    figure(2)
    clf; hold on
    [A] = read_and_plot_trench_image(trench_image);
    T.trench_scale = input('click on the left and then right of known distance (should be HORIZONTAL), which is (assume meters). \n Enter the number now and then push enter ');
    pause; % just to get the zoom right
    T.trench_scale_pts = ginput;
    fprintf('click on the endpoints of the trench\n')
    T.imageendpts = ginput;

    %locate primary and secondary fractures
    fprintf('click on points of interest on the trench log\n')
    fprintf('click on PRIMARY FRACTURE first ONCE\n')
    fprintf('then all secondary faults\n')
    T.imagepts=ginput;
    %locate MRE fractures
    yesmre=input('Do you want to do the MRE fractures (1 for yes)?');
    if(yesmre==1)
        fprintf('click on MRE fractures on the trench log\n')
        T.mrepts=ginput;
    else
        T.mrepts=NaN;
    end
   
    [x_fracture_positions, y_fracture_positions, mre_x_fracture_positions, mre_y_fracture_positions, trench_length, FZW, fault_half_width, trench_half_width, mredist] = process_trench_points_no_georef(T,msz);

    % Prompt the user for a string input for observations immediate to the
    % log and then relative to the site
    figure(2)
    [facies] = get_facies();
    notes = input('Please enter any notes: ', 's');
    slip = input('What is the slip (m): ');
    max_age = input('What is the maximum age (ka): ');
    landforms = input(['Indicating landform: \n' ...
    ' alignment or lineament (AL), fault scarp (SP), range front (R), \n ' ...
    'triangular facet (TF), sag pond (SA), landslide (LS), Offset Channel (OC), \n' ...
    ' low quality data (LQD), no mapped pre-rupture tectonic landform (No). '], 's');
    dist2landform = input('Distance from indicating landform to the trench (m): ');
    angle_rel2_landform = input('Angle between fault trend and feature: ');

    latitude = input('Latitude: ');
    longitude = input('Longitude: ');
    elevation = input('Elevation: ');

    write_out_results_no_georef(output_dir,trench_name, Operator, trench_length,FZW, fault_half_width,trench_half_width, x_fracture_positions, y_fracture_positions, mre_x_fracture_positions, mre_y_fracture_positions, mredist)

%Report to the main table
write_to_main_table(Operator, fault_name, site_name, trench_name, ...
    georeference, reference, facies, latitude, longitude, elevation, ...
    trench_length,FZW, fault_half_width,trench_half_width, landforms, geologic_unit, ...
    dist2landform, notes, slip_sense, slip, max_age, site_type, x_fracture_positions, event, mredist, ...
    angle_rel2_landform)

close all