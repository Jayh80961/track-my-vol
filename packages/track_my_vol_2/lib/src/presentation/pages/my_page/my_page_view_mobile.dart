import 'dart:async';

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
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
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
                      const Icon(size: 80, Icons.account_circle_outlined),
                      const SizedBox(width: 16),
                      Text(myPageViewModel.name),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          if (context.mounted) {
                            context.go('/login');
                          }
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text('Sign Out'),
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
                      'Approved Minutes : ${myPageViewModel.approvedMinutes}',
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
                    title: Text(
                      'My Approved Vols : ${myPageViewModel.approvedVols}',
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListTile(
                    title: Text(
                      'My In Review Vols : ${myPageViewModel.totalVols - myPageViewModel.approvedVols}',
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
                          onLongPress: () {
                            unawaited(
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Delete'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => context.pop(),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await myPagePresenter.deleteVol(
                                            myPageViewModel.vols[index].id,
                                          );
                                          if (context.mounted) {
                                            context.pop();
                                          }
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                          title: myPageViewModel.vols[index].title,
                          category: myPageViewModel.vols[index].category,
                          fullName: myPageViewModel.vols[index].fullName,
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
