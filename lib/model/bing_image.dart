class BingImage {
  String? url;
  String? copyright;
  String? title;

  BingImage({this.url, this.copyright, this.title});

  factory BingImage.fromJson(Map<String, dynamic> json) {
    return BingImage(
      url: json['url'],
      copyright: json['copyright'],
      title: json['title'],
    );
  }
}
