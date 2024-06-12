import 'dart:ui';
import 'package:article_app/src/core/widgets/faded/faded_container.dart';
import 'package:article_app/src/features/movies/domain/entities/content_entity.dart';
import 'package:flutter/material.dart';

class HomeHeader<T extends ContentEntity> extends StatelessWidget {
  final List<T> data;

  const HomeHeader({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 600,
          child: ListView.builder(
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => Expanded(
              child: Stack(
                children: [
                  Image.network(
                    data[index].posterPath!,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Row(
                      children: [
                        Text(
                          data[index].genreNames.first,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: FadedContainer(
                      start: 0.6,
                      end: 0.1,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 70,
          left: 16,
          child: Row(
            children: [
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
