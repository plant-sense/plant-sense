import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String redirectTo;

  const CardWidget({required this.name, required this.redirectTo, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                        child: Image.network(
                          "https://images.unsplash.com/photo-1529313780224-1a12b68bed16?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 200,
                                height: 100,
                                color: Colors.white,
                              ),
                            );
                          },
                        )),
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
        ));
  }
}
