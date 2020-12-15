class WallpaperModel {
  SrcModel src;
  WallpaperModel({this.src});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SrcModel.fromMap(
        jsonData["src"],
      ),
    );
  }
}

class SrcModel {
  String portrait;
  SrcModel({this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      portrait: jsonData["portrait"],
    );
  }
}
