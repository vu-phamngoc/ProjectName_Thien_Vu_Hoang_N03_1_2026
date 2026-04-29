/// Lớp miêu tả đối tượng Nhiệm vụ (Task) trong hệ thống Life RPG cho gia đình
class Task {
  String id;
  String title;
  String description;
  int expReward;
  int goldReward;
  
  // Trạng thái: 'todo' (chưa làm), 'pending' (con đã làm xong, chờ bố mẹ duyệt), 'completed' (đã duyệt)
  String status; 
  
  String? noteFromParent; // Lời nhắn hoặc nhận xét từ phụ huynh khi phê duyệt hoặc từ chối

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.expReward,
    required this.goldReward,
    this.status = 'todo',
    this.noteFromParent,
  });

  /// Phương thức con xác nhận đã làm xong, chuyển sang trạng thái chờ duyệt
  void submitForApproval() {
    if (status == 'todo') {
      status = 'pending';
      print('Nhiệm vụ "$title" đã được gửi cho phụ huynh phê duyệt.');
    }
  }

  /// Phương thức dành cho phụ huynh: Phê duyệt hoàn thành
  void approve(String note) {
    status = 'completed';
    noteFromParent = note;
    print('Phụ huynh đã phê duyệt nhiệm vụ "$title". Thưởng: $expReward EXP.');
  }

  /// Phương thức dành cho phụ huynh: Từ chối hoàn thành nếu con làm chưa tốt
  void reject(String reason) {
    status = 'todo'; // Trả về trạng thái chưa làm
    noteFromParent = reason;
    print('Phụ huynh không duyệt nhiệm vụ "$title". Lý do: $reason');
  }

  @override
  String toString() {
    return 'Task: $title | Status: $status | Reward: $expReward EXP';
  }
}