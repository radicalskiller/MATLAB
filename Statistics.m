MU = 1;
SIGMA = (10 - MU)/3;

n = 30;
n1 = 50;

medians = zeros(n1, 1);
ranges = zeros(n1, 1);
DXs = zeros(n1, 1);
MXs = zeros(n1, 1);
realDXs = zeros(n1, 1);

for i = 1:n1
    otkls = 0;
    res = zeros(n, 1);
    for j = 1:n
        res(j) = normrnd(MU,SIGMA);
        otkls = otkls + (res(j) - MU).^2;
    end
    medians(i) = median(res);
    ranges(i) = range(res);
    DXs(i) = var(res);
    MXs(i) = mean(res);
    res;
    realDXs(i) = otkls / i;
end

disp('Max median = ')
disp(max(medians))
disp('Min median = ')
disp(min(medians))
disp('Max range = ')
disp(max(ranges))
disp('Min range = ')
disp(min(ranges))


y = linspace(1, 2, length(medians));
% disp(length(y))
% disp(length(medians))
subplot (2, 2, 1), plot(y, DXs, 'r-o', y, realDXs, 'c*');
title(['DX (max = ' num2str(max(realDXs)) ', min = ' num2str(min(realDXs)) ', mean = ' num2str(mean(realDXs)) ', real = ' num2str(mean(DXs)) ')'])
xlim auto
ylim auto

subplot (2, 2, 2), plot(y, MXs, y, 1, '-*r')
title(['MX (max = ' num2str(max(MXs)) ', min = ' num2str(min(MXs)) ', mean = ' num2str(mean(MXs)) ', real = 1)'])
xlim auto
ylim auto

subplot (2, 2, 3), plot(y, DXs, 'r-o', y, realDXs, 'c*');
set(gca, 'YScale', 'log')
title(['DX (max = ' num2str(max(realDXs)) ', min = ' num2str(min(realDXs)) ', mean = ' num2str(mean(realDXs)) ', real = ' num2str(mean(DXs)) ')'])
xlim auto
ylim auto

subplot (2, 2, 4), plot(y, MXs, y, 1, '-*r')
set(gca, 'YScale', 'log')
title(['MX (max = ' num2str(max(MXs)) ', min = ' num2str(min(MXs)) ', mean = ' num2str(mean(MXs)) ', real = 1)'])
xlim auto
ylim auto
