class BoxContent {
  final int id;
  final String name;
  final int age;

  BoxContent({required this.id, required this.name, required this.age});

  factory BoxContent.fromJson(Map<String, dynamic> json) =>
      BoxContent(
          id: json['id'],
          name: json['name'],
          age: json['age']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
      };
}
