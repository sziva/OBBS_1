
file = dir('./data/*.mat');
for f = file'
    f.name
    record = strrep(f.name, 'm.mat', '');
    Detector(record);
end