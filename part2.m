function varargout = part2(varargin)
% PART2 MATLAB code for part2.fig
%      PART2, by itself, creates a new PART2 or raises the existing
%      singleton*.
%
%      H = PART2 returns the handle to a new PART2 or the handle to
%      the existing singleton*.
%
%      PART2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2.M with the given input arguments.
%
%      PART2('Property','Value',...) creates a new PART2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2

% Last Modified by GUIDE v2.5 28-May-2019 20:38:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_OutputFcn, ...
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


% --- Executes just before part2 is made visible.
function part2_OpeningFcn(hObject, eventdata, handles, varargin)
handles.flag=1;
global q;
q=0;
% This function has no outputcode args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2 (see VARARGIN)

% Choose default command line outputcode for part2
handles.outputcode = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning outputcode args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line outputcode from handles structure
varargout{1} = handles.outputcode;



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_Callback(hObject, eventdata, handles)

% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in prepare.
function prepare_Callback(hObject, eventdata, handles)
m=get(handles.m,'string');
m=str2num(m);
n=2^m-1;
k=n-m;
set(handles.n,'string',n);
set(handles.k,'string',k);
[G,H]=hamming(m);
handles.G=G;
guidata(hObject, handles);
handles.H=H;
guidata(hObject, handles);
handles.kk=k;
guidata(hObject, handles);
% hObject    handle to prepare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in encode.
function encode_Callback(hObject, eventdata, handles)
flag=handles.flag;
input=get(handles.input,'string');
input=str2num(input(:))';
bugflag=0;
if flag==1
    k=handles.kk;
    if rem(length(input),k)~=0
        outputcode='��������';
        bugflag=1;
    else
    G=handles.G;
    H=handles.H;
    ll=length(input);
    for i=1:ll/k
        input1(i,1:k)=input(i*k+1-k:i*k);
    end
    input=input1;
    outputcode1=rem(input*G,2);
    for i=1:ll/k
        if i==1
            outputcode=outputcode1(1,:);
        else 
            outputcode=[outputcode outputcode1(i,:)];
        end
    end
    end
else
    r=get(handles.r,'string');
    r=str2num(r);
    outputcode=repcode(input,r);
end
if bugflag~=1
outputcode=num2str(outputcode);
outputcode(find(isspace(outputcode)))=[];
end
haha=outputcode;
set(handles.haha,'string',haha);
% hObject    handle to encode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input as text
%        str2double(get(hObject,'String')) returns contents of input as a double


% --- Executes during object creation, after setting all properties.
function input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outputcode_Callback(hObject, eventdata, handles)

% hObject    handle to outputcode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputcode as text
%        str2double(get(hObject,'String')) returns contents of outputcode as a double


% --- Executes during object creation, after setting all properties.
function outputcode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputcode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function haha_Callback(hObject, eventdata, handles)
% hObject    handle to haha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of haha as text
%        str2double(get(hObject,'String')) returns contents of haha as a double


% --- Executes during object creation, after setting all properties.
function haha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to haha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in paint.
function paint_Callback(hObject, eventdata, handles)
global q;
q=q+1;
flag=handles.flag;
N=1e5;
pe_n=30;
pe_max=1e-1;
pe_min=1e-4;
pe_lgmax=log(pe_max);
pe_lgmin=log(pe_min);
pe_lgstep=(pe_lgmax-pe_lgmin)/(pe_n-1);
pe_lg=pe_lgmin:pe_lgstep:pe_lgmax;
pe=exp(pe_lg);
s=zeros(1,N);
for i=1:N
    if(randn(1)>0)
        s(i)=1;
    end
