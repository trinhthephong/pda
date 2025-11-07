%--- Bộ lọc Chebyshev loại I ---
fc = 900;       % THAY ĐỔI
Fs = 4800;      % THAY ĐỔI
Nyquist = Fs/2;
Wp = fc / Nyquist;
N = 3;          % THAY ĐỔI
Rp = 1.5;       % THAY ĐỔI

[b, a] = cheby1(N, Rp, Wp, 'high');

% Đáp ứng tần số
[h, w] = freqz(b, a);

figure;
plot(w/pi, abs(h));
title('Chebyshev I HPF – Đáp ứng biên độ');
xlabel('Tần số chuẩn hóa (\times \pi rad/mẫu)');
ylabel('Biên độ');
grid on;

figure;
plot(w/pi, angle(h));
title('Chebyshev I HPF – Đáp ứng pha');
xlabel('Tần số chuẩn hóa (\times \pi rad/mẫu)');
ylabel('Pha (rad)');
grid on;

% Tín hiệu chirp
t = 0:1/Fs:1.5;    % THAY ĐỔI
f0 = 150;          % THAY ĐỔI
f1 = 1200;         % THAY ĐỔI
input_signal = chirp(t, f0, t(end), f1, "quadratic");

% Lọc
filtered_signal = filter(b, a, input_signal);

figure;
subplot(2,1,1);
plot(t, input_signal); grid on;
title('Chebyshev I – Input');

subplot(2,1,2);
plot(t, filtered_signal); grid on;
title('Chebyshev I – Output');