%--- Bộ lọc Butterworth HPF ---
fc = 1200;         % Tần số cắt (Hz) — THAY ĐỔI
Fs = 6000;         % Tần số lấy mẫu (Hz) — THAY ĐỔI
Nyquist = Fs / 2;
Wn = fc / Nyquist; 
N = 5;             % Bậc lọc — THAY ĐỔI

[b, a] = butter(N, Wn, 'high');

% Đáp ứng tần số
[h, w] = freqz(b, a);

figure;
plot(w/pi, abs(h));
title('Butterworth HPF - Đáp ứng biên độ');
xlabel('Tần số chuẩn hóa (\times \pi rad/mẫu)');
ylabel('Biên độ');
grid on;

figure;
plot(w/pi, angle(h));
title('Butterworth HPF - Đáp ứng pha');
xlabel('Tần số chuẩn hóa (\times \pi rad/mẫu)');
ylabel('Pha (rad)');
grid on;

% Tín hiệu chirp đầu vào
t = 0:1/Fs:1.2;     % THAY ĐỔI độ dài
f0 = 200;           % THAY ĐỔI tần số bắt đầu
f1 = 1500;          % THAY ĐỔI tần số cuối
input_signal = chirp(t, f0, t(end), f1, "linear");

% Lọc
filtered_signal = filter(b, a, input_signal);

figure;
subplot(2,1,1);
plot(t, input_signal); grid on;
title('Butterworth – Input');
xlabel('Time (s)');

subplot(2,1,2);
plot(t, filtered_signal); grid on;
title('Butterworth – Output');
xlabel('Time (s)');