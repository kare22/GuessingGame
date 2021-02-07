

class GameItem {
  String id;
  final String name;
  final String fileUrl;

  GameItem(this.name, this.fileUrl) {
    id = this.fileUrl;
  }
}