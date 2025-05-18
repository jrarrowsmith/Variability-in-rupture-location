function [facies] = get_facies()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% Read the image from a file

img = imread('Key-symbols-and-lithofacies-codes-used-for-the-describing-of-Quaternary-sections-after.png');

% Create a new figure
figure(3)

% Display the image
imshow(img);

% Turn off axis visibility
axis off;

% Add a title to the image
title(['Quaternary Field Mapping: Lowland Britain - Scientific Figure on ResearchGate. Available from: https://www.researchgate.net/figure/Key-symbols-and-lithofacies-codes-used-for-the-describing-of-Quaternary-sections-after_fig8_299858657 [accessed 2 Jul, 2024]']); 

facies = input('Please enter a string for the lithofacies code: ', 's');

end