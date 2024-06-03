// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';

// // class Home extends StatelessWidget {
// //   const Home({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     List<String> options = [
// //       "Painel de Negócios",
// //       "Levantamento RH",
// //       "Produtividade Diária",
// //       "Fale Conosco",
// //     ];

// //     return Scaffold(
// //       body: Row(
// //         children: [
// //           // Drawer verde
// //           Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: 50,
// //             color: Colors.green,
// //             child: const Padding(
// //               padding: EdgeInsets.all(8.0),
// //               child: Column(
// //                 children: [
// //                   Icon(Icons.abc),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Icon(Icons.home),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Icon(Icons.star),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Icon(Icons.person),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Icon(Icons.check),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Icon(Icons.category_rounded),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Icon(Icons.person),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Icon(
// //                     Icons.person,
// //                     color: Colors.white,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           //Fim drawer verde

// //           Expanded(
// //             child: Column(
// //               children: [
// //                 //AppBar
// //                 Container(
// //                   padding: const EdgeInsets.all(15),
// //                   color: Colors.white,
// //                   height: 60,
// //                   child: const Row(
// //                     children: [Icon(Icons.menu), Spacer(), Text("Usuário: admin - Agência:")],
// //                   ),
// //                 ),
// //                 //Fim do AppBar
// //                 //Navegação
// //                 Container(
// //                   margin: EdgeInsets.only(left: 25, top: 5),
// //                   height: 50,
// //                   child: ListView.builder(
// //                     scrollDirection: Axis.horizontal,
// //                     itemCount: options.length,
// //                     itemBuilder: (context, index) {
// //                       return Padding(
// //                         padding: EdgeInsets.all(8.0),
// //                         child: Container(
// //                           padding: EdgeInsets.symmetric(horizontal: 15),
// //                           decoration: BoxDecoration(
// //                             color: Color.fromARGB(255, 31, 34, 255),
// //                             borderRadius: BorderRadius.circular(15),
// //                           ),
// //                           child: Center(
// //                               child: Text(
// //                             options[index],
// //                             style: TextStyle(color: Colors.white),
// //                           )),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //                 //Fim navegação

