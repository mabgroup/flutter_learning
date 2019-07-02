class ImageModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  ImageModel(this.id, this.albumId, this.thumbnailUrl, this.title, this.url);

  ImageModel.fromJson(parserjson) {
    this.albumId = parserjson["albumId"];
    this.id = parserjson["id"];
    this.title = parserjson["title"];
    this.url = parserjson["url"];
    this.thumbnailUrl = parserjson["thumbnailUrl"];
  }
}
