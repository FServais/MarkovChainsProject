clear all;
clc;
m = [50:50:500 500:100:2500 2500:200:5000 5000:500:10000];
length(m)

E_mean = zeros(1, length(m));
E_std = zeros(1, length(m));

Eq_mean = zeros(1, length(m));
Eq_std = zeros(1, length(m));

tic
for i = 1:length(m)
    tic;
    disp(m(i))
   [~, ~, E_mean(i), E_std(i), Eq_mean(i), Eq_std(i), ~] = ...
                testQ212(50, m(i), 50);
    toc
end
toc
%%
figure;
hold on;
plot(m, E_mean, 'k');
plot(m, E_mean + E_std, 'b');
plot(m, E_mean - E_std, 'r');

figure;
hold on;
plot(m, Eq_mean, 'k');
plot(m, Eq_mean + Eq_std, 'b');
plot(m, Eq_mean - Eq_std, 'r');

