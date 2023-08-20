import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';
import 'my_page_presenter.dart';
import 'my_page_view_model.dart';

class MyPageViewMobile extends StatelessWidget {
  const MyPageViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track My Vol',
        ),
        elevation: 1,
        centerTitle: false,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Consumer(
      builder: (context, ref, child) {
        final MyPagePresenter myPagePresenter = ref.read(
          myPagePresenterProvider.notifier,
        );
        final AsyncValue<MyPageViewModel> myPageViewModel = ref.watch(
          myPagePresenterProvider,
        );
        return myPageViewModel.when(
          data: (MyPageViewModel myPageViewModel) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 8),
                      Icon(size: 80, Icons.account_circle_outlined),
                      const SizedBox(width: 16),
                      Text(myPageViewModel.name),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          context.go('/login');
                        },
                        icon: Icon(Icons.logout),
                        label: Text('Sign Out'),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListTile(
                    title: Text(
                      'Total Minutes : ${myPageViewModel.totalMinutes}',
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListTile(
                    title: Text('My Vols : ${myPageViewModel.totalVols}'),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                SliverToBoxAdapter(
                  child: TextButton(
                    onPressed: myPagePresenter.updateVols,
                    child: const Text('Refresh'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: VolListTile(
                          title: myPageViewModel.vols[index].title,
                          description: myPageViewModel.vols[index].description,
                          image: CachedNetworkImageProvider(
                            myPageViewModel.vols[index].images[0],
                          ),
                          date: myPageViewModel.vols[index].dateString,
                          minutes: myPageViewModel.vols[index].minutes,
                        ),
                      );
                    },
                    childCount: myPageViewModel.vols.length,
                  ),
                ),
              ],
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Column(
              children: <Widget>[
                // Text('Error: $error'),
                TextButton(
                  onPressed: myPagePresenter.updateVols,
                  child: const Text('Refresh'),
                ),
              ],
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
