class TodoModel {
  int id;
  int userId;
  String title;
  bool completed;

  TodoModel({this.userId, this.id, this.title, this.completed});

  TodoModel.fromJson(Map<String, dynamic> json) {
    userId = json['id'];
    id = json['userId'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.id;
    data['id'] = this.userId;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
