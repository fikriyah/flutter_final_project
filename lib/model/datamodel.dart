class DataModel {
  String? image;
  String? title;
  String? description;
  String? date;
  String? author;

  DataModel({
    this.image,
    this.title,
    this.description,
    this.date,
    this.author,
  });

  DataModel.fromChannel(Map<String, dynamic> channel) {
    image = channel['image'];
    title = channel['title'];
    description = channel['description'];
    date = channel['date'];
    author = channel['author'];
  }
}
