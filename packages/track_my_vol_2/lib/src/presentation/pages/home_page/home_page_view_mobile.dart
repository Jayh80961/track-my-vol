import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';
import 'home_page_presenter.dart';
import 'home_page_view_model.dart';

class HomePageViewMobile extends StatelessWidget {
  const HomePageViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track My Vol',
        ),
        elevation: 1,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.go('/my');
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.go('/post');
        },
      ),
    );
  }

  Widget buildBody() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final HomePagePresenter homePagePresenter = ref.read(
          homePagePresenterProvider.notifier,
        );
        final AsyncValue<HomePageViewModel> homePageViewModel = ref.watch(
          homePagePresenterProvider,
        );
        return homePageViewModel.when(
          data: (HomePageViewModel homePageViewModel) {
            return RefreshIndicator(
              onRefresh: () async {
                const SnackBar snackBar = SnackBar(
                  content: Text('Refreshed!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                unawaited(homePagePresenter.updateVols());
              },
              displacement: 10,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: TextButton(
                      onPressed: homePagePresenter.updateVols,
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
                            title: homePageViewModel.vols[index].title,
                            description:
                                homePageViewModel.vols[index].description,
                            image: CachedNetworkImageProvider(
                              homePageViewModel.vols[index].images[0],
                            ),
                            date: homePageViewModel.vols[index].dateString,
                            minutes: homePageViewModel.vols[index].minutes,
                          ),
                        );
                      },
                      childCount: homePageViewModel.vols.length,
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Column(
              children: <Widget>[
                // Text('Error: $error'),
                TextButton(
                  onPressed: homePagePresenter.updateVols,
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
