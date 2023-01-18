import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(Page2._createRoute());
          },
          child: const Text("Go to the next page"),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  static Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 화면 최하단부에서 시작
        const begin = Offset(0.0, 1.0);
        // 화면 최상단으로 이동
        const end = Offset.zero;

        const curve = Curves.ease;
        final curveTween = CurveTween(curve: curve);

        // 중간 프레임의 offset 값 생성 Tween
        final tween = Tween(begin: begin, end: end).chain(curveTween);
        // 현재 animation 밸류에 맞춰서 중간값 계산.
        final offsetAnimation = animation.drive(tween);

        // 위와 동일하지만 [CurvedAnimation]을 사용
        // final curvedAnimation = CurvedAnimation(
        //   parent: animation,
        //   curve: curve,
        // );
        // final offsetAnimation = Tween(begin: begin, end: end)
        //     .animate(curvedAnimation);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
