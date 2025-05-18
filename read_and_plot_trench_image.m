function [A] = read_and_plot_trench_image(trench_image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = imread(trench_image);
A = flipud(A);
image(A)
axis equal
end