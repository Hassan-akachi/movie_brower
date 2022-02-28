import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:movie_brower/model/movie_rating.dart';

import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';


@HiveType(typeId: 0)
class MovieDetails {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? year;
  @HiveField(2)
  final String? rated;
  @HiveField(3)
  final String? released;
  @HiveField(4)
  final String? runtime;
  @HiveField(5)
  final String? genre;
  @HiveField(6)
  final String? director;
  @HiveField(7)
  final String? writer;
  @HiveField(8)
  final String? actor;
  @HiveField(9)
  final String? plot;
  @HiveField(10)
  final String? language;
  @HiveField(11)
  final String? country;
  @HiveField(12)
  final String? awards;
  @HiveField(13)
  final String? posterUrl;
  @HiveField(14)
  final List<MovieRating>? ratings;
  @HiveField(15)
  final String? metaScore;
  @HiveField(16)
  final String? imdbRating;
  @HiveField(17)
  final String? imdbVotes;
  @HiveField(18)
  final String? imdbmId;
  @HiveField(19)
  final String? type;
  @HiveField(20)
  final String? dvd;
  @HiveField(21)
  final String? boxOffice;
  @HiveField(22)
  final String? production;
  @HiveField(23)
  final String? website;
  @HiveField(24)
  final bool? response;

  MovieDetails(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actor,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.posterUrl,
      this.ratings,
      this.metaScore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbmId,
      this.type,
      this.dvd,
      this.boxOffice,
      this.production,
      this.website,
      this.response});

  /**Map<String, dynamic> toMap() {
      return {
      'title': this.title,
      'year': this.year,
      'rated': this.rated,
      'released': this.released,
      'runtime': this.runtime,
      'genre': this.genre,
      'director': this.director,
      'writer': this.writer,
      'actor': this.actor,
      'plot': this.plot,
      'language': this.language,
      'country': this.country,
      'awards': this.awards,
      'posterUrl': this.posterUrl,
      'ratings': this.ratings,
      'metaScore': this.metaScore,
      'imdbRating': this.imdbRating,
      'imdbVotes': this.imdbVotes,
      'imdbId': this.imdbId,
      'type': this.type,
      'dvd': this.dvd,
      'boxOffice': this.boxOffice,
      'production': this.production,
      'website': this.website,
      'response': this.response,
      };
      }

      factory MovieDetails.fromMap(Map<String, dynamic> map) {
      return MovieDetails(
      map['Title'] as String ?? "",
      map['Year'] as String?? "",
      map['Rated'] as String?? "",
      map['Released'] as String?? "",
      map['Runtime'] as String?? "",
      map['Genre'] as String?? "",
      map['Director'] as String?? "",
      map['Writer'] as String?? "",
      map['Actor'] as String?? "",
      map['Plot'] as String?? "",
      map['Language'] as String?? "",
      map['Country'] as String?? "",
      map['Awards'] as String?? "",
      map['PosterUrl'] as String?? "",
      List<MovieRating>.from(map['Ratings']?.map((x) => MovieRating.fromMap(x as Map<String, dynamic>)) as Iterable<dynamic> ) ?? <MovieRating>[],
      map['MetaScore'] as String?? "",
      map['imdbRating'] as String?? "",
      map['imdbVotes'] as String?? "",
      map['imdbId'] as String?? "",
      map['Type'] as String?? "",
      map['DVD'] as String?? "",
      map['BoxOffice'] as String?? "",
      map['Production'] as String?? "",
      map['Website'] as String?? "",
      map['Response']  as String == 'True',
      );
      }**/
  factory MovieDetails.fromJson(String source) =>
      MovieDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'year': this.year,
      'rated': this.rated,
      'released': this.released,
      'runtime': this.runtime,
      'genre': this.genre,
      'director': this.director,
      'writer': this.writer,
      'actor': this.actor,
      'plot': this.plot,
      'language': this.language,
      'country': this.country,
      'awards': this.awards,
      'posterUrl': this.posterUrl,
      'ratings': this.ratings,
      'metaScore': this.metaScore,
      'imdbRating': this.imdbRating,
      'imdbVotes': this.imdbVotes,
      'imdbId': this.imdbmId,
      'type': this.type,
      'dvd': this.dvd,
      'boxOffice': this.boxOffice,
      'production': this.production,
      'website': this.website,
      'response': this.response,
    };
  }

  factory MovieDetails.fromMap(Map<String, dynamic> map) {
    return MovieDetails(
      title: map['Title'] as String,
      year: map['Year'] as String,
      rated: map['Rated'] as String,
      released: map['Released'] as String,
      runtime: map['Runtime'] as String,
      genre: map['Genre'] as String,
      director: map['Director'] as String,
      writer: map['Writer'] as String,
      actor: map['Actor'] as String,
      plot: map['Plot'] as String,
      language: map['Language'] as String,
      country: map['Country'] as String,
      awards: map['Awards'] as String,
      posterUrl: map['PosterUrl'] as String,
      ratings: List<MovieRating>.from(map['Ratings']
                  .map((x) => MovieRating.fromMap(x as Map<String, dynamic>))
              as Iterable<dynamic>) ??
          <MovieRating>[],
      metaScore: map['MetaScore'] as String,
      imdbRating: map['imdbRating'] as String,
      imdbVotes: map['imdbVotes'] as String,
      imdbmId: map['imdbmId'] as String,
      type: map['Type'] as String,
      dvd: map['DVD'] as String,
      boxOffice: map['BoxOffice'] as String,
      production: map['Production'] as String,
      website: map['Website'] as String,
      response: map['Response'] as bool,
    );
  }
}
