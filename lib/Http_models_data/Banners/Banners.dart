
int counter = 1;

class BannersItem {

  int rank;
  String imageUrl;

  BannersItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageUrl = json['imageUrl'];
  }
}