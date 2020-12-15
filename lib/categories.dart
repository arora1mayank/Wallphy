import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallphy/tools/category_tile.dart';
import 'package:wallphy/tools/category_model.dart';
import 'package:wallphy/tools/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallphy/tools/wallpaper_tiles.dart';
import 'package:wallphy/wallpaper_model.dart';
import 'search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Categories extends StatefulWidget {
  static String id = 'category_screen';
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  TextEditingController searchControl = new TextEditingController();
  List<CategoryModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();

  getTrendingWallpapers() async {
    var response = await http.get(
        'https://api.pexels.com/v1/curated?per_page=20&page=1',
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
    categories = getCategories();
    getTrendingWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
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
              SizedBox(
                height: 0.0,
              ),
              Text(
                'Wallpapers by Pexels',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 80.0,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        title: categories[index].categoryName,
                        imgUrl: categories[index].imgUrl,
                      );
                    }),
              ),
              wallpaperTiles(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
