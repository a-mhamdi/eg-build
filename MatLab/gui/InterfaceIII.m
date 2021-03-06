function varargout = InterfaceIII(varargin)
% INTERFACEII MATLAB code for InterfaceII.fig
%      INTERFACEII, by itself, creates a new INTERFACEII or raises the existing
%      singleton*.
%
%      H = INTERFACEII returns the handle to a new INTERFACEII or the handle to
%      the existing singleton*.
%
%      INTERFACEII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACEII.M with the given input arguments.
%
%      INTERFACEII('Property','Value',...) creates a new INTERFACEII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterfaceII_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterfaceII_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfaceII

% Last Modified by GUIDE v2.5 09-Apr-2016 17:37:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfaceIII_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfaceIII_OutputFcn, ...
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


% --- Executes just before InterfaceII is made visible.
function InterfaceIII_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterfaceII (see VARARGIN)

% Choose default command line output for InterfaceII
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfaceII wait for user response (see UIRESUME)
% uiwait(handles.GUI3);


% --- Outputs from this function are returned to the command line.
function varargout = InterfaceIII_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MyData = cell2mat(get(handles.MyTable, 'Data'));
X = MyData(2:end, 1)-MyData(1:end-1, 1);
Y = MyData(2:end, 2)-MyData(1:end-1, 2);
Z = MyData(2:end, 3)-MyData(1:end-1, 3);
Ldev = sum(sqrt(X.^2+Y.^2+Z.^2));
set(handles.text17, 'String', Ldev);
switch findobj(get(handles.uibuttongroup1, 'selectedobject'))
   case handles.NoneTag
        axes(handles.Courbe);
        cla(handles.Courbe, 'reset');
        grid on;
    case handles.YX
        axes(handles.Courbe);
        plot(MyData(:, 1), MyData(:, 2));
        xlabel('X (mm)', 'fontname', 'Garamond', 'fontsize',10,'fontweight','b');
        ylabel('Y (mm)', 'fontname', 'Garamond', 'fontsize',10,'fontweight','b');
        grid on;
    case handles.ZX
        axes(handles.Courbe);
        plot(MyData(:, 1), MyData(:, 3));
        xlabel('X (mm)', 'fontname', 'Garamond', 'fontsize',10,'fontweight','b');
        ylabel('Z (mm)', 'fontname', 'Garamond', 'fontsize',10,'fontweight','b');
        grid on;
    case handles.ZY
        axes(handles.Courbe);
        plot(MyData(:, 3), MyData(:, 2));
        xlabel('Z (mm)', 'fontname', 'Garamond', 'fontsize',10,'fontweight','b');
        ylabel('Y (mm)', 'fontname', 'Garamond', 'fontsize',10,'fontweight','b');
        grid on;
end
set(handles.MyTable, 'Data', num2cell(MyData));

% --- Executes when entered data in editable cell(s) in MyTable.
function MyTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to MyTable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in YX.
function YX_Callback(hObject, eventdata, handles)
% hObject    handle to YX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of YX


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MyData = cell2mat(get(handles.MyTable, 'Data'));
MyData(end+1, :) = 0;
set(handles.MyTable, 'Data', num2cell(MyData));
handles.MyData = MyData;
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TData = get(handles.MyTable, 'Data');
% Get indices of selected rows
% rows = get(handles.MyTable, 'UserData')
% Create mask containing rows to keep
TData(handles.CurrentCell(:, 1), :) = [];
% Delete selected rows and re-write data
% TData = TData(mask, :);
set(handles.MyTable, 'Data', TData);


% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=get(handles.MyTable,'Data');
ColumnName=get(handles.MyTable,'ColumnName');

xlsData = Data; % , ones(size(Data, 1), 1), ones(size(Data, 2), 1));
CombData = [ColumnName'; xlsData];
FileName = uiputfile('*.xls', 'Save as');
xlswrite(FileName, CombData);


% --- Executes when selected cell(s) is changed in MyTable.
function MyTable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to MyTable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
handles.CurrentCell = eventdata.Indices;
guidata(hObject, handles);
