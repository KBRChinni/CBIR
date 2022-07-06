cam=webcam;
nof=input('Enter No. of required frames: ');
count=1;
while count<=nof
    img = snapshot(cam) ;
    [croppedframe, bboxpoint] =myfacedetect(img);
    imshow(croppedframe);
    if ~isempty(croppedframe)
        filename=strcat('G:\matlabimgs\',sprintf('%d.png',count));
        imwrite(croppedframe,filename);
        msg=['Image Aquired No.: ',num2str(count)];
        disp(msg)
        count=count+1;
    else
        disp('No face Detected')
    end
    clf('reset')
    pause(1)
end
clear clc;
clear cam;