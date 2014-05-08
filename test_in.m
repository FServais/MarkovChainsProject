k = 5:20:500;
n = length(k);
alpha = zeros(1,n);


for i = 1:n
    disp(k(i))
    tic
   [alpha(i)] = test3(50, k(i), 1000, 0.5);
   toc
end

figure; 
hold on;
plot(k, alpha);
plot(k, linspace(0.5, 0.5, n));