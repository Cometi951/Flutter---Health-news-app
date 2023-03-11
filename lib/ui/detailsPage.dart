import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_health_code_challenge/Model/home_model_entity.dart';

class DetailsPage extends StatefulWidget {
  final HomeModelArticles articl;

  const DetailsPage(HomeModelArticles this.articl, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.articl.urlToImage ?? "",
              placeholder: (context, url) => Image.network("https://color.adobe.com/media/theme/92471.png"),
              errorWidget: (context, url, error) => Image.network("https://color.adobe.com/media/theme/92471.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Text(widget.articl.title ?? "", style: const TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
              child: Text(widget.articl.description ?? "",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
