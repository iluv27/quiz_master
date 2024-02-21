import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView(
        children: [
          Container(
            color: Provider.of<ThemeProvider>(context).themeData == lightMode
                ? const Color(0xfff6f6f6)
                : const Color(0xff111111),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Recent Questions',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      minVerticalPadding: 25,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, left: 10),
                        child: Text(
                          'Javascript',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 10),
                        child: Text(
                          'Objects (3/15)',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      trailing: Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/javascript.png'))),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}


// Center(
//         child: SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.85,
//       child: Text.rich(
//           textAlign: TextAlign.center,
//           maxLines: 2,
//           TextSpan(
//               style: const TextStyle(
//                 height: 1.7,
//               ),
//               children: [
//                 TextSpan(
//                     text: 'You need to be logged in to save your history. ',
//                     style: Theme.of(context).textTheme.bodyLarge),
//                 const TextSpan(
//                     text: 'Log in.', style: TextStyle(color: Color(0xFFE0781E)))
//               ])),
//     ));