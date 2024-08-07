import 'package:flutter/material.dart';
import 'package:article_app/src/core/widgets/faded/faded_container.dart';
import 'package:article_app/src/core/widgets/selected_index/selected_index.dart';
import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';

class HomeHeader<T extends ContentEntity> extends StatefulWidget {
  final List<T> _data;
  final int _length;
  final int Function(double, double) getIndex;

  const HomeHeader(this._data, this._length, this.getIndex, {super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(
      () {
        _currentIndex = widget.getIndex(
          _scrollController.offset,
          MediaQuery.of(context).size.width,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 600,
          child: ListView.builder(
            controller: _scrollController,
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget._length,
            itemBuilder: (context, index) => Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.network(
                        widget._data[index].posterPath!,
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
                              widget._data[index].genreNames.first,
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
                            height: 190,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget._data[index].title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      widget._data[index].genreNames.first,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey.shade400),
                                    ),
                                    Text(
                                      widget._data[index].description,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          const TextStyle(color: Colors.white),
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
                )
              ],
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
                  GestureDetector(
                    // onTap: () => BlocProvider.of<HomeBloc>(context).add(
                    //   AddToWatchListEvent(data[_currentIndex]),
                    // ),
                    child: ClipRRect(
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
                        ),
                      ),
                    ),
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
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SelectedIndex(
              numberTotalOfIndexes: widget._length,
              selected: _currentIndex,
            ),
          ),
        ),
      ],
    );
  }
}
