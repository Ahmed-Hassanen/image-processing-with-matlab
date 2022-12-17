function varargout = imageProc2(varargin)
% IMAGEPROC2 MATLAB code for imageProc2.fig
%      IMAGEPROC2, by itself, creates a new IMAGEPROC2 or raises the existing
%      singleton*.
%
%      H = IMAGEPROC2 returns the handle to a new IMAGEPROC2 or the handle to
%      the existing singleton*.
%
%      IMAGEPROC2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEPROC2.M with the given input arguments.
%
%      IMAGEPROC2('Property','Value',...) creates a new IMAGEPROC2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imageProc2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imageProc2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imageProc2

% Last Modified by GUIDE v2.5 17-Dec-2022 20:15:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imageProc2_OpeningFcn, ...
                   'gui_OutputFcn',  @imageProc2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before imageProc2 is made visible.
function imageProc2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imageProc2 (see VARARGIN)

% Choose default command line output for imageProc2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imageProc2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imageProc2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in addPhoto.
function addPhoto_Callback(hObject, eventdata, handles)
% hObject    handle to addPhoto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Filename,Pathname]=uigetfile('*','File Selector');
path=strcat(Pathname,Filename);
original=imread(path);
axes(handles.axes1);
imshow(original);
setappdata(0,'current',original);
setappdata(0,'name',Filename);
setappdata(0,'original',original);


% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in toGray.
function toGray_Callback(hObject, eventdata, handles)
% hObject    handle to toGray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=getappdata(0,'current');
gray=rgb2gray(current);
setappdata(0,'current',gray);
axes(handles.axes2);
imshow(gray);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
original=getappdata(0,'original');
setappdata(0,'current',original);
axes(handles.axes2);
imshow(original);