// //                 //Tabela
// //                 Container(
// //                   margin: EdgeInsets.only(left: 100, right: 30),
// //                   height: 300,
// //                   decoration: BoxDecoration(
// //                     color: Colors.purple,
// //                     borderRadius: BorderRadius.circular(25),
// //                     border: Border.all(
// //                       color: Color.fromARGB(255, 1, 61, 63),
// //                       width: 2,
// //                     ),
// //                   ),
// //                   child: Column(
// //                     children: [
// //                       Padding(
// //                         padding: EdgeInsets.only(left: 40, right: 40, top: 5),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text(
// //                               "Maio",
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Text(
// //                               "Mobilizadores - Apuração",
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Column(
// //                               children: [
// //                                 Text(
// //                                   "Objetivo Diário: 90%",
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 10,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                                 Text(
// //                                   "Movimento: 22/05/2024",
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 10,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ],
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                       Divider(
// //                         color: Color.fromARGB(255, 1, 61, 63),
// //                       ),
// //                       // Custom expandable row
// //                       CustomExpandableRow(
// //                         columns: [
// //                           ExpandableColumn(
// //                             title: "Centro",
// //                             items: ["Value 1", "Value 2", "Value 3"],
// //                           ),
// //                           ExpandableColumn(
// //                             title: "Seguros de vida",
// //                             items: ["Value 1", "Value 2", "Value 3"],
// //                           ),
// //                           ExpandableColumn(
// //                             title: "Sipag",
// //                             items: ["Value 1", "Value 2", "Value 3"],
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CustomExpandableRow extends StatefulWidget {
// //   final List<ExpandableColumn> columns;

// //   const CustomExpandableRow({required this.columns, Key? key}) : super(key: key);

// //   @override
// //   _CustomExpandableRowState createState() => _CustomExpandableRowState();
// // }

// // class _CustomExpandableRowState extends State<CustomExpandableRow> {
// //   bool _isExpanded = false;

// //   void _toggleExpansion() {
// //     setState(() {
// //       _isExpanded = !_isExpanded;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         GestureDetector(
// //           onTap: _toggleExpansion,
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: widget.columns.map((col) {
// //               return Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Container(
// //                       color: Colors.green[900],
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: Text(
// //                         col.title,
// //                         style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //                       ),
// //                     ),
// //                     if (_isExpanded)
// //                       Column(
// //                         children: col.items.map((item) => Text(item, style: const TextStyle(color: Colors.white))).toList(),
// //                       ),
// //                   ],
// //                 ),
// //               );
// //             }).toList(),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class ExpandableColumn {
// //   final String title;
// //   final List<String> items;

// //   ExpandableColumn({required this.title, required this.items});
// // }

// // void main() => runApp(MaterialApp(home: Home()));

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<String> options = [
//       "Painel de Negócios",
//       "Levantamento RH",
//       "Produtividade Diária",
//       "Fale Conosco",
//     ];

//     return Scaffold(
//       body: Row(
//         children: [
//           // Drawer verde
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: 50,
//             color: Colors.green,
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Icon(Icons.abc),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Icon(Icons.home),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Icon(Icons.star),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Icon(Icons.person),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Icon(Icons.check),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Icon(Icons.category_rounded),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Icon(Icons.person),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           //Fim drawer verde

//           Expanded(
//             child: Column(
//               children: [
//                 //AppBar
//                 Container(
//                   padding: const EdgeInsets.all(15),
//                   color: Colors.white,
//                   height: 60,
//                   child: const Row(
//                     children: [Icon(Icons.menu), Spacer(), Text("Usuário: admin - Agência:")],
//                   ),
//                 ),
//                 //Fim do AppBar
//                 //Navegação
//                 Container(
//                   margin: EdgeInsets.only(left: 25, top: 5),
//                   height: 50,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: options.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 31, 34, 255),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Center(
//                               child: Text(
//                             options[index],
//                             style: TextStyle(color: Colors.white),
//                           )),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 //Fim navegação

//                 //Tabela
//                 Container(
//                   margin: EdgeInsets.only(left: 100, right: 30),
//                   height: 300,
//                   decoration: BoxDecoration(
//                     color: Colors.purple,
//                     borderRadius: BorderRadius.circular(25),
//                     border: Border.all(
//                       color: Color.fromARGB(255, 1, 61, 63),
//                       width: 2,
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 40, right: 40, top: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Maio",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "Mobilizadores - Apuração",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   "Objetivo Diário: 90%",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Movimento: 22/05/2024",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Divider(
//                         color: Color.fromARGB(255, 1, 61, 63),
//                       ),
//                       // Custom expandable row with vertical dividers
//                       CustomExpandableRow(
//                         columns: [
//                           ExpandableColumn(
//                             title: "Agência",
//                             items: ["Value 1", "Value 2", "Value 3"],
//                           ),

//                           // I need a vertical divider here
//                           ExpandableColumn(
//                             title: "Seguros de vida",
//                             items: ["Value 1", "Value 2", "Value 3"],
//                           ),
//                           // I need a vertical divider here
//                           ExpandableColumn(
//                             title: "Sipag",
//                             items: ["Value 1", "Value 2", "Value 3"],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class CustomExpandableRow extends StatefulWidget {
//   final List<ExpandableColumn> columns;

//   const CustomExpandableRow({required this.columns, Key? key}) : super(key: key);

//   @override
//   _CustomExpandableRowState createState() => _CustomExpandableRowState();
// }

// class _CustomExpandableRowState extends State<CustomExpandableRow> {
//   bool _isExpanded = false;

//   void _toggleExpansion() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: _toggleExpansion,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: widget.columns.map((col) {
//               int index = widget.columns.indexOf(col);
//               return Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             color: Colors.green[900],
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               col.title,
//                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           if (_isExpanded)
//                             Column(
//                               children: col.items.map((item) => Text(item, style: TextStyle(color: Colors.white))).toList(),
//                             ),
//                         ],
//                       ),
//                     ),
//                     if (index < widget.columns.length - 1)
//                       VerticalDivider(
//                         color: Colors.white,
//                         width: 1,
//                       ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ExpandableColumn {
//   final String title;
//   final List<String> items;

//   ExpandableColumn({required this.title, required this.items});
// }

// void main() => runApp(MaterialApp(home: Home()));

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      "Painel de Negócios",
      "Levantamento RH",
      "Produtividade Diária",
      "Fale Conosco",
    ];

    return Scaffold(
      body: Row(
        children: [
          // Drawer verde
          Container(
            height: MediaQuery.of(context).size.height,
            width: 50,
            color: Colors.green,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(Icons.abc),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.home),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.star),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.person),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.check),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.category_rounded),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.person),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          //Fim drawer verde

          Expanded(
            child: Column(
              children: [
                //AppBar
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  height: 60,
                  child: const Row(
                    children: [Icon(Icons.menu), Spacer(), Text("Usuário: admin - Agência:")],
                  ),
                ),
                //Fim do AppBar
                //Navegação
                Container(
                  margin: EdgeInsets.only(left: 25, top: 5),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 31, 34, 255),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Text(
                            options[index],
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                //Fim navegação

                //Tabela
                Container(
                  margin: EdgeInsets.only(left: 100, right: 30),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color.fromARGB(255, 1, 61, 63),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Maio",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Mobilizadores - Apuração",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Objetivo Diário: 90%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Movimento: 22/05/2024",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Color.fromARGB(255, 1, 61, 63),
                      ),
                      // Custom expandable row with vertical dividers
                      CustomExpandableRow(
                        columns: [
                          ExpandableColumn(
                            title: "Agência",
                            items: ["Value 1", "Value 2", "Value 3"],
                          ),
                          ExpandableColumn(
                            title: "Seguros de vida",
                            items: ["Value 1", "Value 2", "Value 3"],
                          ),
                          ExpandableColumn(
                            title: "Sipag",
                            items: ["Value 1", "Value 2", "Value 3"],
                          ),
                          ExpandableColumn(
                            title: "Sipag",
                            items: ["Value 1", "Value 2", "Value 3"],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomExpandableRow extends StatefulWidget {
  final List<ExpandableColumn> columns;

  const CustomExpandableRow({required this.columns, Key? key}) : super(key: key);

  @override
  _CustomExpandableRowState createState() => _CustomExpandableRowState();
}

class _CustomExpandableRowState extends State<CustomExpandableRow> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.columns.length * 2 - 1, (index) {
              if (index.isEven) {
                int columnIndex = index ~/ 2;
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.green[900],
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.columns[columnIndex].title,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (_isExpanded)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.columns[columnIndex].items.map((item) => Text(item, style: const TextStyle(color: Colors.white))).toList(),
                        ),
                    ],
                  ),
                );
              } else {
                return VerticalDivider(
                  color: Colors.white,
                  width: 1,
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class ExpandableColumn {
  final String title;
  final List<String> items;

  ExpandableColumn({required this.title, required this.items});
}

void main() => runApp(MaterialApp(home: Home()));
