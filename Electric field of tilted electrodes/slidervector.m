function slidervector(f,x,y,z,a,b,c)%This function is only applicable for
%the case of the potential field between two tilted electrodes
[u,v,w] = gradient(f);
quiver3(x, y, z, -u,-v, -w);
hb = uicontrol('style','slider','min',a,'max',b,'value',c);
set(hb,'position',[50 50,120,20]);
set(hb,'callback',{@changeValues});
uicontrol('style','text','string','pi/9','position',[20 50,20,20]);
uicontrol('style','text','string','pi','position',[180 50,20,20]);
function changeValues(hb,~)
    d = get(hb,'value');
    f1 = f.*c;%c is the current angle of the electrodes(current value)
    %f.*c to get rid of c in the denominator
    f2 = f1./d;%d is the new angle
    [u,v,w] = gradient(f2);
    quiver3(x, y, z, -u,-v, -w);
    
display(d);
end
end