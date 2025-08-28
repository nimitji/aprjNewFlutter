import 'package:aprjnew/Constants/app_color.dart';
import 'package:aprjnew/GlobalUtilities/Controllers/profileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as math;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../Constants/routedart.dart';
import '../Constants/size.dart';
import '../utilities/Helpers/shimmer_effect_loader.dart';

class HotProducts extends StatelessWidget {
  const HotProducts(this.count, this.type, {Key? key}) : super(key: key);
  final int? count;
  final String? type;

  @override
  Widget build(BuildContext context) {
    final ProfileController _prod = Get.find();
    final int itemCount = math.min(count ?? 0, 4);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        itemBuilder: (context, index) {
          return HotItem(index: index, type: type);
        },
      ),
    );
  }
}

class HotItem extends StatelessWidget {
  const HotItem({
    Key? key,
    required this.index,
    this.type,
    this.height,
    this.width,
  }) : super(key: key);

  final int index;
  final String? type;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final ProfileController _prod = Get.find();
    final item = getproductslist(_prod);

    // Use LayoutBuilder so the item adapts to whatever size the grid gives it
    return LayoutBuilder(
      builder: (context, constraints) {
        // Prefer provided height/width but fall back to constraints (grid cell size)
        final double itemWidth = width ?? constraints.maxWidth;
        final double itemHeight = height ?? constraints.maxHeight;

        // Protect against infinite constraints
        final safeWidth =
            (itemWidth.isFinite && itemWidth > 0)
                ? itemWidth
                : MediaQuery.of(context).size.width / 2;
        final safeHeight =
            (itemHeight.isFinite && itemHeight > 0)
                ? itemHeight
                : getScreenHeight(120);

        return _prod.isLoading.value
            ? SizedBox(
              height: safeHeight,
              width: safeWidth,
              child: ShimmerLoader(height: safeHeight),
            )
            : InkWell(
              onTap: () async {
                Get.toNamed(AppRoute.individualprofile, arguments: "$index");
                await _prod.getindividualprofiles(id: item.id);
              },
              child: Container(
                width: safeWidth,
                height: safeHeight,
                decoration: const BoxDecoration(color: kshade5),
                child: Card(
                  color: const Color.fromARGB(255, 190, 199, 246),
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // image block sized relative to the cell height
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          height: (safeHeight * 0.65).clamp(40.0, safeHeight),
                          width: double.infinity,
                          child: Hero(
                            tag: "$index+$type",
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: FadeInImage.memoryNetwork(
                                image: item.PhotoLink1 ?? '',
                                fit: BoxFit.cover,
                                placeholder: kTransparentImage,
                                imageErrorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return Image.asset(
                                    'image/na.jpg',
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Space
                      getVerticalSpace(5),

                      // Title area uses remaining space and won't overflow
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Center(
                            child: Text(
                              item.Name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: getTextSize(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
      },
    );
  }

  dynamic getproductslist(ProfileController prod) {
    switch (type) {
      case "male":
        return prod.maleprofiles[index];
      case "female":
        return prod.femaleprofiles[index];
      case "special":
        return prod.specialProfiles[index];
      default:
        return prod.profiles[index];
    }
  }
}
