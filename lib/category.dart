import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallphy/tools/data.dart';
import 'package:wallphy/tools/wallpaper_tiles.dart';
import 'package:wallphy/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Category extends StatefulWidget {
  final String category;
  Category({this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<WallpaperModel> wallpapers = new List();

  getSearchWallpapers() async {
    var response = await http.get(
        'https://api.pexels.com/v1/search?query=${widget.category}&per_page=20',
        headers: {'Authorization': apiKEY});
    print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: ColorizeAnimatedTextKit(
            onTap: () {
              print("Tap Event");
            },
            text: [
              "Wallphy",
              "Wallphy",
              "Wallphy",
            ],
            textStyle: GoogleFonts.indieFlower(
              textStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Horizon",
              ),
            ),
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.yellow,
              Colors.red,
            ],
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              wallpaperTiles(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
