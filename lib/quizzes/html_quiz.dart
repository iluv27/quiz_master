import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/services/database.dart';
import 'package:quiz_master/widgets/shimmer_widgets.dart';
import '../questions/quiz_sect.dart';
import '../widgets/categ_widgets.dart';

class HtmlCssQuiz extends StatefulWidget {
  const HtmlCssQuiz({super.key});

  @override
  State<HtmlCssQuiz> createState() => _HtmlCssQuizState();
}

class _HtmlCssQuizState extends State<HtmlCssQuiz> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);

    databaseProvider.fetchSubCategoriesData(
        databaseProvider.categories[databaseProvider.indexOfNumbers]['id']);
    return Scaffold(
      body: FutureBuilder(
        future: databaseProvider.fetchSubCategoriesData(
            databaseProvider.categories[databaseProvider.indexOfNumbers]['id']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SubCategoriesShimmer();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return _buildContent(context);
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategHeaderLabel(
            headerLabel: 'HTML',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.63,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                itemCount: databaseProvider.subCategoryNames.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        2, // You can adjust the number of columns here

                    childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  // Get the subCategoryTitles from the DatabaseProvider
                  return SubcategModel(
                    mainCategName: 'HTML',
                    assetName: databaseProvider.subCategoryImages[index],
                    subCategLabel: databaseProvider.subCategoryNames[index],
                    categColor: colors[index % colors.length],
                    questionTotal: htmlQuestions[0].length,
                  );
                }),
          )
        ],
      ),
    );
  }
}

List<Color> colors = const [
  Color.fromARGB(255, 255, 227, 227),
  Color.fromARGB(255, 255, 255, 217),
  Color.fromARGB(255, 235, 255, 231),
  Color.fromARGB(255, 227, 245, 252),
  Color.fromARGB(255, 255, 240, 221),
  Color(0xffffefff),
  Color(0xffafffff),
  Color(0xffffcfff),
  Color(0xffffcfff),
  Color.fromARGB(255, 207, 214, 255),
];
