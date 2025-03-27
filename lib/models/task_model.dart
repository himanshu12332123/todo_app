
class Task {
  String id;
  String title;
  String description;
  bool completed;
  List<String> sharedWith;

  Task({
    required this.id,
     required this.title,
    required this.description,
    this.completed = false,
    this.sharedWith = const [],

  });

  factory Task.fromJson(Map<String,dynamic> json){
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      completed: json['completed'] ?? false,
      sharedWith:  List<String>.from(json['sharedWith'] ?? []),
      
      );
  }
   
    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
      'sharedWith': sharedWith,
    };
  }

  
}