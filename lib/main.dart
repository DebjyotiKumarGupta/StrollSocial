import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    mainAxisExtent: 0,
    crossAxisCount: 2,
    crossAxisSpacing: 2.0, // Adjust the spacing as needed
    mainAxisSpacing: 2.0, // Adjust the spacing as needed
  );
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "The peace in the\n early mornings",
      "The magical\n golden hours",
      "Wind-down time\n after dinners",
      "The serenity past\nmidnight"
    ];

    Map<String, String> smallTitles = {
      "22h 00m": "assets/clock.svg",
      "103": "assets/person.svg"
    };
    Size size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            child: SvgPicture.asset("assets/background.svg", fit: BoxFit.cover),
          ),
          Container(
            height: size.height * 0.47,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/sunset.png"),
                fit: BoxFit.cover,
              ),
              // Add a linear gradient with transparent color at the top and black color at the bottom
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.5,
                  1.0
                ], // Adjust the stop positions to control the gradient effect
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.10,
            left: size.height * 0.10,
            child: Row(
              children: [
                Text(
                  "Stroll Bonfire",
                  style: TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFCCC8FF),
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(
                            0.5), // Adjust the shadow color and opacity
                        offset:
                            const Offset(2.0, 2.0), // Adjust the shadow offset
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.white),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.16,
            left: size.height * 0.15,
            child: Row(
              children: smallTitles.entries.map((entry) {
                final title = entry.key;
                final imageData = entry.value;

                return reUser(
                  context: context,
                  title: title,
                  ImageData: imageData,
                );
              }).toList(),
            ),
          ),
          Positioned(
            left: size.width * 0.22,
            top: size.height * 0.42,
            child: Container(
              height: size.height * 0.04,
              width: size.width * 0.30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 39, 48),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "Angelina, 28",
                  style: TextStyle(
                    fontFamily:
                        'Proxima Nova', // Specify Proxima Nova as the font family
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF5F5F5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.08,
            top: size.height * 0.41,
            child: CircleAvatar(
              radius: size.height * 0.05,
              backgroundColor: const Color.fromARGB(255, 35, 39, 48),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:
                    Image.asset("assets/girl.png", height: size.height * 0.08),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.30,
            top: size.height * 0.47,
            child: const Text(
              "What is your favorite time\n of the day?",
              style: TextStyle(
                fontFamily:
                    'Proxima Nova', // Specify Proxima Nova as the font family
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFFF5F5F5),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.20,
            top: size.height * 0.55,
            child: const Text(
              "“Mine is definitely the peace in the morning.”",
              style: TextStyle(
                fontFamily:
                    'Proxima Nova', // Specify Proxima Nova as the font family
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFCBC9FFB2),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Positioned(
            // height: size.height * 0.20,
            top: size.height * 0.50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Wrap(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < titles.length; i++)
                    reUseContainer(
                        context: context,
                        index: String.fromCharCode('A'.codeUnitAt(0) + i),
                        title: titles[i])
                ],
              ),
            ),
          ),
          Positioned(
              // height: size.height * 0.20,
              top: size.height * 0.80,
              left: 0,
              right: 0,
              bottom: 0,
              child: lastContainer(context: context)),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 35, 39, 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // elevation: 6,
              backgroundColor: const Color.fromARGB(255, 35, 39, 48),
              items: <BottomNavigationBarItem>[
                for (int i = 1; i <= 4; i++)
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/homeIcon$i.svg"),
                    label: '',
                  ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(6),
              height: size.height * 0.007,
              width: size.width * 0.50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }

  Widget reUser(
      {required BuildContext context,
      required String title,
      required ImageData}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(ImageData),
          Text(
            title,
            style: const TextStyle(
              fontFamily:
                  'Proxima Nova', // Specify Proxima Nova as the font family
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF),
              // fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget lastContainer({required BuildContext context}) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Pick your option.\nSee who has a similar mind.",
          style: TextStyle(
            fontFamily:
                'Proxima Nova', // Specify Proxima Nova as the font family
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFFC4C4C4),
            // fontStyle: FontStyle.italic,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset("assets/mic.svg"),
            const SizedBox(width: 10),
            SvgPicture.asset("assets/right.svg"),
          ],
        ),
      ],
    ));
  }

  Widget reUseContainer(
      {required BuildContext context,
      required String index,
      required String title}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: 10,

      margin: const EdgeInsets.all(8.0),
      height: size.height * 0.08,

      decoration: BoxDecoration(
        color: const Color(0xFF232A2E),
        borderRadius: BorderRadius.circular(10),
      ),
      width: size.width * 0.45,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: size.height * 0.02,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: size.height * 0.019,
                  backgroundColor: const Color(0xFF232A2E),
                  child: Text(
                    index,
                    style: const TextStyle(
                      fontFamily:
                          'Proxima Nova', // Specify Proxima Nova as the font family
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFC4C4C4),
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily:
                      'Proxima Nova', // Specify Proxima Nova as the font family
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFC4C4C4),
                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
