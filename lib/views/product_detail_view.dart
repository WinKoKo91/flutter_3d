import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:webview_flutter/src/webview_controller.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool isFavorite = false;

  Set<Sizes> selection = <Sizes>{Sizes.mm41};

  late WebViewController _controller;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      side: const BorderSide(width: 1, color: Colors.grey),
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.redAccent : null,
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Add To Card")))
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                  child:  ModelViewer(
                    backgroundColor: Colors.transparent,
                    src: 'assets/apple_watch_series_5.glb',
                    alt: 'A 3D model of an astronaut',
                    ar: true,
                    autoRotate: true,
                    iosSrc: 'assets/apple_watch_series_5.usdz',
                    disableZoom: true,
                    onWebViewCreated: (controller) {
                      _controller = controller;

                    },

                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Apple Watch Series 5",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "1,580,000 MMK",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star_border, color: Colors.grey),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "4.9 / 5.0 ( 150 Reviews )",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

enum Sizes { mm41, mm45 }
