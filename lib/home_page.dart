import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAD6DF),
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerHTwo(),
              SizedBox(height: 12.0),
              ContainerHThree(),
              SizedBox(height: 12.0),
              ContainerHThree(),
              SizedBox(height: 64.0),
              ContainerHFour(),
              SizedBox(height: 12.0),
              ContainerH5(),
              SizedBox(height: 12.0),
              ListViewCustomWidget(),
              SizedBox(height: 64.0),
              ContainerHFour(),
              SizedBox(height: 12.0),
              ContainerH5(),
              SizedBox(height: 12.0),
              ListViewCustomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewCustomWidget extends StatefulWidget {
  const ListViewCustomWidget({
    super.key,
  });

  @override
  State<ListViewCustomWidget> createState() => _ListViewCustomWidgetState();
}

class _ListViewCustomWidgetState extends State<ListViewCustomWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _atEnd = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        setState(() {
          _atEnd = true;
        });
      } else {
        setState(() {
          _atEnd = false;
        });
      }
    } else {
      setState(() {
        _atEnd = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 4),
                color: Colors.purple[100],
                height: 90,
                width: 90,
                child: const Center(
                  child: Icon(Icons.image),
                ),
              );
            },
          ),
          Visibility(
            visible: !_atEnd,
            child: Positioned(
              right: 0,
              bottom: 0,
              // top: 0,
              child: Container(
                width: 30,
                height: 94,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                    stops: [0.0, 1.0],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerH5 extends StatelessWidget {
  const ContainerH5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      height: 30,
      width: MediaQuery.of(context).size.width * 0.65,
      child: const Center(
        child: Text(
          "H2",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class ContainerHFour extends StatelessWidget {
  const ContainerHFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      height: 40,
      width: MediaQuery.of(context).size.width * 0.75,
      child: const Center(
        child: Text(
          "H2",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class ContainerHThree extends StatelessWidget {
  const ContainerHThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      height: 40,
      width: double.infinity,
      child: const Center(
        child: Text(
          "H2",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class ContainerHTwo extends StatelessWidget {
  const ContainerHTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      height: 70,
      width: MediaQuery.of(context).size.width * 0.65,
      child: const Center(
        child: Text(
          "H2",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
