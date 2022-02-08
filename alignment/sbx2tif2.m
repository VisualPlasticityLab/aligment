function sbx2tif2(fname,varargin)
%SBX2TIF2 converts available(1 or 2) channels of sbx file to tif files
%Argument is the number of frames to convert
%If no argument is passed the whole file is written

z = sbxread(fname,1,1);
global info;

if(nargin>1)
    N = min(varargin{1},info.max_idx);
else
    N = info.max_idx;
end

for chan=1:size(z,3)
    k = 1;
    done = 0;
    while(~done && k<=N)
        try
            q = sbxread(fname,k,1);
            q = squeeze(q(chan,:,:));
            fnametif = sprintf('%s_chan%d.tif',fname,chan);
            if(k==1)
                imwrite(q, fnametif,'tif');
            else
                imwrite(q, fnametif,'tif','writemode','append');
            end
        catch
            done = 1;
        end
        k = k+1;
    end
end