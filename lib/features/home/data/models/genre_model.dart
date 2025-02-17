class GenreModel{
  String? name;
  int? id;

  GenreModel(this.name,this.id);

  GenreModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

}