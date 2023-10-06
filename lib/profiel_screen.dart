import 'package:flutter/material.dart';
import 'user_detail.dart';
import 'sliver_persistece.dart';




import 'custom_appbar.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with SingleTickerProviderStateMixin {
  late int selectedIndex;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    _tabController = TabController(length: 3, vsync: this);

    _tabController.animation!.addListener(
      () {
        final value = _tabController.animation!.value.round();
        if (value != selectedIndex && mounted) {
          _navigateBottomNavBar(value);
        }
      },
    );
  }

  void _navigateBottomNavBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List images = [
    'https://images.unsplash.com/photo-1671379827325-2fa2dc475840?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEwfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1670969548019-18ec1aae8abe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8NnNNVmpUTFNrZVF8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    'https://plus.unsplash.com/premium_photo-1670169415472-974947157fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEyfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1671296368370-a24a6f9148cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIwfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1671299736439-001f7f658a4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE5fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1655071516490-1bd37e1e690e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIxfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1671154680544-6b89302d26b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIzfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1671047417610-8d1f6beb773d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI3fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1671154765825-7426a9532ffc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI0fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://plus.unsplash.com/premium_photo-1670169415472-974947157fd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEyfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1671296368370-a24a6f9148cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIwfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1671299736439-001f7f658a4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE5fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1655071516490-1bd37e1e690e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIxfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: ((context, index) {
              return [
                // const SliverAppBar(
                //   backgroundColor: Colors.blue,
                //   elevation: 0,
                //   pinned: true,
                // ),
                SliverToBoxAdapter(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 170),
                        painter: CustomShapePainter(),
                      ),
                      const Positioned(
                        bottom: -20,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5zdGFncmFtJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                        ),
                      ),
                      Positioned(
                          top: 50,
                          right: 50,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {},
                            child: const Text("Following"),
                          ))
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: UserDetails(),
                ),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: PersistentHeaders(
                        maxHeight: 50,
                        minHeight: 50,
                        child: Container(
                          color: Colors.white,
                          child: TabBar(
                            labelColor: Colors.indigo,
                            unselectedLabelColor: Colors.grey,
                            // unselectedLabelColor: Colors.black,
                            // labelColor: Colors.indigo[800],
                            controller: _tabController,
                            tabs: const [
                              Tab(
                                text: "Posts",
                              ),
                              Tab(
                                text: "Stamp book",
                              ),
                              Tab(
                                text: "Community",
                              ),
                            ],
                          ),
                        )))
              ];
            }),
            body: TabBarView(
              controller: _tabController,
              children: [
                CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          ((context, index) {
                            return Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            );
                          }),
                          childCount: images.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                                crossAxisCount: 3))
                  ],
                ),
                CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          ((context, index) {
                            return Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            );
                          }),
                          childCount: 12,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 1,
                                childAspectRatio: 1 / 1.8,
                                crossAxisSpacing: 1,
                                crossAxisCount: 3))
                  ],
                ),
                CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          ((context, index) {
                            return Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            );
                          }),
                          childCount: images.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                                crossAxisCount: 3))
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
