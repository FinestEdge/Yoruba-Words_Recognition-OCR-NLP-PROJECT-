function varargout = Predict_Page(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Predict_Page_OpeningFcn, ...
                   'gui_OutputFcn',  @Predict_Page_OutputFcn, ...
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


% --- Executes just before Predict_Page is made visible.
function Predict_Page_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Predict_Page_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in LOAD_IMAGE.
function LOAD_IMAGE_Callback(hObject, eventdata, handles)
global image
[filename pathname] = uigetfile({'*.jpeg';'*.JPEG';'*.jpg';'*.JPG';'*.raw';'*.RAW';'*.gif';'*.GIF';'*.png';'*.PNG';'*.tiff';'*.TIFF'},'File Selector');
fullpathname = strcat(pathname, filename);
axes(handles.axes2);
image = imread(fullpathname);
imshow(image);

% --- Executes on button press in PREDICT.
function PREDICT_Callback(hObject, eventdata, handles)
load nynet
global image
img = imresize(image,[227 227]);
predict = classify(nynet,img)
%Upper case
if predict=='Àdá'
    set(handles.Result,'String','Àdá');
    set(handles.Result2,'String','Cutlass');
    x = imread('Cutlass.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','A cutlass is a short, broad sabre or slashing sword, with a straight or slightly curved blade sharpened on the cutting edge, and a hilt often featuring a solid cupped or basket-shaped guard.');
    
    elseif predict=='Àga'
    set(handles.Result,'String','Àga');
    set(handles.Result2,'String','Chair');
    x = imread('Chair.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Chair is a separate seat for one person, typically with a back and four legs.');
    
    elseif predict=='Ilé'
    set(handles.Result,'String','Ilé');
    set(handles.Result2,'String','House');
    x = imread('House.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','a building for human habitation, especially one that consists of a ground floor and one or more upper storeys.');
    
    elseif predict=='Ilè'
    set(handles.Result,'String','Ilè');
    set(handles.Result2,'String','Field / Land');
    x = imread('Land.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Land is the part of the earth surface that is not covered by water.');
    
    elseif predict=='Ìlύ'
    set(handles.Result,'String','Ìlύ');
    set(handles.Result2,'String','Town');
    x = imread('Town.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Town is a built-up area with a name, defined boundaries, and local government, that is larger than a village and generally smaller than a city.');
    
    elseif predict=='Ìsό'
    set(handles.Result,'String','Ìsό');
    set(handles.Result2,'String','Nail');
    x = imread('Nail.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Nail is a small metal spike with a broadened flat head, driven into wood to join things together or to serve as a hook.');
    
    elseif predict=='Ìwé'
    set(handles.Result,'String','Ìwé');
    set(handles.Result2,'String','Book');
    x = imread('Book.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Book is a written or printed work consisting of pages glued or sewn together along one side and bound in covers.');
    
    elseif predict=='Òbẹ'
    set(handles.Result,'String','Òbẹ');
    set(handles.Result2,'String','Knife');
    x = imread('Knife.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Knife ia an instrument composed of a blade fixed into a handle, used for cutting or as a weapon.');
    
    elseif predict=='Òkò'
    set(handles.Result,'String','Òkò');
    set(handles.Result2,'String','Spear');
    x = imread('Spear.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Spear is a weapon with a pointed tip, typically of steel, and a long shaft, used for thrusting or throwing.');
    
    elseif predict=='Ọkό'
    set(handles.Result,'String','Ọkό');
    set(handles.Result2,'String','Hoe');
    x = imread('Hoe.JPG');
    axes(handles.axes3);
    imshow(x);
    set(handles.Definition,'String','Hoe ia a long-handled gardening tool with a thin metal blade, used mainly for weeding');%NOt done yet
end

% --- Executes on button press in EXIT.
function EXIT_Callback(hObject, eventdata, handles)
button = questdlg('Ready to quit?','Exit Dialog','Yes','No','No');
switch button
    case 'Yes',
        disp('Exiting MATLAB')
       %delete(handle.figure1);
      delete(Predict_Page)
    case 'No',
        quit cancel;
        end


% --- Executes on button press in REFRESH.
function REFRESH_Callback(hObject, eventdata, handles)
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');
set(handles.Result, 'String', '');
set(handles.Result2, 'String', '');
set(handles.Definition, 'String', '');


% --- Executes on button press in HOME.
function HOME_Callback(hObject, eventdata, handles)
Home_Page
