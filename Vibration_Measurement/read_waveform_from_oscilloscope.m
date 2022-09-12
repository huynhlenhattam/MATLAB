%% READ_WAVEFORM_FROM_OSCILLOSCOPE Code for communicating with an instrument. 
%  
%   This is the machine generated representation of an instrument control 
%   session using a device object. The instrument control session comprises  
%   all the steps you are likely to take when communicating with your  
%   instrument. These steps are:
%       
%       1. Instrument Connection   
%       2. Instrument Configuration and Control 
%       3. Disconnect and Clean Up 
%  
%   To run the instrument control session, type the name of the file,
%   read_waveform_from_oscilloscope, at the MATLAB command prompt.
% 
%   The file, READ_WAVEFORM_FROM_OSCILLOSCOPE.M must be on your MATLAB PATH. For additional information
%   on setting your MATLAB PATH, type 'help addpath' at the MATLAB command
%   prompt.
%
%   Example:
%       read_waveform_from_oscilloscope;
%
%   See also ICDEVICE.
%
%   Creation time: 22-Jul-2022 13:47:44 


%% Instrument Connection

% Create a VISA-USB object.
interfaceObj = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0699::0x0365::C034175::0::INSTR', 'Tag', '');

% Create the VISA-USB object if it does not exist
% otherwise use the object that was found.
if isempty(interfaceObj)
    interfaceObj = visa('NI', 'USB0::0x0699::0x0365::C034175::0::INSTR');
else
    fclose(interfaceObj);
    interfaceObj = interfaceObj(1);
end

% Create a device object. 
deviceObj = icdevice('tektronix_tds2000B.mdd', interfaceObj);

% Connect device object to hardware.
connect(deviceObj);

%% Instrument Configuration and Control

% Execute device object function(s).
groupObj = get(deviceObj, 'Waveform');
[Y,X,YUNIT,XUNIT] = invoke(groupObj, 'readwaveform', 'Channel2');

%% Disconnect and Clean Up

% The following code has been automatically generated to ensure that any
% object manipulated in TMTOOL has been properly disposed when executed
% as part of a function or script.

% Clean up all objects.
delete([deviceObj interfaceObj]);
clear groupObj;
clear deviceObj;
clear interfaceObj;

