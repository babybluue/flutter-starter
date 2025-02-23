import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/src/model/bing_image.dart';

class BingImageProvider extends ChangeNotifier {
  BingImage? _bingImage;

  BingImage? get bingImage => _bingImage;

  Future<void> fetchBingImage() async {
    final bingImg = await Dio().get(
        'https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US');
    _bingImage = BingImage.fromJson(bingImg.data['images'][0]);
    notifyListeners();
  }
}
