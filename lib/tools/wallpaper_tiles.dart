import 'package:flutter/material.dart';
import 'package:wallphy/download.dart';
import 'package:wallphy/wallpaper_model.dart';

Widget wallpaperTiles({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.6,
      physics: ClampingScrollPhysics(),
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Download(url: wallpaper.src.portrait),
                ),
              );
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  wallpaper.src.portrait,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
