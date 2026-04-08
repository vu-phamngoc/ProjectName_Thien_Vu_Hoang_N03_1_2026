# KẾ HOẠCH CHI TIẾT – ĐỀ TÀI “LIFE RPG – BIẾN CUỘC SỐNG THÀNH GAME”
1️⃣ Tên đề tài

Life RPG – Biến cuộc sống thành game có tính cộng đồng

2️⃣ Mục tiêu đề tài
Xây dựng ứng dụng quản lý công việc hàng ngày theo cơ chế gamification (game hóa).
Tạo động lực hoàn thành công việc thông qua hệ thống EXP, level, achievement.
Kết nối cộng đồng người dùng bằng các tính năng Friend System, Leaderboard, Activity Feed.
Học và thực hành Flutter + Firebase theo hướng thực tiễn.
3️⃣ Đối tượng người dùng
Sinh viên, người đi làm, người muốn cải thiện thói quen.
Những người muốn vừa quản lý công việc, vừa có động lực “cày EXP” như game.
4️⃣ Phạm vi nghiên cứu / triển khai
Frontend: Flutter
Backend: Firebase Authentication + Firestore
Tính năng chính:
Quản lý nhiệm vụ (Task Management)
Hệ thống EXP và Level
Achievement (Thành tựu)
Daily Quest (nhiệm vụ hằng ngày)
Friend System (kết bạn)
Leaderboard (bảng xếp hạng)
Activity Feed (bảng tin hoạt động)
5️⃣ Kế hoạch triển khai chi tiết theo tuần
Tuần	Công việc	Kết quả dự kiến
1	Nghiên cứu tài liệu, tìm hiểu Flutter và Firebase	Hiểu cơ bản về Flutter, Firebase, xác định kiến trúc app
2	Thiết kế UI/UX sơ bộ: Home, Task, Profile, Feed	Wireframe và mockup cơ bản
3	Xây dựng cơ sở dữ liệu trên Firestore: Users, Tasks, Achievements	Database ready, chuẩn bị backend cho dev
4	Code Task Management + EXP + Level + Achievement	Task có thể add, complete, nhận EXP và lên level
5	Tích hợp Daily Quest + Reward system	Nhiệm vụ hàng ngày, tính điểm và cập nhật achievement
6	Code Friend System + Leaderboard	Thêm bạn, chấp nhận lời mời, hiển thị top user
7	Code Activity Feed + Public Profile	Feed hiển thị hoạt động bạn bè, profile hiển thị thông tin user
8	Tinh chỉnh UI/UX, thêm animation Level Up, EXP bar	App đẹp mắt, mượt mà
9	Kiểm thử toàn bộ chức năng (debug)	App ổn định, fix lỗi
10	Chuẩn bị báo cáo, slide thuyết trình, demo	Hoàn thiện báo cáo và chuẩn bị nộp/thuyết trình
6️⃣ Kiến trúc hệ thống
6.1. Tầng ứng dụng (Flutter App)
UI Layer: Home, Task, Feed, Profile, Leaderboard
Business Logic: EXP, Level, Achievement, Challenge, Friend logic
State Management: Provider / Riverpod
6.2. Tầng dữ liệu (Firebase)
Authentication: quản lý user
Firestore: lưu Users, Tasks, Achievements, Friends, Activities, Challenges
Realtime: cập nhật dữ liệu theo thời gian thực
7️⃣ Database Design (Firestore)
Users: userId, name, exp, level, avatar
Tasks: taskId, userId, title, difficulty, isCompleted, createdAt
Friends: userId, friendId, status
Activities: activityId, userId, type, content, timestamp
Challenges: challengeId, title, goal, reward
UserChallenges: userId, challengeId, progress, isCompleted
8️⃣ Luồng hoạt động chính
User hoàn thành task → cập nhật Task → tính EXP → update User → check Achievement → tạo Activity → update UI.
User thêm bạn → gửi lời mời → accept → cập nhật Friend List.
Leaderboard: query Users theo EXP → hiển thị top.
Activity Feed: query Activities → filter theo friend → hiển thị timeline.
9️⃣ Tính năng nâng cao (tùy chọn để đạt điểm cao)
Dark Mode
Notification nhắc nhở task
Animation Level Up / EXP bar
Smart suggestion: gợi ý task dựa trên thói quen
🔟 Kết quả dự kiến
App Life RPG có tính gamification + cộng đồng.
Học sinh / sinh viên / người dùng thử sẽ thấy động lực làm việc tăng lên.
Báo cáo và slide trình bày có sơ đồ hệ thống, mockup UI, và flow hoạt động đầy đủ.
