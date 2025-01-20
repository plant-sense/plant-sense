import 'dart:math';

import 'package:app/components/card.dart';
import 'package:app/components/network_loading_image.dart';
import 'package:app/components/themed_ink_well.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/api_garden_images_provider.dart';
import 'package:app/features/garden/providers/garden_images_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class GardenCard extends StatelessWidget {
  final Garden garden;
  final String redirectTo;

  GardenCard({required this.garden, required this.redirectTo});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      redirectTo: redirectTo,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GardenCardContent(garden: garden),
      ),
    );
  }
}

class GardenCardContent extends StatefulWidget {
  final Garden garden;
  GardenCardContent({required this.garden});

  @override
  State<GardenCardContent> createState() => _GardenCardContentState();
}

class _GardenCardContentState extends State<GardenCardContent> {
  late Future<List<String>> imagesFuture;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    imagesFuture = context
        .read<GardenImagesProvider>()
        .getImagesForGarden(widget.garden.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<List<String>>(
            future: imagesFuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData &&
                      snapshot.data!.isNotEmpty &&
                      snapshot.connectionState == ConnectionState.done) {
                    var count = snapshot.data?.length ?? 8;
                    return getImageGrid(
                      count,
                      (context, index) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data![index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    );
                  }
                  return getImageGrid(
                    8,
                    (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  );
                default:
                  return getImageGrid(
                    8,
                    (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
              }
            }),
        SizedBox(height: 8),
        Text(
          widget.garden.name,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        // Text(
        //   "location",
        //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        // ),
      ],
    );
  }

  Widget getImageGrid(int count, NullableIndexedWidgetBuilder builder) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: getByCount(count),
      itemCount: amountInGrid(count),
      itemBuilder: (context, index) => builder(context, index),
    );
  }

  int amountInGrid(int count) {
    switch (count) {
      case 1:
        return 1;
      case 2:
        return 2;
      case 3:
        return 3;
      case 4:
        return 4;
      case 5:
        return 5;
      case 6:
        return 6;
      case 7:
        return 7;
      case 8:
        return 8;
      default:
        return 8;
    }
  }

  SliverQuiltedGridDelegate getByCount(int count) {
    int crossAxisCount;
    List<QuiltedGridTile> pattern;

    switch (count) {
      case 1:
        crossAxisCount = 1;
        pattern = [QuiltedGridTile(1, 1)];
      case 2:
        crossAxisCount = 2;
        pattern = [QuiltedGridTile(1, 2), QuiltedGridTile(1, 2)];
      case 3:
        crossAxisCount = 2;
        pattern = [
          QuiltedGridTile(1, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1)
        ];
      case 5:
        crossAxisCount = 4;
        pattern = [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 2),
          QuiltedGridTile(1, 2),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(2, 2),
        ];
      case 6:
        crossAxisCount = 4;
        pattern = [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 2),
          QuiltedGridTile(1, 2),
        ];
      case 7:
        crossAxisCount = 4;
        pattern = [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 2),
          QuiltedGridTile(1, 2),
        ];
      case 8:
      default:
        crossAxisCount = 4;
        pattern = [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ];
    }

    return SliverQuiltedGridDelegate(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      repeatPattern: QuiltedGridRepeatPattern.inverted,
      pattern: pattern,
    );
  }
}
