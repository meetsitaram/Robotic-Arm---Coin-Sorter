clc
clear all
% Edge Detection
% Original Image
CR = imread('20160920_3.jpg'); % Reading Original Image
figure % Displaying Original Image
imshow(CR),title('Original Coins Image');

% Black and White (Binary) Image
BW = im2bw(CR); % Converting Original to BW Image
figure  % Displaying BW Image
imshow(BW),title('Binary Image of Original');

% Edge Detection using Sobel operator
BWs = edge(BW, 'sobel'); % using Sobel Operator
figure % Displaying Edge-detected Image
imshow(BWs), title('Edges of Original using Sobel Mask');

% Dilating the image
% Filling the detected object in image with linear structures
st0 = strel('line',3, 0); % strel-line with length 3 and 0 degree
st30 = strel('line',3, 30); % strel-line with length 3 and 30 degree
st60 = strel('line',3, 60); % strel-line with length 3 and 60 degree
st90 = strel('line',3, 90); % strel-line with length 3 and 90 degree
% Using dilate function
BWsdil = imdilate(BWs, [st90, st60, st30, st0]);
figure % Displaying Dilated Image
imshow(BWsdil), title('Dilated Gradient Mask of Original');

BWdfill = imfill(BWsdil, 'holes');
figure, imshow(BWdfill);
title('Binary Image with filled holes');