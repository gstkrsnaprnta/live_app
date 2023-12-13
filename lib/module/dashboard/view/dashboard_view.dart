import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:live_app/core.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/dashboard_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;
    List<String> filmCategories = [
      "Action",
      "Comedy",
      "Drama",
      "Fantasy",
      "Horror",
      "Romance",
      "Sci-Fi",
      "Thriller",
      "Animation",
      "Adventure",
    ];

    final List<Map<String, dynamic>> film = [
      {
        'judul': 'Naruto Shipuden',
        'view': '500k',
        'imageURL':
            'https://www.crunchyroll.com/imgsrv/display/thumbnail/480x720/catalog/crunchyroll/01ec367b44f0a568430a957e042639af.jpe',
      },
      {
        'judul': 'Your Name',
        'view': '120K',
        'imageURL':
            "https://static.wikia.nocookie.net/kiminonawa/images/6/62/Kimi-no-Na-wa.-Visual.jpg/revision/latest?cb=20160927170951"
      },
      {
        'judul': 'Naruto',
        'view': '120K',
        'imageURL':
            'https://www.crunchyroll.com/imgsrv/display/thumbnail/480x720/catalog/crunchyroll/01ec367b44f0a568430a957e042639af.jpe',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: 200,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: const Center(
              child: Text(
                "GK",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(
                  MdiIcons.bellOutline,
                  size: 30.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                const Icon(
                  Icons.search,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "  Categories",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 60.0, // Atur tinggi sesuai kebutuhan
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filmCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          filmCategories[index],
                        )),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: film.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 180.0,
                        height: 250.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                film[index]['imageURL'],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Lapisan gelap
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8.0,
                              left: 8.0,
                              child: Container(
                                width: 70.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  border: Border.all(
                                    color: Colors.transparent, // Warna border
                                    width: 2.0, // Lebar border
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Radius border
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.remove_red_eye,
                                          size: 24.0,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          film[index]['view'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 8.0,
                              right: 8.0,
                              child: Container(
                                width: 60.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  border: Border.all(
                                    color: Colors.transparent, // Warna border
                                    width: 2.0, // Lebar border
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Radius border
                                ),
                                child: const Center(
                                  child: Text(
                                    'Live',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              left: 8.0,
                              right: 8.0,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      film[index]['judul'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Icon(
                                      Icons.more_vert,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Live Now",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 250.0,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: film.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 400,
                          height: 210.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://c4.wallpaperflare.com/wallpaper/94/797/206/kimi-no-na-wa-comet-makoto-shinkai-starry-night-wallpaper-preview.jpg',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Lapisan gelap
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.7),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8.0,
                                left: 230.0,
                                child: Container(
                                  width: 70.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    border: Border.all(
                                      color: Colors.transparent, // Warna border
                                      width: 2.0, // Lebar border
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Radius border
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.remove_red_eye,
                                            size: 24.0,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            film[index]['view'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 8.0,
                                right: 10.0,
                                child: Container(
                                  width: 60.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    border: Border.all(
                                      color: Colors.transparent, // Warna border
                                      width: 2.0, // Lebar border
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Radius border
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Live',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8.0,
                                left: 8.0,
                                right: 8.0,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: double.infinity,
                                  color: Colors.black.withOpacity(0.10),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Your Name",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(
                                        Icons.more_vert,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 75,
                                left: 8.0,
                                right: 8.0,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: double.infinity,
                                  color: Colors.black.withOpacity(0.10),
                                  child: const Center(
                                    child: Icon(
                                      Icons.play_circle_outline,
                                      size: 50.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
