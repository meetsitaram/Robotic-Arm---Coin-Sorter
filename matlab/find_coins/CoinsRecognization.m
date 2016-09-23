clc
clear all

CR = imread('20160921_1.jpg');
%CR = imread('Fig 1.jpg');
figure
imshow(CR),title('Original Coins Image showing Coins');
hold on
[row, col] = size(CR);

d1 = imdistline;
d2 = imdistline;
d3 = imdistline;
 
delete(d1); delete(d2); delete(d3);

[centers, radii] = imfindcircles(CR,[80 135],'ObjectPolarity','dark', ...
    'Sensitivity',0.95)
for i = 1:size(radii)
    plot(centers(i,1),centers(i,2),'r+','MarkerSize',5,'LineWidth',3);
end
viscircles(centers,radii);

% RSZ = imresize(CR, 500/row);
% figure
% imshow(RSZ),title('Resized Coins Image');
% 
% GI = rgb2gray(RSZ);
% figure
% imshow(GI), title('Gray Image of Original');
% 
% GIblur1 = imgaussfilt(GI,2);
% figure  % Displaying Grayscale Image
% imshow(GIblur1),title('Grayscale Image without salt & pepper noise');
% 
% % Edge Detection using Sobel operator
% BWs = edge(GIblur1, 'sobel'); % using Sobel Operator
% figure % Displaying Edge-detected Image
% imshow(BWs), title('Edges of Original using Sobel Mask');
% 
% % Dilating the image
% % Filling the detected object in image with linear structures
% st0 = strel('line',4, 0); % strel-line with length 4 and 0 degree
% st90 = strel('line',4, 90); % strel-line with length 4 and 90 degree
% % Using dilate function
% BWsdil = imdilate(BWs, [st90, st0]); % Smoothening effect
% figure % Displaying Dilated Image
% imshow(BWsdil), title('Dilated Gradient Mask of Edge Detected Image');
% 
% % Filling holes representing coins
% BWdfill = imfill(BWsdil, 'holes'); 
% figure, imshow(BWdfill); % Displaying the Dilated Image with filled holes
% title('Dilated Binary Image with filled holes');
% 
% BWnobord = imclearborder(BWdfill, 4);
% figure, imshow(BWnobord), title('Cleared Border Image');
% 
% % Eroding the image Min Filter
% % Filling the detected object in image with linear structures
% st0 = strel('line',3, 0); % strel-line with length 3 and 0 degree
% st90 = strel('line',3, 90); % strel-line with length 3 and 90 degree
% % Using dilate function
% BWerod1 = imerode(BWnobord, [st90, st0]);
% BWerod2 = imerode(BWerod1, strel('diamond', 6));
% figure % Displaying Dilated Image
% imshow(BWerod2), title('Eroded Gradient Mask of Edge Detected Image');
% 
% % remove all object containing fewer than 30 pixels
% BWCl = bwareaopen(BWerod2,30);
% figure
% imshow(BWCl);  title('Coins Image after clearing unnecessary spots');
% 
% BWdil = imdilate(BWCl,strel('disk',6));
% figure % Displaying Dilated Image
% imshow(BWdil), title('Dilating the shapes');
% 
% % Displaying Original Image and ploting Outline of Boundaries of coins
% figure 
% imshow(RSZ), title('Outlined Original Coins Image');
% hold on
% % Traces exterior boundary of Objects and boundaries of holes inside 
% % these objects
% boundaries = bwboundaries(BWdil);
% for k=1:8
%    b = boundaries{k}; %boundaries is a variable of type cell
%    plot(b(:,2),b(:,1),'r','LineWidth',3);
% end
% 
% % % remove all object containing fewer than 30 pixels
% % BWCl = bwareaopen(BWerod2,100);
% % figure
% % imshow(BWCl);  title('Coins Image after clearing unnecessary spots');
