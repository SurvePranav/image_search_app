import 'package:flutter/material.dart';
import 'package:gallary_app/getx/api/images_controller.dart';
import 'package:gallary_app/ui/pages/full_screen_image.dart';
import 'package:gallary_app/ui/widgets/search_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  ImagesController controller = Get.put(ImagesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MySearchBar(
            textEditingController: controller.searchController,
            onPressed: () {
              controller.getImages();
            },
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: Get.width < 360 ? 350 : 230,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 4 / 5,
            ),
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(
                      () => ImageFullScreen(
                        imageUrl: controller.images[index].largeImageUrl!,
                        tag: '${controller.images[index].id}',
                      ),
                    ),
                    child: Hero(
                      tag: '${controller.images[index].id}',
                      child: Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 254, 252),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.images[index].largeImageUrl ?? '',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            11,
                          ),
                          border: Border.all(
                            color: Colors.white24,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.remove_red_eye),
                          const SizedBox(
                            width: 2,
                          ),
                          Text('${controller.images[index].views}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.favorite),
                          const SizedBox(
                            width: 2,
                          ),
                          Text('${controller.images[index].likes}'),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ));
  }
}
