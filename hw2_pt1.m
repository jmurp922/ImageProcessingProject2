% HW 2 Part 1  -  James Murphy %

% Open everest_kalapatthar image %
everest_kalapatthar = imread('Everest_kalapatthar.jpg'); 

% Open everest_expedition image
everest_expedition = imread('Everest_expedition.jpg');

% Part 1 - Built in functions %

%Take ycbcr of both Expedition and Kalapatther %
ycbcr_Kalapatthar = rgb2ycbcr(everest_kalapatthar);
ycbcr_Expedition = rgb2ycbcr(everest_expedition);

%Take rgb of both Expedition and Kalapatther %
rgb_Kalapatthar = ycbcr2rgb(ycbcr_Kalapatthar);
rgb_Expedition = ycbcr2rgb(ycbcr_Expedition);

%Convert image by my function %
RGB_YCB_kalapatthar = rgb_ycbcr(everest_kalapatthar);
RGB_YCB_expedition =  rgb_ycbcr(everest_expedition);
YCB_RGB_kalapatthar = ycbcr_rgb(ycbcr_Kalapatthar);
YCB_RGB_Rexpedition = ycbcr_rgb(ycbcr_Expedition);

% Plot the results onto the grid for Kalapatthar %
figure();
subplot(3,2,1),imshow(ycbcr_Kalapatthar),title('rgb2ycbcr matlab function');
subplot(3,2,2),imshow(RGB_YCB_kalapatthar),title('Coded rgb2ycbcr');
subplot(3,2,3),imshow(rgb_Kalapatthar),title('rgb matlab function');
subplot(3,2,4),imshow(YCB_RGB_kalapatthar),title('Coded ycbcr2rbg');

% Plot the results onto the grid for Expedition %
figure();
subplot(3,2,1),imshow(ycbcr_Expedition),title('rgb2ycbcr matlab function');
subplot(3,2,2),imshow(RGB_YCB_expedition),title('Coded rgb2ycbcr');
subplot(3,2,3),imshow(rgb_Expedition),title('rgb matlab function');
subplot(3,2,4),imshow(YCB_RGB_Rexpedition),title('Coded ycbcr2rbg');


function image_out = rgb_ycbcr(image_in)
    %Convert the image into a double to be able to do computation
    temp_image = double(image_in);
    %Set the range of RGB values from [0, 1]
    temp_image = temp_image/255;
    %Take out and store each of the RGB values
    R = temp_image(:,:,1);
    G = temp_image(:,:,2);
    B = temp_image(:,:,3);
    % Get the results from the formula (Y, Cb, Cr) 
    % With y = 16, Cb = 128, Cr = 128 from hw assignment * RGB values 
    % in the matrix
    Y = 16 + 65.481*R + 128.553*G + 24.966*B;
    Cb = 128 - 37.797*R - 74.203*G + 112.000*B;
    Cr = 128 + 112.000*R - 93.786*G - 18.214*B;
    %Put the image back together by the Y CB Cr values
    image_out = uint8(cat(3,Y,Cb,Cr));
end

function image_out = ycbcr_rgb(image_in)
    %Convert the image into a double to be able to do computation
    temp_image = double(image_in);
    %Take out and store each of the RGB values
    Y = temp_image(:,:,1);
    Cb = temp_image(:,:,2);
    Cr = temp_image(:,:,3);
    % Get the results from the formula (Y, Cb, Cr) 
    % With y = 16, Cb = 128, Cr = 128 from hw assignment * RGB values 
    % in the matrix
    Y = Y - 16;
    Cb = Cb - 128;
    Cr = Cr - 128;  
    R = 0.0046 * Y + 0.0000 * Cb + 0.0063 * Cr;
    G = 0.0046 * Y - 0.0015 * Cb - 0.0032 * Cr;
    B = 0.0046 * Y + 0.0079 * Cb + 0.0000 * Cr;
    %Put the image back together by the Y CB Cr values
    image_out = cat(3,R,G,B) * 255;
    image_out = uint8(image_out);
end