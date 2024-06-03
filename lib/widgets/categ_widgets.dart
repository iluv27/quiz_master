import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/services/database.dart';
import 'package:quiz_master/theme/theme.dart';

class SubcategModel extends StatelessWidget {
  const SubcategModel({
    super.key,
    required this.assetName,
    required this.subCategLabel,
    required this.questionTotal,
    this.categColor,
    required this.questionAnswerPage,
  });

  final String assetName;
  final String subCategLabel;
  final int questionTotal;
  final Color? categColor;
  final Function() questionAnswerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
      decoration: BoxDecoration(
          color: categColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(19, 0, 0, 0),
              blurRadius: 1,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            assetName,
            width: 75,
            height: 75,
            alignment: Alignment.centerLeft,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subCategLabel,
                        style: const TextStyle(
                            color: Color(0xff111111),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$questionTotal questions',
                        style: const TextStyle(
                            color: Color(0xff666666), fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: questionAnswerPage,
                  elevation: 0,
                  height: 50,
                  minWidth: 50,
                  color: AppColors.primary,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CategHeaderLabel extends StatelessWidget {
  const CategHeaderLabel({super.key, required this.headerLabel});
  final String headerLabel;

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, databaseProvider, _) {
      // Access categories list from DatabaseProvider
      // List<Map<String, dynamic>> categories = databaseProvider.categories;

      // Create a Column of Text widgets based on category_name values
      return Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 20),
        child: Text(
          headerLabel,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );
    });
  }
}
