function varargout = Home_Page(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_Page_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_Page_OutputFcn, ...
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


% --- Executes just before Home_Page is made visible.
function Home_Page_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Home_Page wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Home_Page_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
x = imread('RBM.JPG');
axes(handles.axes1);
imshow(x);



function edit1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LOGIN.
function LOGIN_Callback(hObject, eventdata, handles)
c=get(handles.edit1,'string');
username='admin';
a=get(handles.edit2,'string');
password='1234';
j=strcmp(c,username);
l=strcmp(a,password);
if l==1 & j==1
      Predict_Page
      set(Home_Page,'visible','off');
else
    msgbox('wrong pwd');
    set(handles.edit2,'string','');
end


% --- Executes on button press in EXIT.
function EXIT_Callback(hObject, eventdata, handles)
set(Home_Page,'visible','off');
