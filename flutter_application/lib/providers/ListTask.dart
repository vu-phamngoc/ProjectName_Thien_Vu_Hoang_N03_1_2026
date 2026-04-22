import '../models/Task.dart';

class ListTask {
  // Biến danh sách các nhiệm vụ
  List<Task> _taskList = [];

  /// [READ] - Đọc tất cả các nhiệm vụ
  List<Task> getAllTasks() {
    return _taskList;
  }

  /// [CREATE] - Phụ huynh tạo nhiệm vụ mới cho con
  void createTask(Task newTask) {
    _taskList.add(newTask);
    print('Đã giao nhiệm vụ mới: ${newTask.title}');
  }

  /// [EDIT] - Sửa thông tin nhiệm vụ (VD: tăng phần thưởng hoặc đổi mô tả)
  bool editTask(String id, {String? newTitle, int? newExp, String? newDesc}) {
    for (var task in _taskList) {
      if (task.id == id) {
        if (newTitle != null) task.title = newTitle;
        if (newExp != null) task.expReward = newExp;
        if (newDesc != null) task.description = newDesc;
        print('Đã cập nhật nội dung nhiệm vụ ID: $id');
        return true;
      }
    }
    print('Không tìm thấy nhiệm vụ ID: $id');
    return false;
  }

  /// [READ - EXTENSION] - Lọc danh sách các nhiệm vụ đang chờ phê duyệt
  List<Task> getPendingTasks() {
    return _taskList.where((t) => t.status == 'pending').toList();
  }
}

// Chạy thử nghiệm logic
void main() {
  ListTask parentManager = ListTask();

  // 1. Phụ huynh Create nhiệm vụ
  parentManager.createTask(Task(
    id: 'T01',
    title: 'Quét nhà và lau bàn',
    description: 'Dọn dẹp phòng khách trước khi khách đến',
    expReward: 100,
    goldReward: 20
  ));

  // 2. Con làm bài và submit
  var currentTask = parentManager.getAllTasks()[0];
  currentTask.submitForApproval();

  // 3. Phụ huynh Read danh sách chờ duyệt
  var pending = parentManager.getPendingTasks();
  print('Danh sách chờ duyệt: $pending');

  // 4. Phụ huynh Approve (duyệt)
  if (pending.isNotEmpty) {
    pending.first.approve("Con làm rất sạch, tặng thêm điểm cộng!");
  }
  
  // 5. Kết quả cuối cùng
  print('Trạng thái sau cùng: ${parentManager.getAllTasks().first}');
}