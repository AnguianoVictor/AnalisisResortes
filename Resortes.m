function varargout = Resortes(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @Resortes_OpeningFcn, ...
                       'gui_OutputFcn',  @Resortes_OutputFcn, ...
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
% --- Executes just before Resortes is made visible.
function Resortes_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes Resortes wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    global flagUnidades val;
    flagUnidades = false; 
    set(handles.text20,'String','0.5')
    set(handles.text16,'String','3')
    set(handles.text3,'String','pulg')
    set(handles.text6,'String','lb')
    set(handles.text9,'String','pulg')
    set(handles.text12,'String','pulg')
    set(handles.text24,'String','pulg')
    set(handles.d,'Min',0.001,'Max',0.5,'SliderStep',[0.001/(0.5-0.001) 0.01],'Value',0.001)
    set(handles.Fuerza,'Min',1,'Max',150,'SliderStep',[1/(150-1) 0.1],'Value',1)
    set(handles.De,'Min',0.01,'Max',1.5,'SliderStep',[0.01/(1.50-0.01) 0.01],'Value',0.01)
    set(handles.Dm,'Min',0.5,'Max',15,'SliderStep',[0.5/(15-0.5) 0.01],'Value',0.5)
    set(handles.text4,'String','0.001');

% --- Outputs from this function are returned to the command line.
function varargout = Resortes_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;

% --- Executes on slider movement.
function d_Callback(hObject, eventdata, handles)
    value = get(hObject,'Value');
    set(handles.text4,'String',num2str(value))
    %m
    %A
    %E
    %G
    %Ks
    
    cadena = '';
    global flagUnidades val;
    
    switch val
        case 1  %Alambre de piano
            if (flagUnidades == true)     %Internacional
                valord = value/25.4;        %pulgadas
                if valord <= 0.032
                    E = 203400000000;
                    G = 82700000000;
                elseif valord > 0.032 && valord <= 0.063
                    E = 200000000000;
                    G = 81700000000;
                elseif valord > 0.063 && valord <= 0.125
                    E = 196500000000;
                    G = 8100000000;
                else
                    E = 193000000000;
                    G = 8000000000;
                end
                m = 0.145;
                A = 2211000000;
                ks = 65;
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Pa*mm^m';...
                     strcat(cadena,num2str(E)),'Pa';...
                     strcat(cadena,num2str(G)),'Pa';...
                     strcat(cadena,num2str(ks)),' '};
                 set(handles.uitable1,'Data',dat)
            else
                valord = value;
                if valord <= 0.032
                    E = 29500000;
                    G = 12000000;
                elseif valord > 0.032 && valord <= 0.063
                    E = 29000000;
                    G = 11850000;
                elseif valord > 0.063 && valord <= 0.125
                    E = 28500000;
                    G = 11750000;
                else
                    E = 28000000;
                    G = 11600000;
                end
                m = 0.145;
                A = 201000;
                ks = 65;
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Psi*pulg^m';...
                     strcat(cadena,num2str(E)),'Psi';...
                     strcat(cadena,num2str(G)),'Psi';...
                     strcat(cadena,num2str(ks)),''};
                 set(handles.uitable1,'Data',dat)
            end
        case 2  %Alambre T y R en aceite
            if (flagUnidades == true)     %Internacional
                E = 196500000000;
                G = 77200000000;
                m = 0.187;
                A = 1855000000;
                ks = 70;
                dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Pa*mm^m';...
                     strcat(cadena,num2str(E)),'Pa';...
                     strcat(cadena,num2str(G)),'Pa';...
                     strcat(cadena,num2str(ks)),' '};
                 set(handles.uitable1,'Data',dat)
            else
                E = 28500000;
                G = 11200000; 
                m = 0.187;
                A = 147000;
                ks = 70;
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Psi*pulg^m';...
                     strcat(cadena,num2str(E)),'Psi';...
                     strcat(cadena,num2str(G)),'Psi';...
                     strcat(cadena,num2str(ks)),''};
                 set(handles.uitable1,'Data',dat)
            end
        case 3  %Alambre estado duro
            if (flagUnidades == true)     %Internacional
                valord = value/25.4;        %pulgadas
                if valord <= 0.032
                    E = 198600000000;
                    G = 80700000000;
                elseif valord > 0.032 && valord <= 0.063
                    E = 197900000000;
                    G = 80000000000;
                elseif valord > 0.063 && valord <= 0.125
                    E = 197200000000;
                    G = 7930000000;
                else
                    E = 196500000000;
                    G = 78600000000;
                end
                m = 0.190;
                A = 1783000000;
                ks =65;
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Pa*mm^m';...
                     strcat(cadena,num2str(E)),'Pa';...
                     strcat(cadena,num2str(G)),'Pa';...
                     strcat(cadena,num2str(ks)),' '};
                 set(handles.uitable1,'Data',dat)
            else
                valord = value;
                if valord <= 0.032
                    E = 28800000;
                    G = 11700000;
                elseif valord > 0.032 && valord <= 0.063
                    E = 28700000;
                    G = 11600000;
                elseif valord > 0.063 && valord <= 0.125
                    E = 28600000;
                    G = 11500000;
                else
                    E = 28500000;
                    G = 11400000;
                end
                m = 0.190;
                A = 140000;
                ks = 65;
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Psi*pulg^m';...
                     strcat(cadena,num2str(E)),'Psi';...
                     strcat(cadena,num2str(G)),'Psi';...
                     strcat(cadena,num2str(ks)),''};
                 set(handles.uitable1,'Data',dat)
            end
        case 4  %Alambre al cromo vanadio
            if (flagUnidades == true)     %Internacional
                E = 203400000000;
                G = 77200000000;
                m = 0.168;
                A = 2005000000;
                ks = 70;
                dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Pa*mm^m';...
                     strcat(cadena,num2str(E)),'Pa';...
                     strcat(cadena,num2str(G)),'Pa';...
                     strcat(cadena,num2str(ks)),' '};
                 set(handles.uitable1,'Data',dat)
            else
                E = 29500000;
                G = 11200000; 
                m = 0.168;
                A = 169000;
                ks = 70;
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Psi*pulg^m';...
                     strcat(cadena,num2str(E)),'Psi';...
                     strcat(cadena,num2str(G)),'Psi';...
                     strcat(cadena,num2str(ks)),''};
                 set(handles.uitable1,'Data',dat)
            end
        case 5  %Alambre al cromo silicio
            if (flagUnidades == true)     %Internacional
                E = 203400000000;
                G = 77200000000;
                m = 0.108;
                A = 1974000000;
                ks = 70;
                dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Pa*mm^m';...
                     strcat(cadena,num2str(E)),'Pa';...
                     strcat(cadena,num2str(G)),'Pa';...
                     strcat(cadena,num2str(ks)),' '};
                 set(handles.uitable1,'Data',dat)
            else
                E = 29500000;
                G = 11200000; 
                m = 0.108;
                A = 202000;
                ks = 70;
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Psi*pulg^m';...
                     strcat(cadena,num2str(E)),'Psi';...
                     strcat(cadena,num2str(G)),'Psi';...
                     strcat(cadena,num2str(ks)),''};
                 set(handles.uitable1,'Data',dat)
            end
        case 6  %Alambre inoxidable 302
            if (flagUnidades == true)     %Internacional
                E = 193000000000;
                G = 69000000000;
                ks = 60;
                if value > 0.3 && value <= 2.5
                    m = 0.146;
                    A = 1867000000000;
                elseif value > 2.5 && value <= 5.5
                    m = 0.263;
                    A = 2065000000000;
                else
                    m = 0.478;
                    A = 2911000000000;
                end
                dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Pa*mm^m';...
                     strcat(cadena,num2str(E)),'Pa';...
                     strcat(cadena,num2str(G)),'Pa';...
                     strcat(cadena,num2str(ks)),' '};
                 set(handles.uitable1,'Data',dat)
            else
                E = 28000000;
                G = 10000000; 
                ks = 60;
                if value > 0.013 && value <= 0.1
                    m = 0.146;
                    A = 1867000000000;
                elseif value > 0.1 && value <= 0.2
                    m = 0.263;
                    A = 2065000000000;
                else
                    m = 0.478;
                    A = 2911000000000;
                end
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Psi*pulg^m';...
                     strcat(cadena,num2str(E)),'Psi';...
                     strcat(cadena,num2str(G)),'Psi';...
                     strcat(cadena,num2str(ks)),''};
                 set(handles.uitable1,'Data',dat)
            end
        case 7  %Alambre de bronce fosforado
            if (flagUnidades == true)     %Internacional
                E = 103400000000;
                G = 41400000000;
                ks = 60;
                if value > 0.1 && value <= 0.6
                    m = 0;
                    A = 1000000000000;
                elseif value > 0.6 && value <= 2
                    m = 0.028;
                    A = 913000000000;
                else
                    m = 0.064;
                    A = 932000000000;
                end
                dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Pa*mm^m';...
                     strcat(cadena,num2str(E)),'Pa';...
                     strcat(cadena,num2str(G)),'Pa';...
                     strcat(cadena,num2str(ks)),' '};
                 set(handles.uitable1,'Data',dat)
            else
                E = 15000000;
                G = 6000000; 
                ks = 60;
                if value > 0.004 && value <= 0.022
                    m = 0;
                    A = 145000;
                elseif value > 0.022 && value <= 0.075
                    m = 0.028;
                    A = 121000;
                else
                    m = 0.064;
                    A = 110000;
                end
                 dat = {strcat(cadena,num2str(m)),' ';...
                     strcat(cadena,num2str(A)),'Psi*pulg^m';...
                     strcat(cadena,num2str(E)),'Psi';...
                     strcat(cadena,num2str(G)),'Psi';...
                     strcat(cadena,num2str(ks)),''};
                 set(handles.uitable1,'Data',dat)
            end
        otherwise
    end

