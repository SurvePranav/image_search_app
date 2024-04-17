import 'package:flutter/material.dart';
import 'package:gallary_app/models/response_model.dart';
import 'package:gallary_app/utils/app_secrets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ImagesController extends GetxController {
  var images = RxList<Hit>();
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    searchController.text = 'yellow flowers';
    getImages();
  }

  Future<RxList<Hit>> getImages() async {
    try {
      final res = await http.get(Uri.parse(
          '$endUrl?key=$apiKey&q=${Uri.encodeComponent(searchController.text.trim())}&per_page=30'));

      if (res.statusCode == 200) {
        final ImageResponseModel model = imageResponseModelFromJson(res.body);
        images.clear();
        for (int i = 0; i < model.hits!.length; i++) {
          images.add(model.hits![i]);
        }
      }
      return images;
    } catch (e) {
      return images;
    }
  }
}
