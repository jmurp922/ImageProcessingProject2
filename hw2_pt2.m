%Store kalapatthar
kalapatthar = imread('Everest_kalapatthar.jpg');
%Store Expedition
expedition = imread('Everest_expedition.jpg');  

%Get the matrix dimensions of kalapatthar
[row_kal, col_kal, num_kal] = size(kalapatthar);
[row_exe, col_exe, num2_exe] = size(expedition);
row = min(row_kal, row_exe);      
col = min(col_kal, col_exe);

% m is the rows in the outer loop
% n is the columns
% iterate over every (m, n) pair and add kalapatthar to expedition
for m = 1 : row
    for n = 1 : col
        combine_imgs(m, n, 1) = kalapatthar(m, n, 1)+ expedition(m, n, 1);
        combine_imgs(m, n, 2) = kalapatthar(m, n, 2)+ expedition(m, n, 2);
        combine_imgs(m, n, 3) = kalapatthar(m, n, 3)+ expedition(m,n,3);
    end
end


figure();
imshow(combine_imgs),title('Combined Image');