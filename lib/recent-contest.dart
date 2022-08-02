import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContest extends StatefulWidget {
  const RecentContest({Key? key}) : super(key: key);

  @override
  State<RecentContest> createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {
  List info = [];
  bool isLoading = false;
  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/detail.json").then((s) {
      info = json.decode(s);
    });
        setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF69c5df),
        leading: IconButton(onPressed: () =>Get.back() ,
         icon: const Icon(Icons.arrow_back_ios)) 
         ),
      backgroundColor: const Color(0xFFcbe6f6),
      body:isLoading? Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: [
              for (int i = 0; i < info.length; i++)
                Container(
                  height: 220,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail/', arguments: {
                        'title': info[i]['title'].toString(),
                        'text': info[i]['text'].toString(),
                        'name': info[i]['name'].toString(),
                        'img': info[i]['img'].toString(),
                        'time': info[i]['time'].toString(),
                        'prize': info[i]['prize'].toString(),
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:
                              i.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc)),
                      child: Column(
                        children: [
                          // ignore: avoid_unnecessary_containers
                          Container(
                              child: Row(
                            children: [
                              Text(
                                info[i]['title'],
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Expanded(child: Container())
                            ],
                          )),
                          const SizedBox(height: 10),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              info[i]['text'],
                              style: const TextStyle(
                                  fontSize: 20, color: Color(0xFFb8eefc)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1.0,
                          ),
                          Row(children: [
                            for (int i = 0; i < 4; i++)
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: 50,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          image: AssetImage(info[i]['img']),
                                          fit: BoxFit.cover)),
                                ),
                              )
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
            ]),
          ))
        ]),
      ): Container(
              padding: const EdgeInsets.only(top: 50),
              child: const CircularProgressIndicator(
                backgroundColor: Color(0xFF69c5df),
                color: Color(0xFF3b3f42),
              )),
    );
  }
}