% --- Executes during object creation, after setting all properties.
function d_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end





% --- Executes on slider movement.
function Nt_Callback(hObject, eventdata, handles)
    val = get(hObject,'Value');
    set(handles.text16,'String',num2str(val))

% --- Executes during object creation, after setting all properties.
function Nt_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end


% --- Executes on slider movement.
function De_Callback(hObject, eventdata, handles)
    val = get(hObject,'Value');
    set(handles.text13,'String',num2str(val))

% --- Executes during object creation, after setting all properties.
function De_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end


% --- Executes on slider movement.
function Dm_Callback(hObject, eventdata, handles)
    val = get(hObject,'Value');
    set(handles.text10,'String',num2str(val))

% --- Executes during object creation, after setting all properties.
function Dm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in TipoExtremo.
function TipoExtremo_Callback(hObject, eventdata, handles)
% hObject    handle to TipoExtremo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns TipoExtremo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TipoExtremo


% --- Executes during object creation, after setting all properties.
function TipoExtremo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TipoExtremo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CondicionExtremo.
function CondicionExtremo_Callback(hObject, eventdata, handles)
% hObject    handle to CondicionExtremo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CondicionExtremo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CondicionExtremo
val = get(hObject,'Value');
switch val 
    case 1
        set(handles.text20,'String','0.5')
    case 2
        set(handles.text20,'String','0.707')
    case 3
        set(handles.text20,'String','1')
    case 4
        set(handles.text20,'String','2')
    otherwise
        set(handles.text20,'String','0')
