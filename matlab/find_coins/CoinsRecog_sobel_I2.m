clc
clear all

% Edge Detection
% Original Image
CR = imread('20160921_1.jpg'); % Reading Original Image
figure % Displaying Original Image
imshow(CR),title('Original Coins Image');

% Black and White (Binary) Image
GI = rgb2gray(CR); % Converting Original to Grayscale Image
figure  % Displaying Grayscale Image
imshow(GI),title('Grayscale Image of Original');

GIblur1 = imgaussfilt(GI,4);
figure  % Displaying Grayscale Image
imshow(GIblur1),title('Grayscale Image without salt & pepper noise');

% Edge Detection using Sobel operator
BWs = edge(GIblur1, 'sobel'); % using Sobel Operator
figure % Displaying Edge-detected Image
imshow(BWs), title('Edges of Original using Sobel Mask');

% Dilating the image
% Filling the detected object in image with linear structures
% st0 = strel('line',4, 0); % strel-line with length 4 and 0 degree
% st90 = strel('line',4, 90); % strel-line with length 4 and 90 degree
stD = strel('diamond', 20);
% strel structure with diamond shape and lenght 20
% Using dilate function
% BWsdil = imdilate(BWs, [st90, st0]);
BWsdil = imdilate(BWs, stD); % Smoothening effect
figure % Displaying Dilated Image
imshow(BWsdil), title('Dilated Gradient Mask of Edge Detected Image');

% % Applying Contra Harmonic Mean filter to remove the salt & pepper noise
% MI1 = contraharmeanfilt(BWs, 1.2 ); % Q = -2, order of filter
% % Q = +ve, pepper noise, Q = -ve, salt noise
% figure % Displaying Image after removing salt noise
% imshow(MI1), title('Image after removing Salt noise');

% Filling holes representing coins
BWdfill = imfill(BWsdil, 'holes'); 
figure, imshow(BWdfill); % Displaying the Dilated Image with filled holes
title('Dilated Binary Image with filled holes');

% Eroding the image (Sharpening effect)
% BWsero = imerode(BWdfill, [st90, st0]);
BWsero1 = imerode(BWdfill, strel('diamond', 10));
BWsero2 = imerode(BWsero1, strel('diamond', 10));
BWsero3 = imerode(BWsero1, strel('diamond', 4));
BWsero4 = imerode(BWsero1, strel('diamond', 4));
figure % Displaying Eroded Image
imshow(BWsero4), title('Eroded Gradient Mask of  Edge Detected Image');

% Displaying Original Image and ploting Outline of Boundaries of coins
figure 
imshow(CR), title('Outlined Original Coins Image');
hold on
% Traces exterior boundary of Objects and boundaries of holes inside 
% these objects
boundaries = bwboundaries(BWsero4);
for k=1:8
   b = boundaries{k}; %boundaries is a variable of type cell
   plot(b(:,2),b(:,1),'r','LineWidth',3);
end

% d1 = imdistline;
% d2 = imdistline;
% d3 = imdistline;
% % delete(d1); delete(d2); delete(d3);

% [centers, radii] = imfindcircles(BWs2dil,[400 450],'ObjectPolarity',...,
%                     'bright','Sensitivity',0.2)              