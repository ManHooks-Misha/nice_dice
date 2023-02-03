import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

// class StartScreen extends StatelessWidget {
//   const StartScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         //Padding: const EdgeInsets.all(24),
//         children: [
//           CircleAvatar(
//             child: Image.asset('assets/images/dices.png'),
//             backgroundImage: const AssetImage('assets/images/bg.jfif'),
//             radius: 100,
//           ),
//           Container(
//             padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
//             child: const Text(
//               'Nice Dice',
//               style: TextStyle(
//                   fontFamily: 'Baskerville',
//                   decorationStyle: TextDecorationStyle.wavy),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const MyHomePage(title: "Nice Dice")),
//                 (Route<dynamic> route) => false,
//               )
//             },
//             child: const Text("START ROLLING"),
//           )
//         ],
//       ),
//     );
//   }
// }

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //Padding: const EdgeInsets.all(24),
        children: [
          Stack(children: [
            RotationTransition(
              turns: _animation,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const CircleAvatar(
                  //child: Image.asset('assets/images/dices.png'),
                  backgroundImage: AssetImage('assets/images/bg.jfif'),
                  radius: 100,
                ),
              ),
            ),
            Image.asset(
              'assets/images/dices.png',
              height: 220,
              width: 220,
            ),
          ]),
          Container(
            padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
            child: const Text(
              'Nice Dice!',
              style: TextStyle(
                  fontFamily: 'Baskerville',
                  decorationStyle: TextDecorationStyle.wavy),
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: "Nice Dice")),
                (Route<dynamic> route) => false,
              )
            },
            child: const Text("START ROLLING"),
          )
        ],
      ),
    );
  }
}
