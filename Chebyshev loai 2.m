%--- Bộ lọc Chebyshev loại II ---
fc = 700;      % THAY ĐỔI
Fs = 3500;     % THAY ĐỔI
Nyquist = Fs/2;
Wp = fc / Nyquist;
N = 5;         % THAY ĐỔI
Rs = 25;       % THAY ĐỔI

[b, a] = cheby2(N, Rs, Wp, 'high');

[h, w] = freqz(b, a);

figure;
plot(w/pi, abs(h));
title('Chebyshev II HPF – Đáp ứng biên độ');
xlabel('Tần số chuẩn hóa (\times \pi rad/mẫu)');
ylabel('Biên độ');
grid on;

figure;
plot(w/pi, angle(h));
title('Chebyshev II HPF – Đáp ứng pha');
xlabel('Tần số chuẩn hóa (\times \pi rad/mẫu)');
ylabel('Pha (rad)');
grid on;

% Tín hiệu chirp
t = 0:1/Fs:1;     % THAY ĐỔI
f0 = 100;         % THAY ĐỔI
f1 = 1000;        % THAY ĐỔI
input_signal = chirp(t, f0, t(end), f1, "linear");

% Lọc
filtered_signal = filter(b, a, input_signal);

figure;
subplot(2,1,1);
plot(t, input_signal); grid on;
title('Chebyshev II – Input');

subplot(2,1,2);
plot(t, filtered_signal); grid on;
title('Chebyshev II – Output');