function align2tif2

fname = uigetfile('*.align','find align file');
load(fname,'m','-mat');

for chan=1:z
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