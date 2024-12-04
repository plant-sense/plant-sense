import 'package:app/components/network_loading_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String redirectTo;
  final String imageUrl;
  final int count;

  const CardWidget(
      {required this.name,
      required this.redirectTo,
      required this.imageUrl,
      this.count = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      count: count,
      offset: Offset(-0, 0),
      isLabelVisible: count > 0,
      // alignment: AlignmentDirectional.bottomStart,
      child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: NetworkLoadingImage(
                          url: imageUrl,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.grey.withAlpha(20),
                  onTap: () {
                    context.go(redirectTo);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
