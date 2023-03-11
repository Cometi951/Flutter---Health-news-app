import 'package:flutter_health_code_challenge/generated/json/base/json_field.dart';
import 'package:flutter_health_code_challenge/generated/json/home_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HomeModelEntity {

	late String status;
	late int totalResults;
	late List<HomeModelArticles> articles;
  
  HomeModelEntity();

  factory HomeModelEntity.fromJson(Map<String, dynamic> json) => $HomeModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeModelEntityToJson(this);

  HomeModelEntity copyWith({String? status, int? totalResults, List<HomeModelArticles>? articles}) {
      return HomeModelEntity()..status= status ?? this.status
			..totalResults= totalResults ?? this.totalResults
			..articles= articles ?? this.articles;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeModelArticles {

	@JSONField(name: "source")
	late HomeModelArticlesSource xSource;
	late String author;
	late String title;
	dynamic description;
	late String url;
	dynamic urlToImage;
	late String publishedAt;
	dynamic content;
  
  HomeModelArticles();

  factory HomeModelArticles.fromJson(Map<String, dynamic> json) => $HomeModelArticlesFromJson(json);

  Map<String, dynamic> toJson() => $HomeModelArticlesToJson(this);

  HomeModelArticles copyWith({HomeModelArticlesSource? xSource, String? author, String? title, dynamic description, String? url, dynamic urlToImage, String? publishedAt, dynamic content}) {
      return HomeModelArticles()..xSource= xSource ?? this.xSource
			..author= author ?? this.author
			..title= title ?? this.title
			..description= description ?? this.description
			..url= url ?? this.url
			..urlToImage= urlToImage ?? this.urlToImage
			..publishedAt= publishedAt ?? this.publishedAt
			..content= content ?? this.content;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeModelArticlesSource {

	late String id;
	late String name;
  
  HomeModelArticlesSource();

  factory HomeModelArticlesSource.fromJson(Map<String, dynamic> json) => $HomeModelArticlesSourceFromJson(json);

  Map<String, dynamic> toJson() => $HomeModelArticlesSourceToJson(this);

  HomeModelArticlesSource copyWith({String? id, String? name}) {
      return HomeModelArticlesSource()..id= id ?? this.id
			..name= name ?? this.name;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}