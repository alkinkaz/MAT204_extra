function message = decoder(code, key, blocksize, rowsize, colsize)
%DECODER Decodes the code image with given key
%   Detailed explanation goes here

% changes the key to grayscale and scales it
gray_key = rgb2gray(key);
scaled_key = imresize(gray_key, [rowsize colsize]);

% extracts embedded xor'd image
xored = code(1:blocksize:end, 1:blocksize:end);

% xor's again with the key to find the original message
message = bitxor(xored, scaled_key);

end

