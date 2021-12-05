% James Murphy hw 2 part 3

% Open the Lenna Picture
Lenna = imread('Lenna.png');
[num_row, num_col, num_rgb] = size(Lenna);

 %Converting the image to grayscale.
    for row = 1:num_row
        for col = 1:num_col
          gray_scale_lenna(row, col) = 0.299*Lenna(row, col, 1) + 0.587 * Lenna(row, col, 2)+0.144 * Lenna(row, col, 3);
        end
    end    
    
    %Turn the gray_scale_lenna matrix into a double to operate on
    gray_scale_lenna = double(gray_scale_lenna);
    
    % Take the floor of the grayschole / 2^n and mod it and store it
    % Into each 'plane'
    
    bit_plane_1 = mod(floor(gray_scale_lenna/(2^0)),2);  
    bit_plane_2 = mod(floor(gray_scale_lenna/(2^1)),2);  
    bit_plane_3 = mod(floor(gray_scale_lenna/(2^2)),2);    
    bit_plane_4 = mod(floor(gray_scale_lenna/(2^3)),2);
    bit_plane_5 = mod(floor(gray_scale_lenna/(2^4)),2);
    bit_plane_6 = mod(floor(gray_scale_lenna/(2^5)),2);
    bit_plane_7 = mod(floor(gray_scale_lenna/(2^6)),2);
    bit_plane_8 = mod(floor(gray_scale_lenna/(2^7)),2);

    % Plot the bit planes
    figure, 
    subplot(2,4,1)
    imshow(bit_plane_1), title('Plane 0');
    subplot(2,4,2)
    imshow(bit_plane_2), title('Plane 1');
    subplot(2,4,3)
    imshow(bit_plane_3), title('Plane 2');
    subplot(2,4,4)
    imshow(bit_plane_4), title('Plane 3');
    subplot(2,4,5)
    imshow(bit_plane_5), title('Plane 4');
    subplot(2,4,6)
    imshow(bit_plane_6), title('Plane 5');
    subplot(2,4,7)
    imshow(bit_plane_7), title('Plane 6');
    subplot(2,4,8)
    imshow(bit_plane_8), title('Plane 7');
    
    %use imadjust to adjsut the intenstiy values of the photo 
    enhanced_gray_1 = imadjust(bit_plane_1, [0 .1], [0.5 1]);
    enhanced_gray_2 = imadjust(bit_plane_2, [0 .1], [0.5 1]);
    enhanced_gray_3 = imadjust(bit_plane_3, [0 .1], [0.5 1]);
    enhanced_gray_4 = imadjust(bit_plane_4, [0 .1], [0.5 1]);
    enhanced_gray_5 = imadjust(bit_plane_5, [0 .1], [0.5 1]);
    enhanced_gray_6 = imadjust(bit_plane_6, [0 .1], [0.5 1]);
    enhanced_gray_7 = imadjust(bit_plane_7, [0 .1], [0.5 1]);
    enhanced_gray_8 = imadjust(bit_plane_8, [0 .1], [0.5 1]); 
    
    %plot the points
    figure();
    subplot(2,4,1),imshow(enhanced_gray_1),title('Enhanced Plane 0');
    subplot(2,4,2),imshow(enhanced_gray_2),title('Enhanced Plane 1');
    subplot(2,4,3),imshow(enhanced_gray_3),title('Enhanced Plane 2');
    subplot(2,4,4),imshow(enhanced_gray_4),title('Enhanced Plane 3');
    subplot(2,4,5),imshow(enhanced_gray_5),title('Enhanced Plane 4');
    subplot(2,4,6),imshow(enhanced_gray_6),title('Enhanced Plane 5');
    subplot(2,4,7),imshow(enhanced_gray_7),title('Enhanced Plane 6');
    subplot(2,4,8),imshow(enhanced_gray_8),title('Enhanced Plane 7');