end

% --- Executes during object creation, after setting all properties.
function CondicionExtremo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CondicionExtremo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in TipoMaterial.
function TipoMaterial_Callback(hObject, eventdata, handles)
    cadena = '<html><tr><td align=center width=9999>';
    global flagUnidades val;
    val = get(hObject,'Value');
    switch val
        case 1  %Alambre de piano
            if (flagUnidades == true)     %Internacional
                min = 0.10;
                max = 6.5;
                paso = 0.01;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
                %m
                %A
                %E
                %G
                %Ks
%                 dat = {strcat(cadena,num2str(0.145)),' ';...
%                     strcat(cadena,num2str(201)),'Kpsi * pulg^m';...
%                     1,'<html><tr><td align=center>N';...
%                     2,'Pa';...
%                     1,'N'};
%                 set(handles.uitable1,'Data',dat)
            else
                min = 0.004;
                max = 0.256;
                paso = 0.001;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            end
        case 2  %Alambre Ty R en aceite
            if (flagUnidades == true)
                min = 0.5;
                max = 12.7;
                paso = 0.01;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            else
                min = 0.02;
                max = 0.5;
                paso = 0.001;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            end
        case 3  %Alambre estado duro
            if (flagUnidades == true)
                min = 0.7;
                max = 12.7;
                paso = 0.01;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            else
                min = 0.0208;
                max = 0.5;
                paso = 0.001;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            end
        case 4  %Alambre al cromo vanadio
            if (flagUnidades == true)
                min = 0.8;
                max = 11.1;
                paso = 0.01;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            else
                min = 0.032;
                max = 0.437;
                paso = 0.0001;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            end
        case 5  %Alambre al cromo silicio
            if (flagUnidades == true)
                min = 1.6;
                max = 9.5;
                paso = 0.01;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            else
                min = 0.063;
                max = 0.375;
                paso = 0.0001;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            end
        case 6  %Alambre inoxidable 302
            if (flagUnidades == true)
                min = 0.3;
                max = 10;
                paso = 0.01;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            else
                min = 0.013;
                max = 0.40;
                paso = 0.0001;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            end
        case 7  %Alambre de bronce fosforado
            if (flagUnidades == true)
                min = 0.1;
                max = 7.5;
                paso = 0.01;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            else
                min = 0.004;
                max = 0.30;
                paso = 0.0001;
                set(handles.d,'Min',min,'Max',max,'SliderStep',[paso/(max-min) 0.01],'Value',min)
                set(handles.text4,'String',num2str(min));
            end
        otherwise
    end

% --- Executes during object creation, after setting all properties.
function TipoMaterial_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% genera ángulo 


