[filename,pathname]=uigetfile('*.*','Select the Input Grayscale Image');

filewidthpath=strcat(pathname,filename);

Img=imread(filewidthpath);

faceDetector = vision.CascadeObjectDetector;

faceDetector.MergeThreshold = 10;

bboxes=faceDetector(Img);

if ~isempty(bboxes)
    Imgf = insertObjectAnnotation(Img,'rectangle',bboxes,'Face','LineWidth',3);
    imshow(Imgf)
    title('Detected faces');
    
    %%new code comes here
    
    
    
    
    
    %%end of new code%%
    
else
    position=[0 0];
    label='No face Detected';
    Imgn = insertText(Img,position,label,'FontSize',25,'BoxOpacity',1);
    imshow(Imgn)
end