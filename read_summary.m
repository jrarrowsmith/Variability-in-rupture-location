%script to read the summary table
close all
clear all
fs=18;
fc='r';
filename = "../Outputs/SummaryTable.csv";
opts = detectImportOptions(filename,'NumHeaderLines',0);
opts.ExtraColumnsRule='ignore';
S = readtable(filename,opts);
TL=S.TrenchLength_m_;
THW=S.TrenchHalfWidth_m_;
FZW=S.FaultZoneWidth_m_;
FZHW=S.FaultZoneHalfWidth_m_;
MRE=S.MREMaxDistToAnyFracture_m_;
NF=S.NumberOfSecondaryFractures;

%here could be a find section for SAF or SS for example

nt=length(TL);
nts=sprintf('Number of trenches = %.d',nt);
s=strcat(date, {' '},nts);

num_bins=5;
x_range=[0 40];
figure(1)
clf
tiledlayout(6,1, "TileSpacing","compact")
nexttile
h=histogram(TL, 'NumBins', num_bins, 'BinLimits', x_range)
h.FaceColor = fc;
xlabel('Trench length (m)')
set(gca, 'FontSize', fs);
title(s,'FontSize', fs+2)
nexttile
h=histogram(THW, 'NumBins', num_bins, 'BinLimits', x_range)
h.FaceColor = fc;
xlabel('Trench half width-max (m)')
set(gca, 'FontSize', fs);
nexttile
h=histogram(FZW, 'NumBins', num_bins, 'BinLimits', x_range)
h.FaceColor = fc;
xlabel('Fault zone width (m)')
set(gca, 'FontSize', fs);
nexttile
h=histogram(FZHW, 'NumBins', num_bins, 'BinLimits', x_range)
h.FaceColor = fc;
xlabel('Fault half width-max (m)')
set(gca, 'FontSize', fs);
nexttile
h=histogram(MRE, 'NumBins', num_bins, 'BinLimits', x_range)
h.FaceColor = fc;
xlabel('MRE max dist to any fracture (m)')
set(gca, 'FontSize', fs);
nexttile
h=histogram(NF)
h.FaceColor = fc;
xlabel('Number of fractures')
set(gca, 'FontSize', fs);
