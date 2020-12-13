function Detector( record )

  fileName = sprintf('./data/%sm.mat', record);
  t=cputime();
  
  M=5; %7 -> m = filter length
  MW = 10; %moving window
  MWD = 140;
  utripi = QRSDetect(fileName,M, MW, MWD);
  
  fprintf('Running time: %f\n', cputime() - t);
  %asciName = sprintf('asc/%s.asc',record);
  asciName = sprintf('data/%s.asc',record);
  fid = fopen(asciName, 'wt');
  for i=1:size(utripi,2)
      fprintf(fid,'0:00:00.00 %d N 0 0 0\n', utripi(1,i) );
  end
  fclose(fid);
end