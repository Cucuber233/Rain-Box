// ignore: camel_case_types
class Home_item_model {
  int id;
  String name;
  String imgUrl;
  String alias;
  int playCount;

  Home_item_model.fromMap(Map<String, dynamic> json, int index){
    this.id = json['id'];
    this.name = json['name'];
    this.imgUrl = json['picUrl'];
    this.playCount = json['playCount'];
    this.alias = json[' alias'];
    if(index == 3){
      this.imgUrl = json['blurPicUrl'];
    }

  }
}