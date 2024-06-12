import 'package:article_app/src/core/widgets/faded/faded_container.dart';
import 'package:article_app/src/core/widgets/space/horizontal/horizontal_safe.dart';
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
              child: AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 1000),
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
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data[index].title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    data[index].genreNames.first,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    data[index].description,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 16,
          right: 16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Home',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 5),
                      blurRadius: 10.0,
                      color: Color.fromARGB(110, 111, 111, 111),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const SizedBox(
                        width: 35,
                        height: 35,
                        child: FadedContainer(
                          start: 0.9,
                          end: 0.4,
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        )),
                  ),
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
