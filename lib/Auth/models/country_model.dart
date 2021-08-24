class CountryModel{
  String id;
  String name;
  List<dynamic>cities;

  CountryModel(this.name, this.cities);
  CountryModel.fromMap(Map map){
    this.id=map['id'];
    this.name=map['name'];
    this.cities=map['cities'];



  }
}