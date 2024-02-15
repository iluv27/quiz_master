import 'package:flutter/material.dart';
import '../widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: SearchWidget(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/promotional1.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/promotional2.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/promotional3.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ),

        // Category Section
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 35, bottom: 5),
          child: Text(
            'Category',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryAvatars(
                  image: 'images/html.png',
                  label: 'HTML',
                  catColor: Color.fromARGB(57, 197, 172, 172),
                ),
                CategoryAvatars(
                  image: 'images/javascript.png',
                  label: 'Javascript',
                  catColor: Color.fromARGB(53, 255, 235, 59),
                ),
                CategoryAvatars(
                  image: 'images/react.png',
                  label: 'React',
                  catColor: Color.fromARGB(51, 133, 149, 162),
                ),
                CategoryAvatars(
                  image: 'images/css.png',
                  label: 'CSS',
                  catColor: Color.fromARGB(51, 133, 149, 162),
                ),
                CategoryAvatars(
                  image: 'images/react.png',
                  label: 'React',
                  catColor: Color.fromARGB(51, 133, 149, 162),
                ),
                CategoryAvatars(
                  image: 'images/css.png',
                  label: 'CSS',
                  catColor: Color.fromARGB(51, 133, 149, 162),
                ),
                CategoryAvatars(
                  image: 'images/javascript.png',
                  label: 'Javascript',
                  catColor: Color.fromARGB(51, 133, 149, 162),
                ),
              ],
            ),
          ),
        ),

        // CARD Section
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 35, bottom: 5),
          child: Text(
            'Popular Quizzes',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(19, 0, 0, 0),
                            blurRadius: 1,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('images/promotional3.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                              Color(0xFFE0781E),
                            ),
                            minimumSize: MaterialStatePropertyAll(
                              Size(MediaQuery.sizeOf(context).width * 1, 36),
                            ),
                          ),
                          child: const Text('Take Quiz'),
                        )
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
