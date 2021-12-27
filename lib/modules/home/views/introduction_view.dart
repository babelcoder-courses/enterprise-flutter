import 'package:enterprise_flutter/modules/settings/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textBodyStyle =
        context.read<SettingsProvider>().theme.textTheme.headline2!;

    return IntroductionScreen(
      isTopSafeArea: true,
      isBottomSafeArea: true,
      pages: [
        PageViewModel(
          title: "ค้นหาร้านของเรา",
          body:
              "เปิดเผยทุกเส้นทางสู่ร้านของเราด้วยแผนที่อันชาญฉลาดในหน้า Explore",
          image: Image.asset('assets/images/intro-map.png'),
          decoration: PageDecoration(
            titleTextStyle: const TextStyle(color: Colors.green),
            bodyTextStyle: textBodyStyle,
          ),
        ),
        PageViewModel(
          title: "ค้นหาบทความที่ชอบ",
          body:
              "เราแสดงบทความทั้งหมดที่ถูกเขียนด้วยความตั้งใจพร้อมแสดงผลอย่างสวยงามบนแอพของคุณ",
          image: Image.asset('assets/images/intro-articles-list.png'),
          decoration: PageDecoration(
            titleTextStyle: const TextStyle(color: Colors.green),
            bodyTextStyle: textBodyStyle,
          ),
        ),
        PageViewModel(
          title: "บันทึกบทความสุดโปรด",
          body:
              "ไม่พลาดที่จะบันทึกบทความสุดโปรดของคุณเพื่อย้อนกลับมาอ่านซ้ำใหม่อีกครั้ง",
          image: Image.asset('assets/images/intro-favorite.png'),
          decoration: PageDecoration(
            titleTextStyle: const TextStyle(color: Colors.green),
            bodyTextStyle: textBodyStyle,
          ),
        ),
        PageViewModel(
          title: "Dark Mode",
          body: "แสดงผลโหมดมืดยอดนิยมเพื่อเพิ่มอรรถรสในทุกการอ่าน",
          image: Image.asset('assets/images/intro-settings.png'),
          decoration: PageDecoration(
            titleTextStyle: const TextStyle(color: Colors.green),
            bodyTextStyle: textBodyStyle,
          ),
        ),
      ],
      showSkipButton: true,
      showNextButton: true,
      next: const Text("Next"),
      skip: const Text("Skip"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        context.read<SettingsProvider>().intro = true;
      },
      onSkip: () {
        context.read<SettingsProvider>().intro = true;
      },
    );
  }
}
