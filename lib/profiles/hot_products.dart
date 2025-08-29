import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import '../Constants/app_color.dart';
import '../Constants/routedart.dart';
import '../Constants/size.dart';
import '../utilities/Helpers/shimmer_effect_loader.dart';
import '../GlobalUtilities/Controllers/profileController.dart';

class HotProducts extends StatelessWidget {
  const HotProducts(this.count, this.type, {Key? key}) : super(key: key);

  final int? count;
  final String? type;

  @override
  Widget build(BuildContext context) {
    final ProfileController _prod = Get.find();
    final int itemCount = count ?? 0;

    return SizedBox(
      height: getScreenHeight(180),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: HotItem(index: index, type: type),
          );
        },
      ),
    );
  }
}

class HotItem extends StatelessWidget {
  const HotItem({Key? key, required this.index, this.type}) : super(key: key);

  final int index;
  final String? type;

  @override
  Widget build(BuildContext context) {
    final ProfileController _prod = Get.find();
    final item = getproductslist(_prod);

    return SizedBox(
      width: getScreenHeight(120),
      child:
          _prod.isLoading.value
              ? ShimmerLoader(height: getScreenHeight(150))
              : InkWell(
                onTap: () async {
                  Get.toNamed(AppRoute.individualprofile, arguments: "$index");
                  await _prod.getindividualprofiles(id: item.id);
                },
                child: Card(
                  color: kshade2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: FadeInImage.memoryNetwork(
                            image: item.PhotoLink1 ?? '',
                            fit: BoxFit.cover,
                            placeholder: kTransparentImage,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'image/na.jpg',
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          item.Name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: getTextSize(12),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
