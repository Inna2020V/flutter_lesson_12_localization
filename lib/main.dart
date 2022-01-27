// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_lesson_12_localization/language_change_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('ru', ''),
          ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomeWidget(),
          },
        ),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context)!;
    DateTime firstDate = DateTime.parse("2021-03-02");
    DateTime secondDate = DateTime.parse("2020-05-10");
    DateTime thirdDate = DateTime.parse("2022-01-09");
    var jarTotal = translation.itemTotal(1500);
    var flowerTotal = translation.itemTotal(200);
    var giftTotal = translation.itemTotal(1000);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        title: Text(
          translation.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                context.read<LanguageChangeProvider>().changeLocale("en");
              },
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  primary: _getLanguageCode(context) == 'en'
                      ? Color(0xFFDC7633)
                      : Colors.grey[400]),
              child: Text(
                'EN',
                style: TextStyle(color: Colors.black),
              )),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<LanguageChangeProvider>().changeLocale("ru");
            },
            style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                primary: _getLanguageCode(context) == 'ru'
                    ? Color(0xFFDC7633)
                    : Colors.grey[400]),
            child: Text(
              'RU',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            shadowColor: Color(0xFFFF7F50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/1/10/Winniethepooh.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation.winnieName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(translation.jars(2) +
                          translation.manufacturer(" 'HONEY' ")),
                      Text(jarTotal),
                      Text(translation.date(firstDate)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            shadowColor: Color(0xFFFF7F50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                        'https://ru.wikifur.com/w/images/thumb/2/20/Piglet_WTP.png/428px-Piglet_WTP.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation.piglet,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(translation.flowers(1) +
                          translation.manufacturer(" 'ROSE' ")),
                      Text(flowerTotal),
                      Text(translation.date(secondDate)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            shadowColor: Color(0xFFFF7F50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                        'https://i.pinimg.com/originals/50/7a/ed/507aed003bb1f941b5435862e97e0955.gif'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation.tigger,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(translation.gifts(3) +
                          translation.manufacturer(" 'SMILE' ")),
                      Text(giftTotal),
                      Text(translation.date(thirdDate)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getLanguageCode(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }
}
