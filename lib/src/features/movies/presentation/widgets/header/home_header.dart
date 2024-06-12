import 'package:article_app/src/features/movies/domain/entities/content_entity.dart';
import 'package:flutter/material.dart';

class HomeHeader<T extends ContentEntity> extends StatelessWidget {
  final T data;

  const HomeHeader({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              data.posterPath!,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
