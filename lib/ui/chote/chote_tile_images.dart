import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jot_notes/config/colors.dart';
import 'package:jot_notes/ui/chote/chote_image.dart';
import 'package:jot_notes/ui/chote/chote_tile.dart';

class ChoteTileImages extends ConsumerWidget {
  const ChoteTileImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chote = ref.watch(currentChoteProvider);
    if (chote.files == null || chote.files!.isEmpty) return const SizedBox();
    return GridView.count(
        crossAxisCount: chote.files!.length == 1 ? 1 : 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: chote.files!.take(4).indexed.map((indexed) {
          final idx = indexed.$1;
          final el = indexed.$2;
          Widget child = Hero(
            tag: 'gallery_image-$el',
            child: Material(
                child: chote.files!.length == 1
                    ? ChoteImage(el, alignment: Alignment.centerRight)
                    : ChoteImage(el, fit: BoxFit.cover)),
          );

          if (idx == 3 && chote.files!.length > 4) {
            child = Stack(
              fit: StackFit.expand,
              children: [
                child,
                ColoredBox(
                  color: const Color(0x88000000),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "+ ${chote.files!.length - 4}",
                      style: const TextStyle(
                          color: AacColors.white, fontSize: 28.0, height: 1.5),
                    ),
                  ),
                )
              ],
            );
          }

          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => ImageGallery(
                      chote.files!,
                      displayImage: el,
                    ),
                  )),
              child: child);
        }).toList());
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery(this.images, {super.key, this.displayImage});

  final Set<String> images;
  final String? displayImage;

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  late String currentImage;
  late final PageController pageController;

  bool visibleControls = true;

  @override
  void initState() {
    super.initState();

    currentImage = widget.displayImage ?? widget.images.first;
    pageController = PageController(
        initialPage: widget.images.toList().indexOf(currentImage));
  }

  void changeCurrentImage(String image) {
    setState(() {
      currentImage = image;
    });

    pageController.animateToPage(widget.images.toList().indexOf(currentImage),
        curve: Curves.easeInOut, duration: const Duration(milliseconds: 150));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AnimatedOpacity(
            opacity: visibleControls ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: AppBar(),
          ),
        ),
        body: GestureDetector(
          onTap: () => setState(() {
            visibleControls = !visibleControls;
          }),
          child: Column(
            children: [
              Expanded(
                child: ImageCarousel(widget.images,
                    pageController: pageController, currentImage: currentImage),
              ),
              AnimatedOpacity(
                opacity: visibleControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: ImageCarouselPagination(
                  widget.images,
                  changeCurrentImage: changeCurrentImage,
                ),
              ),
            ],
          ),
        ));
  }
}

class ImageCarousel extends StatelessWidget {
  const ImageCarousel(
    this.images, {
    super.key,
    required this.pageController,
    required this.currentImage,
  });

  final Set<String> images;
  final PageController pageController;
  final String currentImage;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: images.length,
        pageSnapping: true,
        controller: pageController,
        itemBuilder: (context, index) {
          return Hero(
              tag: 'gallery_image-$currentImage',
              child: Material(child: ChoteImage(images.elementAt(index))));
        });
  }
}

class ImageCarouselPagination extends StatelessWidget {
  const ImageCarouselPagination(
    this.images, {
    super.key,
    required this.changeCurrentImage,
  });

  final Set<String> images;
  final Function(String) changeCurrentImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: images
              .map((e) {
                return GestureDetector(
                  onTap: () => changeCurrentImage(e),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2.0, color: AacColors.primary),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: ChoteImage(
                      e,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                );
              })
              .expand((e) => [
                    e,
                    const SizedBox(
                      width: 4.0,
                    )
                  ])
              .toList(),
        ),
      ),
    );
  }
}