end
if flag==1
    G=handles.G;
    H=handles.H;
    k=handles.kk;
    s1=s;
    for i=1:k
        if rem(length(s1),k)~=0
            s1=[s1 0];
        end
    end
    s_num=length(s1)/k;
    s1=reshape(s1,s_num,k);
    s_a=rem(s1*G,2);
    n=length(G);
    E=eye(n)*H';
    for t=1:pe_n
        s_b=s_a;
        for i=1:s_num
            for j=1:n
                if(rand<pe(t))
                    s_b(i,j)=rem(s_b(i,j)+1,2);
                end
            end
        end
        S=rem(s_b*H',2);
        s_r=s_b;
        for i=1:s_num
            for j=1:n
                if(S(i,:)==E(j,:))
                    s_r(i,j)=rem(s_r(i,j)+1,2);
                end
            end
        end
        s_r=s_r(:,1:k);
        s_r=reshape(s_r,1,k*s_num);
        s_r=s_r(1:N);
        error(t)=length(find(s_r~=s));
    end
else
    r=get(handles.r,'string');
    r=str2num(r);
    s_1=repcode(s,r);
    for t=1:pe_n
        s_2=s_1;
        for i=1:length(s_1)
            if(rand<pe(t))
                s_2(i)=rem(s_1(i)+1,2);
            end
        end
        s_3=repdecode(s_2,r);
        error(t)=length(find(s_3~=s));
    end
end
figure(1)
plot(pe,error./N)
global legendshow;
if flag==1
    legendshow{q}=(['(',num2str(n),',',num2str(k),')����������']);
else
    legendshow{q}=(['(',num2str(r),',1)����������']);
end
legend(legendshow)
xlabel('�ŵ��������')
ylabel('������')
hold on
    
% hObject    handle to paint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in repeat.
function repeat_Callback(hObject, eventdata, handles)
set(handles.repeat,'value',1);
set(handles.hamming,'value',0);
handles.flag=2;
guidata(hObject, handles);

% hObject    handle to repeat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of repeat


% --- Executes on button press in hamming.
function hamming_Callback(hObject, eventdata, handles)
set(handles.repeat,'value',0);
set(handles.hamming,'value',1);
handles.flag=1;
guidata(hObject, handles);


% hObject    handle to hamming (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hamming



function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in picture.
function picture_Callback(hObject, eventdata, handles)
r=get(handles.r,'string');
r=str2num(r);
pb=get(handles.pb,'string');
pb=str2num(pb);
G=handles.G;
H=handles.H;
k=handles.kk;
n=length(G);
E=eye(n)*H';
image=imread('lena.bmp');
[s,len,wid]=image2bit(image);
s0=s;
s1=s;
for i=1:k
    if rem(length(s1),k)~=0
        s1=[s1;0];
    end
end
s_num=length(s1)/k;
s1=reshape(s1,s_num,k);
s1=rem(s1*G,2);
s1=reshape(s1,s_num*n,1);
s2=repcode(s,r);
s0_be=biterror(s0,pb);
s1_be=biterror(s1,pb);
s2_be=biterror(s2,pb);
s2_be=repdecode(s2_be,r);
s1_be=reshape(s1_be,s_num,n);
S=rem(s1_be*H',2);
s_r=s1_be;
for i=1:s_num
    for j=1:n
        if(S(i,:)==E(j,:))
            s_r(i,j)=rem(s_r(i,j)+1,2);
        end
    end
end
s_r=s_r(:,1:k);
s_r=reshape(s_r,1,k*s_num);
s1_be=s_r(1:length(s));
image0=bit2image(s0_be,len,wid);
image1=bit2image(s1_be,len,wid);
image2=bit2image(s2_be,len,wid);
hist=imhist(image);
hist0=imhist(image0);
hist1=imhist(image1);
hist2=imhist(image2);
figure(2)
subplot(2,2,1),imshow(image),title('ԭͼ')
subplot(2,2,2),imshow(image0),title('δ����')
subplot(2,2,3),imshow(image1),title(['(',num2str(n),',',num2str(k),')��'])
subplot(2,2,4),imshow(image2),title(['(',num2str(r),',1)��'])
suptitle('ͼ��')
figure(3)
subplot(2,2,1),bar(hist),xlim([0,256]),title('ԭͼ')
subplot(2,2,2),bar(hist0),xlim([0,256]),title('δ����')
subplot(2,2,3),bar(hist1),xlim([0,256]),title(['(',num2str(n),',',num2str(k),')��'])
subplot(2,2,4),bar(hist2),xlim([0,256]),title(['(',num2str(r),',1)��'])
suptitle('�Ҷ�ֱ��ͼ')



% hObject    handle to picture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function pb_Callback(hObject, eventdata, handles)
% hObject    handle to pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pb as text
%        str2double(get(hObject,'String')) returns contents of pb as a double


% --- Executes during object creation, after setting all properties.
function pb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
