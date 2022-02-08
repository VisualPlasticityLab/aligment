function sbx2tifdir( varargin )
%SBX2TIFDIR Converts all the sbx files in a folder to tiff
%   Detailed explanation goes here

if(nargin>=1) % cell with filenames to be aligned
    for(i=1:length(varargin{1}))
        d(i).name = varargin{1}{i};
    end
else
    d = dir('*.sbx');
end

for(i=1:length(d))
    try
        [pathstr,dname,ext] = fileparts(d(i).name);
        sbx2tif2(dname);
        display(sprintf('Done %s',dname));
    catch
        display(sprintf('Could not convert %s',d(i).name));
    end
end
end

