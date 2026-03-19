class Note {
  String? id;
  String title;
  String content;
  DateTime createdAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  Note.fromJson(Map<String, dynamic> json): 
    id = json['id'],
    title = json['title'],
    content = json['content'],
    createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'createdAt': createdAt.toIso8601String(),
  };
}