function align2tif

fname = uigetfile('*.align','find align file');
load(fname,'m','-mat');

N=size(m,3)
k = 1;
done = 0;
fnametif = sprintf('%s_100mm.tif',strtok(fname,'.'));

while(~done && k<=N)
    try
        q = squeeze(m(201:300,301:400,k));
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
