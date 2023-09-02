import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<String> _notifications = List.generate(20, (index) => "${index}h");

  bool _showBarrier = false;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  void _onDismissed(String notification) {
    _notifications.remove(notification);
    setState(() {});
  }

  void _toggleAnimations() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Activity",
                style: TextStyle(
                    fontSize: Sizes.size32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Replies",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Mentions",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView(
            children: [
              Gaps.v20,
              member(
                name: 'bee',
                content:
                    'Here\'s a thread you should follow if you love botany @bee',
                event: 'Mentioned you',
                time: '106',
                profileColor: Colors.yellow.shade600,
              ),
              const Divider(height: 20, indent: Sizes.size80),
              member(
                name: 'bee',
                content: 'Starting out my gardening club with thr..',
                event: 'Mentioned you',
                time: '4h',
                profileColor: Colors.yellow.shade600,
              ),
              const Divider(height: 20, indent: Sizes.size80),
              member2(
                name: 'Show',
                event: 'Followed you',
                time: '5h',
                profileColor: Colors.blue,
              ),
              const Divider(height: 20, indent: Sizes.size60),
              member2(
                name: 'the.gardening',
                event: 'Definitely broken! 🌱🌷🌼',
                time: '5h',
                profileColor: Colors.green,
              ),
              const Divider(height: 20, indent: Sizes.size60),
              member2(
                name: 'the.gardening',
                event: '🌱🌷🌼',
                time: '5h',
                profileColor: Colors.green,
              ),
              const Divider(height: 20, indent: Sizes.size60),
            ],
          ),
          const Center(
            child: Text("It's secon tab"),
          ),
          const Center(
            child: Text("It's third tab"),
          ),
          const Center(
            child: Text("It's 4rd tab"),
          ),
        ],
      ),
    );
  }
}

class member extends StatefulWidget {
  member({
    super.key,
    required this.name,
    required this.content,
    required this.event,
    required this.time,
    required this.profileColor,
  });

  String name, content, event, time;
  Color profileColor;

  @override
  State<member> createState() => _memberState();
}

class _memberState extends State<member> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Sizes.size44,
              height: Sizes.size44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.profileColor,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        title: Row(
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size18,
              ),
            ),
            Gaps.h10,
            Text(
              widget.time,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: Sizes.size16,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.event,
              style: const TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.v7,
            Text(
              widget.content,
              style: const TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16,
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

class member2 extends StatefulWidget {
  member2({
    super.key,
    required this.name,
    required this.event,
    required this.time,
    required this.profileColor,
  });

  String name, event, time;
  Color profileColor;

  @override
  State<member2> createState() => _memberState2();
}

class _memberState2 extends State<member2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Sizes.size44,
              height: Sizes.size44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.profileColor,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        title: Row(
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size18,
              ),
            ),
            Gaps.h10,
            Text(
              widget.time,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: Sizes.size16,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v7,
            Text(
              widget.event,
              style: const TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
          ],
        ),
        trailing: Container(
          width: Sizes.size96,
          height: Sizes.size32,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: const Center(
            child: Text(
              "Follow",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