% --- Executes on button press in histrModified.
function histrModified_Callback(hObject, eventdata, handles)
% hObject    handle to histrModified (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of histrModified
if get(hObject,'Value')
    current=getappdata(0,'current');
    axes(handles.axes2)
    imhist(current);
else
    current=getappdata(0,'current');
    axes(handles.axes2);
    imshow(current);
    
end


% --- Executes on button press in equalizing.
function equalizing_Callback(hObject, eventdata, handles)
% hObject    handle to equalizing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=getappdata(0,'current');
heq=histeq(current);
setappdata(0,'current',heq);
axes(handles.axes2);
imshow(heq);


% --- Executes on button press in verticalEdge.
function verticalEdge_Callback(hObject, eventdata, handles)
% hObject    handle to verticalEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of verticalEdge
current=getappdata(0,'current');
hmask=fspecial('sobel');
vmask=hmask';
b_v=imfilter(current,vmask);
setappdata(0,'current',b_v);
axes(handles.axes2);
imshow(b_v);
    

% --- Executes on button press in horizontalEdge.
function horizontalEdge_Callback(hObject, eventdata, handles)
% hObject    handle to horizontalEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of horizontalEdge
current=getappdata(0,'current');
hmask=fspecial('sobel');
b_h=imfilter(current,hmask);
setappdata(0,'current',b_h);
axes(handles.axes2);
imshow(b_h);


% hObject    handle to arithmeticMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of arithmeticMean

% --- Executes on button press in bothEdges.
function bothEdges_Callback(hObject, eventdata, handles)
% hObject    handle to bothEdges (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bothEdges
current=getappdata(0,'current');
hmask=fspecial('sobel');
vmask=hmask';
 b_h=imfilter(current,hmask,'replicate');
b_v=imfilter(current,vmask,'replicate');
grad=b_h+b_v;
setappdata(0,'current',grad);
axes(handles.axes2);
imshow(grad);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=getappdata(0,'current');
[baseFileName, ImageFolder] = uiputfile(); %  To get the name of the file that the user wants to save!
fullFileName = fullfile(ImageFolder, baseFileName);
imwrite(current, fullFileName);


% --- Executes on button press in sharping.
function sharping_Callback(hObject, eventdata, handles)
% hObject    handle to sharping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=getappdata(0,'current');
w=fspecial('laplacian',0);
d1=imfilter(current,w,'replicate');
sharped=current-d1;
setappdata(0,'current',sharped);
axes(handles.axes2);
imshow(sharped);



% --- Executes on button press in smoothing.
function smoothing_Callback(hObject, eventdata, handles)
% hObject    handle to smoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=getappdata(0,'current');
m=fspecial('average',[3 3]);
smoothed=imfilter(current,m,'replicate');
setappdata(0,'current',smoothed);
axes(handles.axes2);
imshow(smoothed);

% --- Executes on button press in saltAndPepperFilter.
function saltAndPepperFilter_Callback(hObject, eventdata, handles)
% hObject    handle to saltAndPepperFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saltAndPepperFilter
current=getappdata(0,'current');
if get(hObject,'Value')
    filter=medfilt2(current,[3 3]);
    setappdata(0,'current',filter);
    axes(handles.axes2);
    imshow(filter);
else  
    axes(handles.axes2);
    imshow(current);
end


% --- Executes on button press in gaussionFilter.
function gaussionFilter_Callback(hObject, eventdata, handles)
% hObject    handle to gaussionFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gaussionFilter
current=getappdata(0,'current');
if get(hObject,'Value')
    f=imgaussfilt(current);
    setappdata(0,'current',f);
    axes(handles.axes2);
    imshow(f);
else  
    axes(handles.axes2);
    imshow(current);
end




% --- Executes on button press in saltFilter.
function saltFilter_Callback(hObject, eventdata, handles)
% hObject    handle to saltFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saltFilter
%Implementation of contraHarmonic function

current=getappdata(0,'current');
filterd=imrest(current,'chmean',3,3,-1);
setappdata(0,'current',filterd);
axes(handles.axes2);
imshow(filterd);

% --- Executes on button press in pepperFilter.
function pepperFilter_Callback(hObject, eventdata, handles)
% hObject    handle to pepperFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pepperFilter
current=getappdata(0,'current');
filterd=imrest(current,'chmean',3,3,1);
setappdata(0,'current',filterd);
axes(handles.axes2);
imshow(filterd);


% --- Executes on button press in pepperNoise.
function pepperNoise_Callback(hObject, eventdata, handles)
    current=getappdata(0,'current');
    name=getappdata(0,'name');
    imwrite(current,name);
    noisy=noise(name,'salt & pepper',0.01,0.0);
    setappdata(0,'current',noisy);
    axes(handles.axes2);
    imshow(noisy);



% hObject    handle to pepperNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pepperNoise


% --- Executes on button press in saltAndPepperNoise.
function saltAndPepperNoise_Callback(hObject, eventdata, handles)
    current=getappdata(0,'current');
    name=getappdata(0,'name');
    imwrite(current,name);
    noisy=noise(name,'salt & pepper',0.01,0.01);
    setappdata(0,'current',noisy);
    axes(handles.axes2);
    imshow(noisy);


% hObject    handle to saltAndPepperNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saltAndPepperNoise


% --- Executes on button press in gaussionNoise.
function gaussionNoise_Callback(hObject, eventdata, handles)
    current=getappdata(0,'current');
    noisy=imnoise(current,'gaussian'); 
    setappdata(0,'current',noisy)
    axes(handles.axes2)
    imshow(noisy)
% hObject    handle to gaussionNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gaussionNoise


% --- Executes on button press in saltNoise.
function saltNoise_Callback(hObject, eventdata, handles)
    current=getappdata(0,'current');
    name=getappdata(0,'name');
    imwrite(current,name);
    noisy=noise(name,'salt & pepper',0.0,0.01);
    setappdata(0,'current',noisy);
    axes(handles.axes2);
    imshow(noisy);



% hObject    handle to saltNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saltNoise


% --- Executes on button press in geometricFilter.
function geometricFilter_Callback(hObject, eventdata, handles)
    current=getappdata(0,'current');  
    filterd=imrest(current,'geomean');
    setappdata(0,'current',filterd);
    axes(handles.axes2);
    imshow(filterd)

% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14


% --- Executes on button press in arithmeticMean.
function arithmeticMean_Callback(hObject, eventdata, handles)
    current=getappdata(0,'current'); 
    h=imrest(current,'amean',3,3);
    setappdata(0,'current',h);
    axes(handles.axes2);
    imshow(h)



% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton19
current=getappdata(0,'current');
filterd=imrest(current,'hmean',3,3);
    setappdata(0,'current',filterd);
    axes(handles.axes2);
    imshow(filterd);


% --- Executes on button press in minFilter.
function minFilter_Callback(hObject, eventdata, handles)
% hObject    handle to minFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minFilter
current=getappdata(0,'current');
filterd=ordfilt2(current,1,ones(3,3));
    setappdata(0,'current',filterd);
    axes(handles.axes2);
    imshow(filterd);


% --- Executes on button press in maxFilter.
function maxFilter_Callback(hObject, eventdata, handles)
% hObject    handle to maxFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of maxFilter
current=getappdata(0,'current');
filterd=ordfilt2(current,9,ones(3,3));
    setappdata(0,'current',filterd);
    axes(handles.axes2);
    imshow(filterd);


% --- Executes on button press in medianFilter.
function medianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to medianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of medianFilter
current=getappdata(0,'current');
filterd=medfilt2(current,[3 3],'symmetric');
setappdata(0,'current',filterd);
axes(handles.axes2);
imshow(filterd);


% --- Executes on button press in weightedFilter.
function weightedFilter_Callback(hObject, eventdata, handles)
% hObject    handle to weightedFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of weightedFilter
current=getappdata(0,'current');
w= [1 2 1; 2 4 2; 1 2 1]*(1/16);

filterd=imfilter(current,w);
    setappdata(0,'current',filterd);
    axes(handles.axes2);
    imshow(filterd);


% --- Executes on button press in plus.
function plus_Callback(hObject, eventdata, handles)
% hObject    handle to plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=getappdata(0,'current');
[m n]=size(current);
y=current;
for i=1:m
   for j=1:n
     if y(i,j)<235   
       y(i,j)=y(i,j)+20;
     else
       y(i,j)=255;
     end
   end
end
    setappdata(0,'current',y);
    axes(handles.axes2);
    imshow(y);

% --- Executes on button press in minus.
function minus_Callback(hObject, eventdata, handles)
% hObject    handle to minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current=getappdata(0,'current');
[m n]=size(current);
y=current;
for i=1:m
   for j=1:n
     if y(i,j)>20   
       y(i,j)=y(i,j)-20;
     else
       y(i,j)=0;
     end
   end
end
    setappdata(0,'current',y);
    axes(handles.axes2);
    imshow(y);

