function code = encoder(message, key, background, rowsize, colsize, rowstart, colstart, blocksize)
%ENCODER Embeds message inside background 
%   Takes the (possibly RGB) images "message" and "key", 
%   resizes them to the desired rowsize & columnsize, bitwise XOR them,
%   and embeds the resulting image to the background image.

gray_message = rgb2gray(message); % message in grayscale
gray_key = rgb2gray(key); % key in grayscale
gray_background = rgb2gray(background); % background in grayscale

% scales the images to the desired size
scaled_message = imresize(gray_message, [rowsize colsize]);
scaled_key = imresize(gray_key, [rowsize colsize]);

% since blocksize and start points are given, we can calculate end points
% for the background embedding
rowend = rowstart + blocksize*rowsize - 1;
colend = colstart + blocksize*colsize - 1;

% scales the background to fit precisely to the image
code = gray_background(rowstart:rowend, colstart:colend);

% encodes the message with key by elementwise bitwise XOR'ing the pixels
B = bitxor(scaled_message, scaled_key);

% embeds the XOR'd image to the background
code(1:blocksize:end, 1:blocksize:end) = B(1:end, 1:end);

end

