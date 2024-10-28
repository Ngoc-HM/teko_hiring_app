# teko_hiring

TEKO APP .

## Getting Started

Để chạy một project Flutter, bạn có thể làm theo các bước hướng dẫn sau:

1. **Cài đặt Flutter**:
   - Truy cập [flutter.dev](https://flutter.dev/docs/get-started/install) và chọn phiên bản Flutter phù hợp với hệ điều hành của bạn.
   - Tải xuống và cài đặt Flutter theo hướng dẫn từ trang chủ.
   - Thêm Flutter vào biến môi trường bằng cách thêm đường dẫn thư mục `flutter/bin` vào biến PATH của hệ thống.

2. **Kiểm tra cài đặt**:
   - Mở Terminal (hoặc Command Prompt trên Windows).
   - Chạy lệnh sau để kiểm tra môi trường:
     ```bash
     flutter doctor
     ```
   - Lệnh này sẽ kiểm tra xem bạn đã cài đặt đủ công cụ và plugin cần thiết hay chưa, chẳng hạn như Android SDK, Xcode (cho iOS), Visual Studio Code (hoặc Android Studio).

3. **Clone Project App**:
   - lấy mã nguồn từ github sau : https://github.com/Ngoc-HM/teko_hiring_app.git
     ```bash
     git clone https://github.com/Ngoc-HM/teko_hiring_app.git
     cd teko_hiring_app
     ```
   - Nếu bạn đã có sẵn project, chỉ cần tải project về và mở thư mục đó trong IDE bạn chọn.

4. **Cấu hình môi trường phát triển**:
   - Nếu bạn phát triển cho Android, hãy đảm bảo Android Emulator được cài đặt và cấu hình đúng trong Android Studio.
   - Nếu bạn phát triển cho iOS, mở project trong Xcode và thiết lập cấu hình đúng cho iPhone Simulator.

5. **Chạy project trên thiết bị hoặc emulator**:
   - Đảm bảo bạn đã kết nối thiết bị vật lý hoặc mở emulator/simulator tương ứng.
   - Mở Terminal trong thư mục của project và chạy lệnh sau để chạy ứng dụng:
     ```bash
     flutter run
     ```
   - Lệnh này sẽ biên dịch và chạy ứng dụng trên thiết bị đã kết nối hoặc emulator/simulator.

6. **Build project để phát hành**:
   - Nếu bạn muốn build ứng dụng để phát hành, sử dụng lệnh:
     - Android:
       ```bash
       flutter build apk --release
       ```
     - iOS:
       ```bash
       flutter build ios --release
       ```

Nếu bạn gặp lỗi, hãy xem log lỗi trong Terminal để biết thêm chi tiết hoặc dùng lệnh `flutter doctor` để kiểm tra lại các cấu hình môi trường.