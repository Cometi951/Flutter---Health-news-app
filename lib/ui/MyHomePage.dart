import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_health_code_challenge/notifier/HomeNotifier.dart';

import '../data/remote/response/Status.dart';
import 'detailsPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeNotifier = HomeNotifier();

  @override
  void initState() {
    homeNotifier.getHomeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        type: MaterialType.transparency,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 13, right: 13, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        const Text("Breaking news", style: TextStyle(fontSize: 42, color: Colors.black, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        InkWell(
                          child: Image.asset("assets/images/ic_grid.png", height: 25, width: 25),
                          onTap: () {
                            homeNotifier.changeView(!homeNotifier.isGridView.value);
                          },
                        )
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: homeNotifier.isGridView,
                      builder: (context, isGridView, child) => ValueListenableBuilder(
                        valueListenable: homeNotifier.homeList,
                        builder: (context, vehicleListVal, child) {
                          if (vehicleListVal.status == Status.LOADING) {
                            return const Text("Loading...");
                          } else if (vehicleListVal.status == Status.COMPLETED) {
                            return GridView.count(
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              primary: false,
                              shrinkWrap: true,
                              crossAxisCount: isGridView ? 2 : 1,
                              children: List.generate(
                                vehicleListVal.data!.articles.length,
                                (index) {
                                  return InkWell(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(vehicleListVal.data!.articles[index]))),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                            width: double.infinity,
                                            imageUrl: vehicleListVal.data!.articles[index].urlToImage ?? "",
                                            placeholder: (context, url) => Image.network("https://color.adobe.com/media/theme/92471.png"),
                                            errorWidget: (context, url, error) => Image.network("https://color.adobe.com/media/theme/92471.png"),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            height: double.infinity,
                                            alignment: Alignment.bottomLeft,
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [Colors.transparent, Colors.transparent, Colors.black],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter)),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  vehicleListVal.data!.articles[index].title,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  vehicleListVal.data!.articles[index].description ?? "",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Text(vehicleListVal.status.toString());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
