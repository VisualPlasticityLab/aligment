function [x,y]=alignment2(day0,day1)

load(day0)
fixed=double(img);
fixed=img(:,:,2);
clear img

load(day1)
moving=img(:,:,2);
moving=moving*(max(fixed(:))/max(moving(:)));

figure;imshowpair(moving,fixed);
[optimizer, metric] = imregconfig('multimodal');
[moving_reg,R_reg] =  imregister(moving, fixed, 'translation', optimizer, metric);
tform = imregtform(moving, fixed, 'translation', optimizer, metric);
disp(tform.T)
%have to set 'OutputView' mode
movingRegistered= imwarp(moving,tform,'OutputView',imref2d(size(moving)));
figure;imshowpair(movingRegistered,fixed)
%subplot(2,1,1);imshowpair(moving,fixed);
%subplot(2,1,2);
% subplot(3,1,2)
% imshowpair(moving_reg,fixed)
y = tform.T(3,1)*-100/64;
x = tform.T(3,2)*100/48;