import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:unsend/controllers/fetch_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imgurl = "";
  bool isLoading = true;
  int memeno = 0;
  var h = 0;
  void Updateimg() async {
    String getimg = await FetchMeme.fetchnewMeme();
    memeno++;
    setState(() {
      imgurl = getimg;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Updateimg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(title: Center(child: Text("Meme"))),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 120,
            ),
            Text(
              "MEME #$memeno",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: isLoading
                    ? Center(
                        child: SpinKitRipple(
                        color: Colors.deepOrange,
                      ))
                    : Image.network(imgurl)),
            SizedBox(
              height: (MediaQuery.of(context).size.height) / 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  // color: Colors.deepOrange,
                  child: ElevatedButton(
                    onPressed: () {
                      Updateimg();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                    ),
                    child: Text(
                      "More fun !!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        // color: Colors.cyan,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Share.share("hi i am deepak");
                  },
                  child: Icon(Icons.share),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) / 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Text("APP CREATED BY"),
                  Text("@ mrDeepakk"),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
