import 'dart:ffi';

import 'package:delivery/content-controller.dart';
import 'package:delivery/recent-contest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContentController data = Get.put(ContentController(context));
    List info = data.info;
    List list = data.list;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: GetX<ContentController>(builder: (controller) {
      return Container(
        child: (data.isLoading == false)
            ? Container(
                padding: const EdgeInsets.only(top: 70),
                color: const Color(0xFFc5e5f3),
                child: Column(
                  children: [
                    //james smith
                    Container(
                      width: width,
                      height: 100,
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFebf8fd),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            // ignore: prefer_const_constructors
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  const AssetImage("img/images1.jpeg"),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  "James Smith",
                                  style: const TextStyle(
                                      color: Color(0xFF3b3f42),
                                      fontSize: 18,
                                      decoration: TextDecoration.none),
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  height: 5,
                                ),
                                // ignore: prefer_const_constructors
                                Text(
                                  "Top Level",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      color: const Color(0xFFfdebb2),
                                      fontSize: 12,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFf3fafc)),
                              child: const Center(
                                child: Icon(
                                  Icons.notifications,
                                  color: Color(0xFF69c5df),
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //popular contest
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            "Popular Contest",
                            style: const TextStyle(
                                color: Color(0xFF1f2326),
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                          Expanded(child: Container()),
                          // ignore: prefer_const_constructors
                          Text(
                            "Show all",
                            style: const TextStyle(
                                color: Color(0xFFcfd5b3),
                                fontSize: 15,
                                decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFfdc33c)),
                            child: GestureDetector(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //list
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 220,
                      child: PageView.builder(
                          controller: PageController(viewportFraction: 0.88),
                          // ignore: invalid_use_of_protected_member
                          itemCount: data.info == null
                              ? 0
                              // ignore: invalid_use_of_protected_member
                              : data.info.length,
                          itemBuilder: (_, i) {
                            return GestureDetector(
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
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                height: 220,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: i.isEven
                                        ? const Color(0xFF69c5df)
                                        : const Color(0xFF9294cc)),
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
                                      width: width,
                                      child: Text(
                                        info[i]['text'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFb8eefc)),
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
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        info[i]['img']),
                                                    fit: BoxFit.cover)),
                                          ),
                                        )
                                    ]),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //recent contests
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            "Recent Contests",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: const Color(0xFF1f2326),
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                          Expanded(child: Container()),
                          // ignore: prefer_const_constructors
                          Text(
                            "Show all",
                            style: const TextStyle(
                                color: Color(0xFFcfd5b3),
                                fontSize: 15,
                                decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFfdc33c)),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const RecentContest());
                              },
                              child: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: list.length,
                              itemBuilder: (_, i) {
                                return Container(
                                  width: width,
                                  height: 100,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFFebf8fd),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage:
                                              AssetImage(list[i]['img']),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              list[i]['status'],
                                              style: const TextStyle(
                                                  color: Color(0xFFfdebb2),
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: 170,
                                              child: Text(
                                                list[i]['text'],
                                                style: const TextStyle(
                                                    color: Color(0xFF3b3f42),
                                                    fontSize: 18,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            )
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          width: 70,
                                          height: 70,
                                          child: Text(
                                            list[i]['time'],
                                            style: const TextStyle(
                                                fontSize: 10,
                                                decoration: TextDecoration.none,
                                                color: Color(0xFFb2b8bb)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                    )
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.only(top: 50),
                child: const CircularProgressIndicator(
                  backgroundColor: Color(0xFF69c5df),
                  color: Color(0xFF3b3f42),
                )),
      );
    }));
  }
}
