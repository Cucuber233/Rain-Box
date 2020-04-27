class RankList {
  String imgUrl;
  List<dynamic> tracks;
  String updateFrequency;
  String name;

  RankList.fromMap(Map<String, dynamic> json){
    this.imgUrl = json['coverImgUrl'];
    this.tracks = json['tracks'];
    this.updateFrequency = json['updateFrequency'];
    this.name = json['name'];
  }
}