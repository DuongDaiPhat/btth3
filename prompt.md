# Yêu Cầu Dự Án: Flutter Profile Page 

Đóng vai là một chuyên gia phát triển ứng dụng di động Flutter. Hãy giúp tôi tạo một dự án Flutter hoàn chỉnh với chức năng "Profile Page" tuân thủ nghiêm ngặt **Clean Architecture** và sử dụng **SQLite (sqflite)** để lưu trữ dữ liệu cục bộ.

## 1. Mô Tả Tính Năng
- Xây dựng một màn hình Profile page cơ bản với 2 phần chính: **About Me** và **Skill**.
- Mặc định, mỗi phần (card) sẽ có một icon "Add" (Thêm).
- **Hành vi:**
  - Khi người dùng bấm vào icon "Add" của thẻ **About Me** hoặc **Skill**, ứng dụng sẽ hiển thị một Pop-up (Dialog/Modal Bottom Sheet) với các Form điền thông tin tương ứng.
  - Sau khi người dùng nhập dữ liệu và lưu lại, dữ liệu sẽ được lưu vào database SQLite.
  - Phần About Me / Skill trong Profile Page sẽ tự động cập nhật và hiển thị dữ liệu đã nhập (giống như trạng thái "about me with data", "skill with data").
- Dữ liệu phải được persist (lưu giữ) giữa các lần mở lại ứng dụng.

## 2. Yêu Cầu Về UI/UX (Dựa trên UIdocs và hình ảnh thiết kế)
Hãy áp dụng chính xác các thiết kế sau vào các UI component (Card, Button, Background, Text, Icon...):
- **Icon Color:** `#130160`
- **Button Color:** `#FF9228`
- **Background Color:** `#E5E5E5` (Sử dụng làm màu nền chính của Scaffold)
- **Item/Card Color:** `#FFFFFF` (Sử dụng cho các thẻ About Me, Skill và Pop-up)
- **Border Radius:** `12` (Bo góc cho Card, TextField, Button, Pop-up)
- **Font:** `DM-Sans` (Cấu hình textTheme mặc định của toàn app sử dụng font này).

**Lưu ý cực kỳ quan trọng:** UI phải được code dựa trên các file thiết kế SVG đính kèm:
- Giao diện màn hình chính: Tham khảo `Profile Page.svg`.
- Khi người dùng bấm add About me, mở form: Tham khảo `About me Pop Up.svg`.
- Khi người dùng bấm add Skill, mở form: Tham khảo `Add Skill Pop Up.svg`.
- Giao diện sau khi đã có dữ liệu: Tham khảo `About me with data.svg` và `Skill with data.svg`.

## 3. Cấu Trúc Mã Nguồn (Clean Architecture)
Dự án phải tuân theo cấu trúc Clean Architecture cho các tính năng `about_me` và `skill`. Vui lòng chia nhỏ code thành các tầng sau:
1. **Domain Layer:** Chứa Entities và Repositories Interfaces.
2. **Data Layer:** Chứa Models, Repositories Implementations và Local Data Source (quản lý các câu lệnh CRUD của SQLite).
3. **Presentation Layer:** Chứa UI (Widgets, Pages, Pop-ups) và State Management (sử dụng Provider, Riverpod, hoặc BLoC/Cubit tùy bạn chọn, nhưng phải cấu trúc rõ ràng).

## 4. Quản Lý Thư Mục
Mã nguồn đặt trong thư mục `lib/` với cấu trúc đề xuất:
```text
lib/
 ┣ core/
 ┃ ┣ constants/ (chứa màu sắc, font chữ từ UIdocs)
 ┃ ┣ database/ (cấu hình SQLite database helper)
 ┣ features/
 ┃ ┣ profile/
 ┃ ┃ ┣ domain/
 ┃ ┃ ┣ data/
 ┃ ┃ ┣ presentation/ (chứa ProfilePage, AboutMeDialog, SkillDialog)
 ┣ main.dart
5. Yêu Cầu Đối Với Agent:
Vui lòng cung cấp nội dung cần thiết để cấu hình pubspec.yaml (ví dụ: thêm dependencies cho sqflite, path_provider, quản lý state, và Google Fonts nếu cần để tải DM-Sans).
Code cho file database helper (sqlite_database.dart) để tạo bảng about_me và skills.
Code đầy đủ cho các layer Domain và Data.
Code chi tiết cho UI UI (Presentation Layer) để hiển thị Profile Page, các Form Dialog và xử lý logic tương tác.
Code chạy được, bắt lỗi tốt và có code comment giải thích ở những đoạn cấu trúc quan trọng.