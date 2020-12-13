%M = 5;
%MW = 30;
%MWD = 160;

function utripi = QRSDetect(fileName,M, MW, MWD)

    S = load(fileName);


    x = S.val(1,:);

    figure(1);
    sigPlot = x(1, 1:5000);
    plot(sigPlot);

    %Linear High-Pass Filtering  
    y = zeros(1, length(x));
    for n=5:length(x)
         y(n) = x(n-((M + 1)/2)) - (sum(x((n-(M-1)):n))/M);
    end

    figure(2);
    hpPlot = y(1:5000);
    plot(hpPlot)

    %Nonlinear Low-Pass Filtering 
    for n=1:(length(y) -MW)
        y(n) = sum(y(n:n+MW).^2);
    end

    figure(3);
    lpPlot = y(1:5000);
    plot(lpPlot)

    %Decision-Making Stage
    alpha = 0.05; %0<= alpha <= 1
    gama = 0.15; %0.2

    for n=1:MWD:(length(y)-MWD) %premikamo se za korak okna
        n;
        if n == 1
            thresold = max(y(n:n+MWD));
        else
            [peak, maxInd] = max(y(n:n+MWD)); % da dobimo poleg vrednosti se index
            if peak > thresold
                y(maxInd + n) = 1;
                %maxInd
                %maxIndex = maxInd +n
                thresold = alpha*gama*peak+(1-alpha)*thresold;
                
            end
        end

    end
    y;
    
    utripi = find(y==1);
    %utr = y(y==1)

end