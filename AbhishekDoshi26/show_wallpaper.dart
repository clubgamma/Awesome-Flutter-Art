import 'dart:io';
import 'dart:math';
import 'package:toast/toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper/home.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  IconData _icons = Icons.file_download;
  bool check = false;
  int location;
  String path;
  void setWallpaper(String url, int location) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    path =
        '/storage/emulated/0/Download/Wallpapers/wallpaper_${_randomString(10)}.jpg';
    await Dio().download(
      url,
      path,
    );
    await WallpaperManager.setWallpaperFromFile(path, location);
    Navigator.pop(context);
    Toast.show('Wallpaper Set!', context, duration: Toast.LENGTH_LONG);
  }

  String _randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }

  void downloadImage(String url) async {
    setState(() {
      check = true;
    });
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    path =
        '/storage/emulated/0/Download/Wallpapers/wallpaper_${_randomString(10)}.jpg';
    await Dio().download(
      url,
      path,
    );
    Toast.show('Image downloaded in downloads folder', context,
        duration: Toast.LENGTH_LONG);
    setState(() {
      check = false;
      _icons = Icons.done;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: CachedNetworkImage(
                  imageUrl: data,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: check == false
                        ? Icon(
                            _icons,
                            color: Colors.white,
                            size: 40.0,
                          )
                        : Center(child: CircularProgressIndicator()),
                    onPressed: () => downloadImage(data),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.image),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              title: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      location = WallpaperManager.HOME_SCREEN;
                                      setWallpaper(data, location);
                                    },
                                    child: Text(
                                      "Set Home Screen Wallpaper",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      location = WallpaperManager.LOCK_SCREEN;
                                      setWallpaper(data, location);
                                    },
                                    child: Text(
                                      "Set Lock Screen Wallpaper",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      location = WallpaperManager.BOTH_SCREENS;
                                      setWallpaper(data, location);
                                    },
                                    child: Text(
                                      "Set Both!",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
