
R = 10e3;
C = 1e-6;
ts = 1e-3; %sampling period in seconds.
wc = 1/(R*C);

function [Gdb] = H(w,wc)
w = w(:);
Gdb = 20*log(abs(1./(1+1i*w./wc)));
end

%Calculating the pulsations and the magnitude of each case
wa = logspace(0,4,10000);
wd = 2*atan((ts/2)*wa);
wp = (2/ts)*tan(wc*ts/2);
wd_adapted = (2/ts)*atan((ts/2)*wa./tan(wc*ts/2));

Gdb = H(wa, wc);
Gdb_d = H(wd, wc);
Gdb_d_adapted = H(wd_adapted, wc);

%ploting the analogic and the discret filter using the Tustin's method
figure(1)
plot(wa,Gdb,'--')
xscale("log");
hold on;

hold on;
xline(wc,'y')
plot(wd,Gdb, '.')
ylabel("gain  dB");
xlabel("pulsaion en rad/s");
hold off;
legend("Analogic filter","w_c","Discret filter (Tustin)" );
hold off;

figure(2)
plot(wa,Gdb,'--')
xlabel("gain en décibel");
ylabel("angular frequency rad/s");
xscale("log");
hold on;
xline(wc,'y')
plot(wd_adapted,Gdb_d_adapted,'.')
ylabel("Magnitude (db)");
xlabel("pulsaion rad/s");
legend("Analogic filter","w_c", "Tustin adapted");
hold off;