%% Calculo de valores.
TipoResorte = get(handles.TipoExtremo,'Value');
statusVarilla = get(handles.SobreVarilla,'Value');
holgura =  str2num(get(handles.Holgura,'String'));
Dvarilla = str2num(get(handles.DiamVarilla,'String'));
d = str2num(get(handles.text4,'String'));
F =  str2num(get(handles.text7,'String'));
y =  str2num(get(handles.text10,'String'));
Zeta =  str2num(get(handles.text13,'String'));
if statusVarilla == 1
    D = Dvarilla + d + holgura;
else
    D = Dvarilla - d - holgura;
end
tableData = get(handles.uitable1, 'data');
m = str2double(tableData(1,1))
A = str2double(tableData(2,1))
E = str2double(tableData(3,1));
G = str2double(tableData(4,1));
Ks = str2double(tableData(5,1));
alfa = str2double(get(handles.text20,'String'));
[C,Kb,Sut,Ssy,K,Ts,ns,Na,Ne,Nt,Ls,Lo,p] = Calcular(TipoResorte,D,d,Zeta,F,y,A,m,G)
Di = D - d;
De = D + d;
Lc = 2.63*D/alfa;
set(handles.text19,'String',num2str(Na));
 dat = {num2str(C);...
        num2str(Nt);
        num2str(Kb);...
        num2str(Sut);...
        num2str(Ssy);...
        num2str(K);...
        num2str(Ts);...
        num2str(Ls);...
        num2str(Lo);...
        num2str(Lc);...
        num2str(p);...
        num2str(ns);...
        num2str(Di);...
        num2str(De)};
set(handles.uitable2,'Data',dat)
         
%%
global flagUnidades;
%nt = str2double((get(handles.text16,'String')));

t = 0:3*pi/100:round(Nt)*2*pi;
x = 0.5*cos(t);
y = 0.5*sin(t);

% calcula x, y, z 


% grafica 
grosor = (get(handles.d,'Value'));
if flagUnidades == true
    grosor = grosor/20;
else
    grosor = grosor;
end
axes(handles.GraphResorte)
axis off
plot3(x,y,t,'LineWidth',grosor*25);
set(handles.GraphResorte,'CameraPosition',[-5.3098 -16.7235 70.6070+round(Nt)*(24)]);
set(handles.GraphResorte,'CameraTarget',[0 0 (round(Nt)*2.5)+5]);

% --- Executes on button press in Ayuda.
function Ayuda_Callback(hObject, eventdata, handles)
% hObject    handle to Ayuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on key press with focus on Internacional and none of its controls.
function Internacional_Callback(hObject, eventdata, handles)
    global flagUnidades;
    flagUnidades = true;
    set(handles.text3,'String','mm')
    set(handles.text6,'String','N')
    set(handles.text9,'String','mm')
    set(handles.text12,'String','mm')
    set(handles.text24,'String','mm')
    set(handles.d,'Min',0.1,'Max',12.7,'SliderStep',[0.1/(12.7-0.1) 0.01],'Value',0.1)
    set(handles.text4,'String','0.1')
    

function Ingles_Callback(hObject, eventdata, handles)
    global flagUnidades;
    flagUnidades = false;
    set(handles.text3,'String','pulg')
    set(handles.text6,'String','lb')
    set(handles.text9,'String','pulg')
    set(handles.text12,'String','pulg')
    set(handles.text24,'String','pulg')
    set(handles.d,'Min',0.001,'Max',0.5,'SliderStep',[0.001/(0.5-0.001) 0.01],'Value',0.001)
    set(handles.text4,'String','0.001');
     


% --- Executes on slider movement.
function Fuerza_Callback(hObject, eventdata, handles)
% hObject    handle to Fuerza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = get(hObject,'Value');
    set(handles.text7,'String',num2str(val))

% --- Executes during object creation, after setting all properties.
function Fuerza_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fuerza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Holgura_Callback(hObject, eventdata, handles)
% hObject    handle to Holgura (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Holgura as text
%        str2double(get(hObject,'String')) returns contents of Holgura as a double


% --- Executes during object creation, after setting all properties.
function Holgura_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Holgura (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DiamVarilla_Callback(hObject, eventdata, handles)
% hObject    handle to DiamVarilla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DiamVarilla as text
%        str2double(get(hObject,'String')) returns contents of DiamVarilla as a double


% --- Executes during object creation, after setting all properties.
function DiamVarilla_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DiamVarilla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DentroVarilla.
function DentroVarilla_Callback(hObject, eventdata, handles)
% hObject    handle to DentroVarilla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DentroVarilla


if get(hObject,'Value') == 1
    set(handles.text23,'String','Diametro Agujero');
else
    set(handles.text23,'String','Diametro Varilla');
end


% --- Executes on button press in SobreVarilla.
function SobreVarilla_Callback(hObject, eventdata, handles)
% hObject    handle to SobreVarilla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SobreVarilla
if get(hObject,'Value') == 0
    set(handles.text23,'String','Diametro Agujero');
else
    set(handles.text23,'String','Diametro Varilla');
end
