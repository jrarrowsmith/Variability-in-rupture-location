%script to summarize the outputs for a site for the fracture mapping
close all
clear all
files=dir('*_summary.txt');

T=[];
TL=[];
FZW=[];
THW=[];
FZHW=[];
NF=[];
MRE=[];

for i=1:length(files)
fid =fopen(files(i).name);

d = fgetl(fid); %date of digitizing
o = fgetl(fid); %operator
t = fgetl(fid); %trench names
    T = [T {t}]; 
p = fgetl(fid); %projection
tl = fgetl(fid); %trench length
    n = str2double(regexp(tl, '\d+\.?\d*', 'match'));
    TL = [TL n];
fzw = fgetl(fid);
    n = str2double(regexp(fzw, '\d+\.?\d*', 'match'));
    FZW = [FZW n];
thw = fgetl(fid);
    numbers = str2double(regexp(thw, '\d+\.?\d*', 'match'));
    THW = [THW max(numbers)];
fzhw = fgetl(fid);
    numbers = str2double(regexp(fzhw, '\d+\.?\d*', 'match'));
    FZHW = [FZHW max(numbers)];
numfracs = fgetl(fid);
    n = str2double(regexp(numfracs, '\d+\.?\d*', 'match'));
    NF = [NF n];
mredist = fgetl(fid);
    n = str2double(regexp(mredist, '\d+\.?\d*', 'match'));
    MRE = [MRE n];
fclose(fid);
end

num_bins=5;
x_range=[0 40];
figure(1)
clf
tiledlayout(6,1, "TileSpacing","compact")
nexttile
histogram(TL, 'NumBins', num_bins, 'BinLimits', x_range)
xlabel('Trench length (m)')
nexttile
histogram(THW, 'NumBins', num_bins, 'BinLimits', x_range)
xlabel('Trench half width-max (m)')
nexttile
histogram(FZW, 'NumBins', num_bins, 'BinLimits', x_range)
xlabel('Fault zone width (m)')
nexttile
histogram(FZHW, 'NumBins', num_bins, 'BinLimits', x_range)
xlabel('Fault half width-max (m)')
nexttile
histogram(MRE, 'NumBins', num_bins, 'BinLimits', x_range)
xlabel('MRE max dist to any fracture (m)')
nexttile
histogram(NF)
xlabel('Number of fractures')


