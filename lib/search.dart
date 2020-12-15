import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallphy/tools/data.dart';
import 'package:wallphy/tools/wallpaper_tiles.dart';
import 'package:http/http.dart' as http;
import 'package:wallphy/wallpaper_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Search extends StatefulWidget {
  final String data;
  Search({this.data});
  static String id = 'search_screen';
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchControl = new TextEditingController();
  List<WallpaperModel> wallpapers = new List();

  @override
  void initState() {
    searchControl.text = widget.data;
    getSearchWallpapers();
    super.initState();
  }

  getSearchWallpapers() async {
    var response = await http.get(
        'https://api.pexels.com/v1/search?query=${widget.data}&per_page=20',
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
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: searchControl,
                        decoration: InputDecoration(
                          hintText: 'Search Wallpapers',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(
                              data: searchControl.text,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  ],
                ),
              ),
              wallpaperTiles(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
