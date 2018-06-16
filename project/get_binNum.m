function z = get_binNum(x,y,dx,dy,ymax,ny)

    z = (ceil(x/dx) - 1)*ny + ceil((ymax - y)/dy);
end