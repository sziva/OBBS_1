function utripi = QRSDetect(fileName,M, MW, MWD)

    S = load(fileName);
    velikost = size(S.val);
    x = S.val(1,:);
    d = S.val(2,:);
       
    d = detrend(d);

    figure(1);
    sigPlotX = x(1, 1:5000);
    plot(sigPlotX);
    
    figure(2);
    sigPlotY = d(1, 1:5000);
    plot(sigPlotY);
    
    %Linear High-Pass Filtering  
    y = zeros(1, length(x));
    g = zeros(1, length(d));
    for n=5:length(x)
         y(n) = x(n-((M + 1)/2)) - (sum(x((n-(M-1)):n))/M);
         g(n) = d(n-((M +1)/2)) -(sum(d((n-(M-1)):n))/M);
    end

    figure(3);
    hpPlot = y(1:5000);
    plot(hpPlot);

    %Nonlinear Low-Pass Filtering 
    for n=1:(length(y) -MW)
        y(n) = sum(y(n:n+MW).^2);
        g(n) = sum(g(n:n+MW).^2);
    end

    figure(4);
    lpPlot = y(1:5000);
    plot(lpPlot);

    %Decision-Making Stage
    alpha = 0.05; %0<= alpha <= 1
    gama = 0.15; %0.2

    for n=1:MWD:(length(y)-MWD) %premikamo se za korak okna
        if n == 1
            tresholdY = max(y(n:n+MWD));
            tresholdD = max(d(n:n+MWD));
            tresholdY = max(tresholdY, tresholdD);
        else
            [peak, maxInd] = max(y(n:n+MWD)); % da dobimo poleg vrednosti se index
            [peakD, maxIndD] = max(y(n:n+MWD));
            if peak > tresholdY
                y(maxInd + n) = 1;
                tresholdY = alpha*gama*peak+(1-alpha)*tresholdY;
            elseif peakD > tresholdY  
                y(maxInd +n) = 1;
                treshpldY = alpha*gama*peakD+(1-alpha)*tresholdY;   
            end
        end

    end
    
    utripi = find(y==1);
end