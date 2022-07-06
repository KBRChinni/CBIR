cam = webcam;

videoFrame = snapshot(cam);
frameSize= size(videoFrame);

videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]]);
runLoop= true;

while runLoop
    img = snapshot(cam);
    [croppedimage, bboxPoints]=myfacedetect(img);
    bboxPolygon = reshape(bboxPoints', 1, []);
    videoFrame = insertShape(img, 'Polygon', bboxPolygon, 'Linewidth', 4); 
    step(videoPlayer, videoFrame);
    runLoop= isOpen(videoPlayer);

end

clear cam;
release(videoPlayer);
clc;
