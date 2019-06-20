function varargout = fTBA_maker(varargin)
% FTBA_MAKER MATLAB code for fTBA_maker.fig
%      FTBA_MAKER, by itself, creates a new FTBA_MAKER or raises the existing
%      singleton*.
%
%      H = FTBA_MAKER returns the handle to a new FTBA_MAKER or the handle to
%      the existing singleton*.
%
%      FTBA_MAKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FTBA_MAKER.M with the given input arguments.
%
%      FTBA_MAKER('Property','Value',...) creates a new FTBA_MAKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fTBA_maker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fTBA_maker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fTBA_maker

% Last Modified by GUIDE v2.5 20-Feb-2019 22:36:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fTBA_maker_OpeningFcn, ...
                   'gui_OutputFcn',  @fTBA_maker_OutputFcn, ...
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
addpath([cd,'\needed_code'])
global var_key;
global var_function;

% --- Executes just before fTBA_maker is made visible.
function fTBA_maker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fTBA_maker (see VARARGIN)

% Choose default command line output for fTBA_maker
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fTBA_maker wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fTBA_maker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.nii');
file_path = [PathName,FileName];
if ~isequal(FileName,0)
    set(handles.edit1,'string',file_path)
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_function.
function popupmenu_function_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global var_function;
global term;
var_key = get(handles.popupmenu_function,'value');
switch var_function
    case 1 %motor
        switch var_key
            case 1 % action execution
                txt_infor = 'Included 425 experiments, 11669 foci.';
                term = 'action';
            case 2 % finger-tapping
                txt_infor = 'Included 125 experiments, 3134 foci.';
                term = 'tapping';
        end      
    case 2 % working memory
        switch var_key
            case 1 %wm
                txt_infor = 'Included 259 experiments, 6435 foci.';
                term = 'wm';
            case 2 % n-back
                txt_infor = 'Included 117 experiments, 2159 foci.';
                term = 'nback';
        end
end
set(handles.text_info,'string',txt_infor);




% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_function contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_function


% --- Executes during object creation, after setting all properties.
function popupmenu_function_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global var_function;
var_function = get(handles.listbox1,'value');
switch var_function
    case 1 % motor
        keywords = [{'action execution'};{'finger-tapping/button press'}];
    case 2 %working memory
        keywords = [{'working memory'}; {'n-back'}];
%     case 3
%         keywords = [];
%     case 4
%         keywords = [];
end
set(handles.popupmenu_function,'string',keywords);



% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text_info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global save_mode
global groupMap
global I
hwait = waitbar(0,'nii converting，please wait>>>>');
nii_file = get(handles.edit1,'string');
atlas = maker_built1(nii_file);
load('I:\新建文件夹 (1)\CPC投影点数据\subList_total.mat');
groupMap = [];  groupSize_social  = 0;
atlas.value = zeros(size(atlas.voxel,1),1);
% for i = 1:size(subList,1)
for i = 1:2
    disp(['working on ',num2str(i),':',subList{i,1}]);
    load(['I:\新建文件夹 (1)\CPC投影点数据\',subList{i,1},'_CPC_normalized.mat'],'brain_CPC_N');
    for pnz = 1:99 
        for pal = 1:99 
            cpc_mni(pnz,pal,:) = brain_CPC_N((pnz-1)*99 + pal,:); 
        end
    end
    [label_map,atlas] =  generateCPCmap_all(cpc_mni,atlas);
    [groupMap groupSize_social] = mapAppend(groupMap,label_map,groupSize_social);
    str = ['building ',num2str(roundn(i/1.14,-1)),'%'];
    waitbar(i/114,hwait,str);
end
close(hwait);
% draw
load('color.mat')
groupMap = groupMap';
label_map = rot90(groupMap,2);
h = figure(1);
[ax2,R] = geo_brain_map_new_rot90(label_map',colormap_jet,[1200,900],'hammer','grid',1,'--');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 18 18],'PaperPositionMode', 'manual');
saveas(gcf,'temp.jpg');close(h);
axes(handles.axes1);
I = imread('temp.jpg');
imshow(I);
%savemode
save_mode = 2;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global save_mode
global term
global I
global groupMap_pre
load(['I:\新建文件夹 (1)\paper_data\',term,'_map.mat']);
groupMap_pre = label_map;
colormap_jet = hot;
colormap_jet = flipud(colormap_jet(20:60,:));
colormap_jet(1,:)= [0.99 0.99 0.99];
label_map = rot90(label_map,2);
h = figure(1);
[ax2,R] = geo_brain_map_new_rot90(label_map',colormap_jet,[1200,900],'hammer','grid',1,'--');
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 18 18],'PaperPositionMode', 'manual');
saveas(gcf,'temp.jpg');close(h);
axes(handles.axes1);
I = imread('temp.jpg');
imshow(I);
% 保存设置
save_mode = 1;

% --- Executes on button press in pushbutton_exportfigure.
function pushbutton_exportfigure_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exportfigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
[FileName,PathName] = uiputfile('*.jpg');
save_path = [PathName,FileName];
if ~isequal(FileName,0)
    imwrite(I,save_path);
end
% --- Executes on button press in pushbutton_exportmat.
function pushbutton_exportmat_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exportmat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global save_mode
global groupMap
global groupMap_pre
[FileName,PathName] = uiputfile('*.mat');
save_path = [PathName,FileName];
if ~isequal(FileName,0)
    switch save_mode
        case 1
           save(save_path,'groupMap_pre');
        case 2
           save(save_path,'groupMap'); 
    end
end
