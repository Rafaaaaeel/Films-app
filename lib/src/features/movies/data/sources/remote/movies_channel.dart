import 'package:article_app/src/core/network/constants/network_constants.dart';
import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/features/movies/data/models/movies_response_model.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/entities/movies_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_channel.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MoviesChannel {
  factory MoviesChannel(Dio dio) = _MoviesChannel;

  @GET("movie/{endpoint}")
  Future<HttpResponse<MoviesResponsModel>> fetchMovies({
    @Path('endpoint') required String endpoint,
    @Query('api_key') String? apiKey,
    @Query('language') String? language,
  });
}

class MoviesChannelDataSource {
  final Settings _settings;
  final MoviesChannel _moviesChannel;

  MoviesChannelDataSource(this._moviesChannel, this._settings);

  Future<Either<Failure, MoviesReponseEntity>> fetchMovies(
      MovieParamasEntity params) async {
    try {
      final response = await _moviesChannel.fetchMovies(
        endpoint: params.endpoint,
        apiKey: _settings.apiKey,
        language: _settings.language,
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(Failure(e.message, 500));
    }
  }
}

class MoviesLocalDataSource {
  Future<Either<Failure, MoviesReponseEntity>> fetchMovies() async {
    Future.delayed(const Duration(seconds: 2));
    return Right(MoviesResponsModel.fromJson(movieMock));
  }
}

final movieMock = {
  "dates": {"maximum": "2024-06-19", "minimum": "2024-05-08"},
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg",
      "genre_ids": [878, 12, 28],
      "id": 653346,
      "original_language": "en",
      "original_title": "Kingdom of the Planet of the Apes",
      "overview":
          "Several generations in the future following Caesar's reign, apes are now the dominant species and live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all that he has known about the past and to make choices that will define a future for apes and humans alike.",
      "popularity": 3721.151,
      "poster_path": "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
      "release_date": "2024-05-08",
      "title": "Kingdom of the Planet of the Apes",
      "video": false,
      "vote_average": 6.85,
      "vote_count": 985
    },
    {
      "adult": false,
      "backdrop_path": "/ga4OLm4qLxPqKLMzjJlqHxVjst3.jpg",
      "genre_ids": [28, 80, 53, 35],
      "id": 573435,
      "original_language": "en",
      "original_title": "Bad Boys: Ride or Die",
      "overview":
          "After their late former Captain is framed, Lowrey and Burnett try to clear his name, only to end up on the run themselves.",
      "popularity": 2585.897,
      "poster_path": "/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg",
      "release_date": "2024-06-05",
      "title": "Bad Boys: Ride or Die",
      "video": false,
      "vote_average": 7.178,
      "vote_count": 185
    },
    {
      "adult": false,
      "backdrop_path": "/qjoX7hl721FOiyeHsDkeQ6rFVLl.jpg",
      "genre_ids": [16, 10751, 18, 12, 35],
      "id": 1022789,
      "original_language": "en",
      "original_title": "Inside Out 2",
      "overview":
          "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
      "popularity": 1813.01,
      "poster_path": "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
      "release_date": "2024-06-11",
      "title": "Inside Out 2",
      "video": false,
      "vote_average": 7.218,
      "vote_count": 39
    },
    {
      "adult": false,
      "backdrop_path": "/xQkotnzv12fm9FF29if1cBLsyU3.jpg",
      "genre_ids": [53, 27, 28, 9648],
      "id": 1001311,
      "original_language": "fr",
      "original_title": "Sous la Seine",
      "overview":
          "In the Summer of 2024, Paris is hosting the World Triathlon Championships on the Seine for the first time. Sophia, a brilliant scientist, learns from Mika, a young environmental activist, that a large shark is swimming deep in the river. To avoid a bloodbath at the heart of the city, they have no choice but to join forces with Adil, the Seine river police commander.",
      "popularity": 1673.44,
      "poster_path": "/qZPLK5ktRKa3CL4sKRZtj8UlPYc.jpg",
      "release_date": "2024-06-05",
      "title": "Under Paris",
      "video": false,
      "vote_average": 5.743,
      "vote_count": 379
    },
    {
      "adult": false,
      "backdrop_path": "/z121dSTR7PY9KxKuvwiIFSYW8cf.jpg",
      "genre_ids": [10752, 28, 18],
      "id": 929590,
      "original_language": "en",
      "original_title": "Civil War",
      "overview":
          "In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.",
      "popularity": 1569.076,
      "poster_path": "/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
      "release_date": "2024-04-10",
      "title": "Civil War",
      "video": false,
      "vote_average": 7.003,
      "vote_count": 1484
    },
    {
      "adult": false,
      "backdrop_path": "/oavbmL3iddJUmC8nQjL6bLHwAP4.jpg",
      "genre_ids": [27, 53],
      "id": 719221,
      "original_language": "en",
      "original_title": "Tarot",
      "overview":
          "When a group of friends recklessly violate the sacred rule of Tarot readings, they unknowingly unleash an unspeakable evil trapped within the cursed cards. One by one, they come face to face with fate and end up in a race against death.",
      "popularity": 1194.487,
      "poster_path": "/gAEUXC37vl1SnM7PXsHTF23I2vq.jpg",
      "release_date": "2024-05-01",
      "title": "Tarot",
      "video": false,
      "vote_average": 6.44,
      "vote_count": 447
    },
    {
      "adult": false,
      "backdrop_path": "/3TNSoa0UHGEzEz5ndXGjJVKo8RJ.jpg",
      "genre_ids": [878, 28],
      "id": 614933,
      "original_language": "en",
      "original_title": "Atlas",
      "overview":
          "A brilliant counterterrorism analyst with a deep distrust of AI discovers it might be her only hope when a mission to capture a renegade robot goes awry.",
      "popularity": 1114.399,
      "poster_path": "/bcM2Tl5HlsvPBnL8DKP9Ie6vU4r.jpg",
      "release_date": "2024-05-23",
      "title": "Atlas",
      "video": false,
      "vote_average": 6.734,
      "vote_count": 716
    },
    {
      "adult": false,
      "backdrop_path": "/nv6F6tz7r61DUhE7zgHwLJFcTYp.jpg",
      "genre_ids": [10749, 35, 80],
      "id": 974635,
      "original_language": "en",
      "original_title": "Hit Man",
      "overview":
          "A mild-mannered professor moonlighting as a fake hit man in police stings ignites a chain reaction of trouble when he falls for a potential client.",
      "popularity": 888.899,
      "poster_path": "/1126gjlBf4hTm9Sgf0ox3LGVEBt.jpg",
      "release_date": "2024-05-16",
      "title": "Hit Man",
      "video": false,
      "vote_average": 6.922,
      "vote_count": 212
    },
    {
      "adult": false,
      "backdrop_path": "/H5HjE7Xb9N09rbWn1zBfxgI8uz.jpg",
      "genre_ids": [28, 35],
      "id": 746036,
      "original_language": "en",
      "original_title": "The Fall Guy",
      "overview":
          "Fresh off an almost career-ending accident, stuntman Colt Seavers has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job.",
      "popularity": 880.671,
      "poster_path": "/aBkqu7EddWK7qmY4grL4I6edx2h.jpg",
      "release_date": "2024-04-24",
      "title": "The Fall Guy",
      "video": false,
      "vote_average": 7.27,
      "vote_count": 1186
    },
    {
      "adult": false,
      "backdrop_path": "/k9X79JC2dDTcSpxuKJ3p2Teq3oZ.jpg",
      "genre_ids": [878, 28, 12],
      "id": 1025463,
      "original_language": "pt",
      "original_title": "Biônicos",
      "overview":
          "When the progress of robotics makes Paralympic athletes the new sports stars, Maria dreams of competing against her sister. For that, she will have to enter a world of crime and violence.",
      "popularity": 794.554,
      "poster_path": "/xVCYzdBE6lo3sUFK1OMZnXvpGtT.jpg",
      "release_date": "2024-05-28",
      "title": "Bionic",
      "video": false,
      "vote_average": 5.373,
      "vote_count": 63
    },
    {
      "adult": false,
      "backdrop_path": "/kti9ufHhCKaOLjg2to4RKfrlkmh.jpg",
      "genre_ids": [16, 28],
      "id": 1263421,
      "original_language": "ja",
      "original_title": "範馬刃牙VSケンガンアシュラ",
      "overview":
          "It's the ultimate showdown. The toughest fighters from \"Baki Hanma\" and \"Kengan Ashura\" clash in this unprecedented, hard-hitting martial arts crossover.",
      "popularity": 763.552,
      "poster_path": "/etbHJxil0wHvYOCmibzFLsMcl2C.jpg",
      "release_date": "2024-06-05",
      "title": "Baki Hanma VS Kengan Ashura",
      "video": false,
      "vote_average": 8.076,
      "vote_count": 112
    },
    {
      "adult": false,
      "backdrop_path": "/7v4gev91nO3i66Zzygh9jplu9UI.jpg",
      "genre_ids": [28, 12, 878],
      "id": 786892,
      "original_language": "en",
      "original_title": "Furiosa: A Mad Max Saga",
      "overview":
          "As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through the Wasteland they come across the Citadel presided over by The Immortan Joe. While the two Tyrants war for dominance, Furiosa must survive many trials as she puts together the means to find her way home.",
      "popularity": 760.748,
      "poster_path": "/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
      "release_date": "2024-05-22",
      "title": "Furiosa: A Mad Max Saga",
      "video": false,
      "vote_average": 7.631,
      "vote_count": 856
    },
    {
      "adult": false,
      "backdrop_path": "/9az3E8loGzTYazvLvoEWI7Flu3M.jpg",
      "genre_ids": [28, 53, 12],
      "id": 1108354,
      "original_language": "fr",
      "original_title": "Kali: L'ange de la Vengeance",
      "overview":
          "Lisa, aka Kali, who has nothing left to lose when she finds out her husband has been executed in Rio to cover up a corruption scandal. A former Special Forces recruit, she heads to Brazil with fists, blood and explosives, to Know the truth",
      "popularity": 513.038,
      "poster_path": "/7GC0TEOQ1ljAhtvcwdthAbb5D3h.jpg",
      "release_date": "2024-05-31",
      "title": "Kali: Avenging Angel",
      "video": false,
      "vote_average": 7.265,
      "vote_count": 34
    },
    {
      "adult": false,
      "backdrop_path": "/vWzJDjLPmycnQ42IppEjMpIhrhc.jpg",
      "genre_ids": [16, 35, 10751, 12],
      "id": 748783,
      "original_language": "en",
      "original_title": "The Garfield Movie",
      "overview":
          "Garfield, the world-famous, Monday-hating, lasagna-loving indoor cat, is about to have a wild outdoor adventure! After an unexpected reunion with his long-lost father – scruffy street cat Vic – Garfield and his canine friend Odie are forced from their perfectly pampered life into joining Vic in a hilarious, high-stakes heist.",
      "popularity": 502.943,
      "poster_path": "/p6AbOJvMQhBmffd0PIv0u8ghWeY.jpg",
      "release_date": "2024-04-30",
      "title": "The Garfield Movie",
      "video": false,
      "vote_average": 6.43,
      "vote_count": 158
    },
    {
      "adult": false,
      "backdrop_path": "/5Eip60UDiPLASyKjmHPMruggTc4.jpg",
      "genre_ids": [27, 9648, 53],
      "id": 1041613,
      "original_language": "en",
      "original_title": "Immaculate",
      "overview":
          "An American nun embarks on a new journey when she joins a remote convent in the Italian countryside. However, her warm welcome quickly turns into a living nightmare when she discovers her new home harbours a sinister secret and unspeakable horrors.",
      "popularity": 453.782,
      "poster_path": "/fdZpvODTX5wwkD0ikZNaClE4AoW.jpg",
      "release_date": "2024-03-20",
      "title": "Immaculate",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 591
    },
    {
      "adult": false,
      "backdrop_path": "/1m1rXopfNDVL3UMiv6kriYaJ3yE.jpg",
      "genre_ids": [28, 53, 80, 878],
      "id": 882059,
      "original_language": "en",
      "original_title": "Boy Kills World",
      "overview":
          "When his family is murdered, a deaf-mute named Boy escapes to the jungle and is trained by a mysterious shaman to repress his childish imagination and become an instrument of death.",
      "popularity": 433.026,
      "poster_path": "/25JskXmchcYwj3jHRmcPm738MpB.jpg",
      "release_date": "2024-04-24",
      "title": "Boy Kills World",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 273
    },
    {
      "adult": false,
      "backdrop_path": "/fKxGUfI09ubxe594Nl8Om2cMuxH.jpg",
      "genre_ids": [18, 35, 10749],
      "id": 641934,
      "original_language": "en",
      "original_title": "Am I OK?",
      "overview":
          "Lucy and Jane have been best friends for most of their lives and think they know everything there is to know about each other. But when Jane announces she's moving to London, Lucy reveals a long-held secret. As Jane tries to help Lucy, their friendship is thrown into chaos.",
      "popularity": 401.685,
      "poster_path": "/qKkaG7HVFVe7C1JuxTGwNz0eSyL.jpg",
      "release_date": "2024-06-11",
      "title": "Am I OK?",
      "video": false,
      "vote_average": 6.127,
      "vote_count": 59
    },
    {
      "adult": false,
      "backdrop_path": "/2aBDIqdSchYcPnkXqMRctRfYjSV.jpg",
      "genre_ids": [27, 53],
      "id": 1264966,
      "original_language": "en",
      "original_title": "Silence of the Prey",
      "overview":
          "In a desperate bid to secure a future for her child, an undocumented immigrant mother takes a caretaker job. Unbeknownst to her, the elderly man conceals a horrifying truth.",
      "popularity": 352.869,
      "poster_path": "/xRKmXt7036pVZ0OMNgzLsGa26pX.jpg",
      "release_date": "2024-05-14",
      "title": "Silence of the Prey",
      "video": false,
      "vote_average": 3.8,
      "vote_count": 5
    },
    {
      "adult": false,
      "backdrop_path": "/rZ8VxBH8QRHGQi9YztBRm3eAsxL.jpg",
      "genre_ids": [14, 10751],
      "id": 1279104,
      "original_language": "en",
      "original_title": "The Legend of Catclaws Mountain",
      "overview":
          "Mindy adopts Angel, a high-spirited pony that—according to legend—will lead its owner to gold hidden in the nearby mountains. When Angel is kidnapped by a mad treasure hunter, Mindy and her school friends head into the hills to rescue the pony and hunt for the lost gold. But Mindy meets a mountain man that warns her the treasure is part of an ancient curse—if they remove the gold, they'll destroy the beautiful forest.",
      "popularity": 348.671,
      "poster_path": "/4T3Gz4ZC8H6kaEpq56S4j3mI40L.jpg",
      "release_date": "2024-05-27",
      "title": "The Legend of Catclaws Mountain",
      "video": false,
      "vote_average": 4.667,
      "vote_count": 3
    },
    {
      "adult": false,
      "backdrop_path": "/oZDRuGHhe5uY8wBqFJcJZT9kdvJ.jpg",
      "genre_ids": [27, 9648, 53],
      "id": 1086747,
      "original_language": "en",
      "original_title": "The Watchers",
      "overview":
          "When 28-year-old artist Mina finds shelter after getting stranded in an expansive, untouched forest in western Ireland, she unknowingly becomes trapped alongside three strangers that are watched and stalked by mysterious creatures each night.",
      "popularity": 318.022,
      "poster_path": "/vZVEUPychdvZLrTNwWErr9xZFmu.jpg",
      "release_date": "2024-06-06",
      "title": "The Watchers",
      "video": false,
      "vote_average": 5.918,
      "vote_count": 92
    }
  ],
  "total_pages": 223,
  "total_results": 4457
};
