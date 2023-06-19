import 'package:flutter/material.dart';
import 'package:fruk/models/havadurumu_model.dart';
import 'package:fruk/services/hava.dart';

class HavaDurumuView extends StatefulWidget {
  const HavaDurumuView({super.key});

  @override
  State<HavaDurumuView> createState() => _HavaDurumuViewState();
}

class _HavaDurumuViewState extends State<HavaDurumuView> {
  late Future<Hava> futureHava;

  @override
  void initState() {
    super.initState();
    futureHava = fetchHava();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Hava>(
        future: futureHava,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              itemCount: (snapshot.data!.result?.length),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 190, 231, 252),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.fromLTRB(1, 5, 1, 5),
                  height: 60,
                  child: Row(
                    children: [
                      Image.network('${snapshot.data!.result![index].icon}'),
                      Text('  ${snapshot.data!.result![index].date}   ',
                          style: TextStyle(fontWeight: FontWeight.w900)),
                      Text(
                          '${snapshot.data!.result![index].day}  '
                              .toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      Text('${snapshot.data!.result![index].description}'
                          .toUpperCase(),style: TextStyle(fontSize: 12,fontWeight:FontWeight.w600),)
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
