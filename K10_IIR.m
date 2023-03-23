load tanpa_beban.txt
load beban_berat.txt
load beban_ringan.txt
[xs1,ys1]=size(tanpa_beban);
t1 = 0:1/2000:(xs1-1)/2000;
[xs2,ys2]=size(beban_ringan);
t2 = 0:1/2000:(xs2-1)/2000;
[xs3,ys3]=size(beban_berat);
t3 = 0:1/2000:(xs3-1)/2000;
[b,a]=butter(5,[10 100]/2000);
output1 = filtfilt(b,a,tanpa_beban);
output2 = filtfilt(b,a,beban_ringan);
output3 = filtfilt(b,a,beban_berat);

% nexttile
% plot(t,tanpa_beban)
nexttile
plot(t1,output1)
nexttile
plot(t2,output2)
nexttile
plot(t3,output3)