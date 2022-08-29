data = readtable("cellparams-6-13-5.xls");
totalrow = height(data);
datapoint = data.Track(2);
count = 1;
x = [];
y = [];
for pointer = 2:totalrow
    hold all;
    if data.Track(pointer) == datapoint
        x(end+1) = count;
        y(end+1) = data.Deformation(pointer);
        count = count+1;
    else
        plot(x,y)
        datapoint = data.Track(pointer);
        count = 1;
        x = [];
        y = [];
    end
end
