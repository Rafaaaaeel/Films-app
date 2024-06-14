import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/features/home/data/models/series_response_model.dart';
import 'package:article_app/src/features/home/domain/entities/serie_response_entity.dart';
import 'package:dartz/dartz.dart';

class SeriesLocalDatasource {
  Future<Either<Failure, SeriesResponseModel>> fetchMovies() async {
    Future.delayed(const Duration(seconds: 2));
    return Right(SeriesResponseModel.fromJson(seriesMock));
  }
}

final seriesMock = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/dasgPx3OgkxHSQyncKlApfZkpi2.jpg",
      "genre_ids": [10767, 10763],
      "id": 224,
      "origin_country": ["GB"],
      "original_language": "en",
      "original_name": "Match of the Day",
      "overview":
          "BBC's football highlights and analysis.\n\n\"The longest-running football television programme in the world\" as recognised by Guinness World Records in 2015.",
      "popularity": 4773.169,
      "poster_path": "/aA25JrHXj8ZPTJYj2iSIueyb34C.jpg",
      "first_air_date": "1964-08-22",
      "name": "Match of the Day",
      "vote_average": 7.271,
      "vote_count": 35
    },
    {
      "adult": false,
      "backdrop_path": "/9daf0KXr3xUkMt2NCI0ZhDIZJEa.jpg",
      "genre_ids": [10766],
      "id": 12415,
      "origin_country": ["ZA"],
      "original_language": "af",
      "original_name": "Egoli: Place of Gold",
      "overview":
          "A South African television soap opera created by Franz Marx which revolves around the daily ups, downs, trials and tribulations of a handful of families in and around Johannesburg (which is often referred to as eGoli - the City of Gold)",
      "popularity": 4515.068,
      "poster_path": "/5X0SWyNJ5IjN9YSXlbHBOVMzh1G.jpg",
      "first_air_date": "1992-04-06",
      "name": "Egoli: Place of Gold",
      "vote_average": 7,
      "vote_count": 3
    },
    {
      "adult": false,
      "backdrop_path": "/q8fmM50In8xGVW0iYoENPa71kAA.jpg",
      "genre_ids": [10764],
      "id": 1636,
      "origin_country": ["GB"],
      "original_language": "en",
      "original_name": "Top of the Pops",
      "overview":
          "The biggest stars, the most iconic performances, the most outrageous outfits – it’s Britain’s number one pop show.",
      "popularity": 4275.313,
      "poster_path": "/jjfTTjVYWyD6rGHVbnC44IrsJ7P.jpg",
      "first_air_date": "1964-01-01",
      "name": "Top of the Pops",
      "vote_average": 6.613,
      "vote_count": 31
    },
    {
      "adult": false,
      "backdrop_path": "/3SWOj8ydFrxiuZdLg63fDAt4jYR.jpg",
      "genre_ids": [10764],
      "id": 11366,
      "origin_country": ["GB"],
      "original_language": "en",
      "original_name": "Big Brother",
      "overview":
          "A British reality television game show in which a number of contestants live in an isolated house for several weeks, trying to avoid being evicted by the public with the aim of winning a large cash prize at the end of the run.",
      "popularity": 4225.522,
      "poster_path": "/p7lsmCU5ZqaMGKZAuZMkFc02X8o.jpg",
      "first_air_date": "2000-07-18",
      "name": "Big Brother",
      "vote_average": 3.833,
      "vote_count": 48
    },
    {
      "adult": false,
      "backdrop_path": null,
      "genre_ids": [10766, 18],
      "id": 14686,
      "origin_country": ["DE"],
      "original_language": "de",
      "original_name": "Alles was zählt",
      "overview":
          "Alles was zählt is a German television soap opera first broadcast on RTL on September 4, 2006. The original plot revolved around Diana Sommer's dream to become a world class ice skater. She fell in love with Julian Herzog, who signed her at the prestigious Steinkamp Sport and Wellness Center, run by the unscrupulous Steinkamp dynasty. Diana and Julian eventually became a couple, but in November 2007, Julian suffered a brain hemorrhage and died during their wedding. Diana remained in Essen until January 2009, when she left to join a skating centre in Halle. The story continues to revolve around the Steinkamp Sport and Wellness Centre and its quest to become a sporting powerhouse, as well as the lives of the characters who work at and around the Centre.",
      "popularity": 4059.711,
      "poster_path": "/kh7lcozUlj13uRqoZJ2ZjENkm9Q.jpg",
      "first_air_date": "2006-09-04",
      "name": "Alles was zählt",
      "vote_average": 4.5,
      "vote_count": 6
    },
    {
      "adult": false,
      "backdrop_path": "/mu3lEhGovyhKHPJzb7HNYtZUCDT.jpg",
      "genre_ids": [10766],
      "id": 206559,
      "origin_country": ["ZA"],
      "original_language": "af",
      "original_name": "Binnelanders",
      "overview":
          "A South African Afrikaans soap opera. It is set in and around the fictional private hospital, Binneland Kliniek, in Pretoria, and the storyline follows the trials, trauma and tribulations of the staff and patients of the hospital.",
      "popularity": 3728.836,
      "poster_path": "/v9nGSRx5lFz6KEgfmgHJMSgaARC.jpg",
      "first_air_date": "2005-10-13",
      "name": "Binnelanders",
      "vote_average": 5.529,
      "vote_count": 69
    },
    {
      "adult": false,
      "backdrop_path": "/ottT2Yt0OfHiHp3PHJTLNVV8JPE.jpg",
      "genre_ids": [18, 10766],
      "id": 13945,
      "origin_country": ["DE"],
      "original_language": "de",
      "original_name": "Gute Zeiten, schlechte Zeiten",
      "overview":
          "Gute Zeiten, schlechte Zeiten is a long-running German television soap opera, first broadcast on RTL in 1992. The programme concerns the lives of a fictional neighborhood in Germany's capital city Berlin. Over the years the soap opera tends to have an overhaul of young people in their late teens and early twenties; targeting a young viewership.",
      "popularity": 3656.067,
      "poster_path": "/fNHBzjxsydcAssxXqb5IV2obDdU.jpg",
      "first_air_date": "1992-05-11",
      "name": "Gute Zeiten, schlechte Zeiten",
      "vote_average": 5.833,
      "vote_count": 30
    },
    {
      "adult": false,
      "backdrop_path": "/yYNa1nqvNK94xZz3eKyfvZdAvPi.jpg",
      "genre_ids": [10766, 18],
      "id": 112470,
      "origin_country": ["FR"],
      "original_language": "fr",
      "original_name": "Ici tout commence",
      "overview": "",
      "popularity": 3632.391,
      "poster_path": "/yuTHx38jpogXovMhqNatvozigMJ.jpg",
      "first_air_date": "2020-11-02",
      "name": "Here it all begins",
      "vote_average": 7.148,
      "vote_count": 44
    },
    {
      "adult": false,
      "backdrop_path": "/yWVqYVOUcS6vu22v4BPXKJW10m5.jpg",
      "genre_ids": [10764, 10751],
      "id": 206679,
      "origin_country": ["CZ"],
      "original_language": "cs",
      "original_name": "Na lovu",
      "overview":
          "Na Lovu is a Czech game-show, based on the license of the popular global format The Chase. A heart-racing quiz show where four competitors must pit their wits and face off against Lovec (the Chaser), a ruthless quiz genius determined to stop them from winning cash prizes.",
      "popularity": 3360.73,
      "poster_path": "/udJ1wVuOwFg1q6UBcQGwcpcdIYF.jpg",
      "first_air_date": "2021-08-16",
      "name": "Na lovu",
      "vote_average": 5.875,
      "vote_count": 8
    },
    {
      "adult": false,
      "backdrop_path": "/d1aFl8AQ3dFMsGbeF5wk6BOUwq8.jpg",
      "genre_ids": [],
      "id": 209374,
      "origin_country": ["US"],
      "original_language": "es",
      "original_name": "Top Chef VIP",
      "overview": "",
      "popularity": 3254.579,
      "poster_path": "/cw6M4c2MpLSzqzmrrqpSJlEbwCF.jpg",
      "first_air_date": "2022-08-09",
      "name": "Top Chef VIP",
      "vote_average": 4.5,
      "vote_count": 6
    },
    {
      "adult": false,
      "backdrop_path": "/6UvUlyxNrLStWARart544iFXTWF.jpg",
      "genre_ids": [80, 18, 10759],
      "id": 1412,
      "origin_country": ["US"],
      "original_language": "en",
      "original_name": "Arrow",
      "overview":
          "Spoiled billionaire playboy Oliver Queen is missing and presumed dead when his yacht is lost at sea. He returns five years later a changed man, determined to clean up the city as a hooded vigilante armed with a bow.",
      "popularity": 3136.833,
      "poster_path": "/gKG5QGz5Ngf8fgWpBsWtlg5L2SF.jpg",
      "first_air_date": "2012-10-10",
      "name": "Arrow",
      "vote_average": 6.816,
      "vote_count": 5818
    },
    {
      "adult": false,
      "backdrop_path": "/qFfWFwfaEHzDLWLuttWiYq7Poy2.jpg",
      "genre_ids": [10767],
      "id": 2261,
      "origin_country": ["US"],
      "original_language": "en",
      "original_name": "The Tonight Show Starring Johnny Carson",
      "overview":
          "The Tonight Show Starring Johnny Carson is a talk show hosted by Johnny Carson under The Tonight Show franchise from 1962 to 1992. It originally aired during late-night. For its first ten years, Carson's Tonight Show was based in New York City with occasional trips to Burbank, California; in May 1972, the show moved permanently to Burbank, California. In 2002, The Tonight Show Starring Johnny Carson was ranked #12 on TV Guide's 50 Greatest TV Shows of All Time.",
      "popularity": 3078.797,
      "poster_path": "/oA8QVTGlAN511uCAMDN60aVQUs1.jpg",
      "first_air_date": "1962-10-01",
      "name": "The Tonight Show Starring Johnny Carson",
      "vote_average": 7.3,
      "vote_count": 66
    },
    {
      "adult": false,
      "backdrop_path": "/41neXsH222hV2zrsTyw8h7javon.jpg",
      "genre_ids": [16, 35],
      "id": 2190,
      "origin_country": ["US"],
      "original_language": "en",
      "original_name": "South Park",
      "overview":
          "Follows the misadventures of four irreverent grade-schoolers in the quiet, dysfunctional town of South Park, Colorado.",
      "popularity": 2967.565,
      "poster_path": "/xJnbMTrJ2fl1AXAKx34U4BPvOhs.jpg",
      "first_air_date": "1997-08-13",
      "name": "South Park",
      "vote_average": 8.36,
      "vote_count": 4127
    },
    {
      "adult": false,
      "backdrop_path": "/m0bV3qBiJBBlpFaaKjwHo13MVjm.jpg",
      "genre_ids": [35, 10767],
      "id": 14981,
      "origin_country": ["US"],
      "original_language": "en",
      "original_name": "The Late Late Show with Craig Ferguson",
      "overview":
          "The Late Late Show with Craig Ferguson is an American late-night talk show hosted by Scottish American comedian Craig Ferguson, who is the third regular host of the Late Late Show franchise. It follows Late Show with David Letterman in the CBS late-night lineup, airing weekdays in the US at 12:37 a.m. It is taped in front of a live studio audience from Monday to Friday at CBS Television City in Los Angeles, California, directly above the Bob Barker Studio. It is produced by David Letterman's production company Worldwide Pants Incorporated and CBS Television Studios.\n\nSince becoming host on January 3, 2005, after Craig Kilborn and Tom Snyder, Ferguson has achieved the highest ratings since the show's inception in 1995. While the majority of the episodes focus on comedy, Ferguson has also addressed difficult subject matter, such as the deaths of his parents, and undertaken serious interviews, such as one with Desmond Tutu, which earned the show a 2009 Peabody Award.",
      "popularity": 2906.336,
      "poster_path": "/gGC7zSDgG0FY0MbM1pjfhTCWQBI.jpg",
      "first_air_date": "2005-01-03",
      "name": "The Late Late Show with Craig Ferguson",
      "vote_average": 6.791,
      "vote_count": 91
    },
    {
      "adult": false,
      "backdrop_path": "/5S0SI4NjyMji05OPL0GOZ4BsiMh.jpg",
      "genre_ids": [10764],
      "id": 136166,
      "origin_country": ["NL"],
      "original_language": "nl",
      "original_name": "Lang Leve de Liefde",
      "overview": "",
      "popularity": 2905.316,
      "poster_path": "/9lpvvzEl5kViIc2vUJG4QKzj2ds.jpg",
      "first_air_date": "2020-01-20",
      "name": "Lang Leve de Liefde",
      "vote_average": 5.6,
      "vote_count": 5
    },
    {
      "adult": false,
      "backdrop_path": "/qhfPZOCZPTzArvMq78180NqzbWd.jpg",
      "genre_ids": [10766],
      "id": 14743,
      "origin_country": ["ES"],
      "original_language": "ca",
      "original_name": "El Cor de la Ciutat",
      "overview":
          "El cor de la ciutat is a TVC television soap opera first broadcast on TV3 on 11 September 2000 and last broadcast on 23 December 2009. The show is the most watched fiction program in Catalonia, Spain, especially among female audiences, drawing around 28-33% of the audience with as much as 40% during season finales. El cor de la ciutat follows the lives of the people who live and work in the neighbourhood of Sants and Sant Andreu in Barcelona, Catalonia, Spain.",
      "popularity": 2875.229,
      "poster_path": "/xQ83cJA8AxoQMZe8ADApWrRZB1v.jpg",
      "first_air_date": "2000-09-11",
      "name": "El Cor de la Ciutat",
      "vote_average": 4.5,
      "vote_count": 4
    },
    {
      "adult": false,
      "backdrop_path": "/8VWgyQjExeMgeg6Qzv6agduMU1A.jpg",
      "genre_ids": [18, 10759, 10765],
      "id": 121,
      "origin_country": ["GB"],
      "original_language": "en",
      "original_name": "Doctor Who",
      "overview":
          "The adventures of The Doctor, a time-traveling humanoid alien known as a Time Lord. He explores the universe in his TARDIS, a sentient time-traveling spaceship. Its exterior appears as a blue British police box, which was a common sight in Britain in 1963 when the series first aired. Along with a succession of companions, The Doctor faces a variety of foes while working to save civilizations, help ordinary people, and right many wrongs.",
      "popularity": 2846.962,
      "poster_path": "/xinqAmYrZ1TEwowcQhgTkZVtVE0.jpg",
      "first_air_date": "1963-11-23",
      "name": "Doctor Who",
      "vote_average": 7.8,
      "vote_count": 609
    },
    {
      "adult": false,
      "backdrop_path": "/i8iqYtAy9qcO5RSrA1f6fY1n6SN.jpg",
      "genre_ids": [10766],
      "id": 235484,
      "origin_country": ["ZA"],
      "original_language": "af",
      "original_name": "Suidooster",
      "overview":
          "Suidooster is a South African television soap opera produced by Suidooster Films which revolves around a matriarch, her family, friends and the people of Suidooster, a small shopping and business centre in the fictional Cape Town suburb of Ruiterbosch.",
      "popularity": 2846.667,
      "poster_path": "/naCgSiacvV685kait6fBvhVhdce.jpg",
      "first_air_date": "2015-11-16",
      "name": "Suidooster",
      "vote_average": 8.1,
      "vote_count": 10
    },
    {
      "adult": false,
      "backdrop_path": "/2Bkqjc9tNWo3KLr1aRYyJ7vMQtM.jpg",
      "genre_ids": [10764],
      "id": 235493,
      "origin_country": ["NL"],
      "original_language": "nl",
      "original_name": "De Bondgenoten",
      "overview": "",
      "popularity": 2771.017,
      "poster_path": "/wsipinibYxrZhpkQ6MKxIMgL0hv.jpg",
      "first_air_date": "2023-10-22",
      "name": "De Bondgenoten",
      "vote_average": 7.333,
      "vote_count": 9
    },
    {
      "adult": false,
      "backdrop_path": "/l7LRGYJY3NzIGBlpvHpMsNXHbm5.jpg",
      "genre_ids": [10751, 35],
      "id": 218145,
      "origin_country": ["SK"],
      "original_language": "sk",
      "original_name": "Mama na prenájom",
      "overview":
          "Abandoned by his wife, Martin is lying to his daughter not to be upset. But as Hanka grows, these lies become unbearable. Martin meets Nada unexpectedly, asked her to be a rent-a-mother and all lives are completely changed.",
      "popularity": 2770.132,
      "poster_path": "/fH7PP2Rkdlo414IHvZABBHhtoqd.jpg",
      "first_air_date": "2023-01-09",
      "name": "Mom for rent",
      "vote_average": 5,
      "vote_count": 25
    }
  ],
  "total_pages": 8702,
  "total_results": 174022
};
