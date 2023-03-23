load tanpa_beban.txt;
data1=tanpa_beban;
[xs,ys]=size(data1);
Fs=2048;
EMG=data1(Fs:xs-Fs,1);
raw(1,:)=EMG;

%Menentukan matriks dari spectogram
nfft=512;
nL=128;
noverlap=nL/2;

%Membentuk spectogram 
[s,f,t]=spectrogram(raw(1,:),hamming(nL),noverlap,nfft,Fs,'yaxis');

%Menampilkan spectogram
figure
a_s=abs(s);
%surf(t, f , a_s , 'EdgeColor', 'none'); 
surf(t, f(1:100) , a_s(1:100,:) , 'EdgeColor', 'none'); 
grid on
axis xy; 
axis tight; 
colormap(jet); 
view(0,90);
colorbar;
cmin=10;    %min rentang dari colormap untuk power EMG
cmax=550;     %min rentang dari colormap untuk power EMG
caxis([cmin cmax])
xlabel('Waktu (detik)','FontWeight','bold');
ylabel('Frekuensi (Hz)','FontWeight','bold');
title('Spektogram  EMG');
%Mean Power Spectral
ii=25;
[xas,yas]=size(a_s(:,1));
a2=zeros(1,yas);
for i=1:40
    a1=a_s(ii,:);
    a2=a2+a1;
    ii=ii+1;
end
a2=a2/40;

figure(7)
plot(t,a2);
xlabel('Waktu (detik)','FontWeight','bold');
ylabel('Power EMG','FontWeight','bold');
title('Mean Power Spectral EMG');

%Median Frequency
ii=500;
[xas,yas]=size(a_s(:,1));
fa2=zeros(1,yas);
for i=1:40
    fa1=a_s(:,ii);
    fa2=fa2+fa1;
    ii=ii+1;
end
fa2=fa2/40;
freq = medfreq(fa2,f)
figure
plot(f,fa2);
xlabel('Frekuensi','FontWeight','bold');
ylabel('Power EMG','FontWeight','bold');
title('Median Frequency EMG');