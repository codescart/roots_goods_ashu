class todo {
  final int id;
  final String title;
  final String description;
  // final String date;
  // final String name;

  todo(
      {required this.id,
      required this.title,
      required this.description,
      // required this.date,
      // required this.name
      
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      // "date": date,
      // "name": name,
    };
  }

  todo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["description"];
        // date = res["date"];
        // name = res["name"];
    

  @override
  String toString() {
    return 'todo{id: $id, title: $title, description: $description,}';
  }
}
