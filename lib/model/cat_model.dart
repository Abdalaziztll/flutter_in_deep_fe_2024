class ResutlModel {}

class ErrorModel extends ResutlModel{}


class CatModel extends ResutlModel {
  int? id;
  String? name;
  String? origin;
  String? temperament;
  List<String>? colors;
  String? description;
  String? image;

  CatModel(
      {this.id,
      this.name,
      this.origin,
      this.temperament,
      this.colors,
      this.description,
      this.image});

  CatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    origin = json['origin'];
    temperament = json['temperament'];
    colors = json['colors'].cast<String>();
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['origin'] = this.origin;
    data['temperament'] = this.temperament;
    data['colors'] = this.colors;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
