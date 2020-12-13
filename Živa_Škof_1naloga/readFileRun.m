file = dir('./data/*.mat');
for f = file'
    record = strrep(f.name, 'm.mat', '');
    Detector(record);
end