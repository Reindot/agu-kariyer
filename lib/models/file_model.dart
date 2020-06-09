class Files{
  final String name;
  final String url;
  final String profileURL;

  Files({this.name, this.url, this.profileURL});

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'url' : url,
      'profileURL' : profileURL,
    };
  }

  Files.fromMap(Map<String, dynamic> map):
        name = map['name'],
        url = map['url'],
        profileURL = map['profileURL'];

  @override
  String toString() {
    return 'Files{name: $name, url: $url}';
  }
}