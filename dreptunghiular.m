T=40;%se defineste perioada
f=1/T;%se calculeaza frecventa
w=2*pi*f;%se calculeaza puslatia
pas=T/1000;%se calculeaza pasul 
t = 0:pas:4*T; %se calculeaza durata
N=50;
s=(1+square(w*t,20))/2;%se calculeaza semanlul
for n = -N:N
    C(n+N+1) = 1/T * integral(@(t)((1+square(w*t,20))/2).*exp(-1j*n*w*t),0,T) ;%se calculeaza seria Fourier Complexa
    
end
sr = 0;
for n = -N:N
    sr = sr + C(n+N+1)*exp(1j*n*w*t) ;%se reconstruieste cu ajutorul seriei Fourier semnalul initial
end
figure(1);%se reprezinta semnalul initial si cel reconstruit pe acelasi grafic
hold on
plot(t,real(sr),'-.r',t,imag(sr),'-.r');
plot(t,s);
xlabel('Timpul');
ylabel('Semnal(t) si semnal.recompus(t)');
title('Semnalul initial si cel recompus')
hold off
figure(2);%se reprezinta spectrul de amplitudini
hold on
stem((-N:N)*w,2*abs(C));
xlabel('Pulsatia w');
ylabel('Amplitudinile Ak');
title('Spectrul de Amplitudini');
hold off
