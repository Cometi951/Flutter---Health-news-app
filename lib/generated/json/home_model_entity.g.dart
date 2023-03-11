import 'package:flutter_health_code_challenge/generated/json/base/json_convert_content.dart';
import 'package:flutter_health_code_challenge/Model/home_model_entity.dart';

HomeModelEntity $HomeModelEntityFromJson(Map<String, dynamic> json) {
	final HomeModelEntity homeModelEntity = HomeModelEntity();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		homeModelEntity.status = status;
	}
	final int? totalResults = jsonConvert.convert<int>(json['totalResults']);
	if (totalResults != null) {
		homeModelEntity.totalResults = totalResults;
	}
	final List<HomeModelArticles>? articles = jsonConvert.convertListNotNull<HomeModelArticles>(json['articles']);
	if (articles != null) {
		homeModelEntity.articles = articles;
	}
	return homeModelEntity;
}

Map<String, dynamic> $HomeModelEntityToJson(HomeModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['totalResults'] = entity.totalResults;
	data['articles'] =  entity.articles.map((v) => v.toJson()).toList();
	return data;
}

HomeModelArticles $HomeModelArticlesFromJson(Map<String, dynamic> json) {
	final HomeModelArticles homeModelArticles = HomeModelArticles();
	final HomeModelArticlesSource? xSource = jsonConvert.convert<HomeModelArticlesSource>(json['source']);
	if (xSource != null) {
		homeModelArticles.xSource = xSource;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		homeModelArticles.author = author;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		homeModelArticles.title = title;
	}
	final dynamic description = jsonConvert.convert<dynamic>(json['description']);
	if (description != null) {
		homeModelArticles.description = description;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		homeModelArticles.url = url;
	}
	final dynamic urlToImage = jsonConvert.convert<dynamic>(json['urlToImage']);
	if (urlToImage != null) {
		homeModelArticles.urlToImage = urlToImage;
	}
	final String? publishedAt = jsonConvert.convert<String>(json['publishedAt']);
	if (publishedAt != null) {
		homeModelArticles.publishedAt = publishedAt;
	}
	final dynamic content = jsonConvert.convert<dynamic>(json['content']);
	if (content != null) {
		homeModelArticles.content = content;
	}
	return homeModelArticles;
}

Map<String, dynamic> $HomeModelArticlesToJson(HomeModelArticles entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['source'] = entity.xSource.toJson();
	data['author'] = entity.author;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['url'] = entity.url;
	data['urlToImage'] = entity.urlToImage;
	data['publishedAt'] = entity.publishedAt;
	data['content'] = entity.content;
	return data;
}

HomeModelArticlesSource $HomeModelArticlesSourceFromJson(Map<String, dynamic> json) {
	final HomeModelArticlesSource homeModelArticlesSource = HomeModelArticlesSource();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		homeModelArticlesSource.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		homeModelArticlesSource.name = name;
	}
	return homeModelArticlesSource;
}

Map<String, dynamic> $HomeModelArticlesSourceToJson(HomeModelArticlesSource entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}