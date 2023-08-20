import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'post_page_presenter.dart';
import 'post_page_view_model.dart';

class PostPageViewMobile extends ConsumerWidget {
  const PostPageViewMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PostPageViewModel postPageViewModel = ref.watch(
      postPagePresenterProvider,
    );
    final PostPagePresenter postPagePresenter = ref.read(
      postPagePresenterProvider.notifier,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track My Vol'),
        elevation: 1,
        centerTitle: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: ElevatedButton(
          onPressed: () async {
            if (postPageViewModel.isNotValid) {
              const SnackBar snackBar = SnackBar(
                content: Text('Check the input'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              await postPagePresenter.submit();
              if (context.mounted) {
                const SnackBar snackBar = SnackBar(
                  content: Text('Submitted!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.pop();
              }
            }
          },
          child: const Center(
            child: Text('Submit'),
          ),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PostPageViewModel postPageViewModel = ref.watch(
          postPagePresenterProvider,
        );
        final PostPagePresenter postPagePresenter = ref.read(
          postPagePresenterProvider.notifier,
        );
        final ScrollController scrollController = ScrollController();
        final OutlineInputBorder outlinedBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        );
        return Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 60),
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildPhotoContainer(),
                      const SizedBox(height: 24),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'title',
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                        readOnly: postPageViewModel.isSubmitting,
                        enabled: !postPageViewModel.isSubmitting,
                        onChanged: postPagePresenter.titleOnChanged,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'description',
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                        readOnly: postPageViewModel.isSubmitting,
                        enabled: !postPageViewModel.isSubmitting,
                        onChanged: postPagePresenter.descriptionOnChanged,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'full-name',
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                        readOnly: postPageViewModel.isSubmitting,
                        enabled: !postPageViewModel.isSubmitting,
                        onChanged: postPagePresenter.fullNameOnChanged,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'category',
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                        readOnly: postPageViewModel.isSubmitting,
                        enabled: !postPageViewModel.isSubmitting,
                        onChanged: postPagePresenter.categoryOnChanged,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: TextEditingController(
                          text: postPageViewModel.dateString,
                        ),
                        onTap: () async {
                          final DateTime? value = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365 * 10),
                            ),
                          );
                          if (value != null) {
                            postPagePresenter.dateOnChanged(value);
                          }
                        },
                        readOnly: true,
                        enabled: !postPageViewModel.isSubmitting,
                        decoration: InputDecoration(
                          labelText: 'date',
                          suffixIcon: const Icon(Icons.date_range_outlined),
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: TextEditingController(
                          text: postPageViewModel.startTime.toString(),
                        ),
                        onTap: () async {
                          final TimeOfDay? value = await showTimePicker(
                            context: context,
                            initialTime: postPageViewModel.startTime,
                          );
                          if (value != null) {
                            postPagePresenter.startOfTimeChanged(value);
                          }
                        },
                        readOnly: true,
                        enabled: !postPageViewModel.isSubmitting,
                        decoration: InputDecoration(
                          labelText: 'Start of Time',
                          suffixIcon: const Icon(Icons.date_range_outlined),
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: TextEditingController(
                          text: postPageViewModel.endTime.toString(),
                        ),
                        onTap: () async {
                          final TimeOfDay? value = await showTimePicker(
                            context: context,
                            initialTime: postPageViewModel.endTime,
                          );
                          if (value != null) {
                            postPagePresenter.endOfTimeChanged(value);
                          }
                        },
                        readOnly: true,
                        enabled: !postPageViewModel.isSubmitting,
                        decoration: InputDecoration(
                          labelText: 'End of Time',
                          suffixIcon: const Icon(Icons.date_range_outlined),
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: TextEditingController(
                          text: postPageViewModel.duration.toString(),
                        ),
                        decoration: InputDecoration(
                          labelText: 'hours',
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                          disabledBorder: outlinedBorder,
                        ),
                        readOnly: true,
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (postPageViewModel.isSubmitting)
              const Center(child: CircularProgressIndicator())
          ],
        );
      },
    );
  }

  Widget buildPhotoContainer() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final PostPageViewModel postPageViewModel = ref.watch(
          postPagePresenterProvider,
        );
        final PostPagePresenter postPagePresenter = ref.read(
          postPagePresenterProvider.notifier,
        );
        final ScrollController scrollController = ScrollController();
        final List<Widget> imageWidgets = [];
        for (final XFile image in postPageViewModel.images) {
          if (kIsWeb) {
            imageWidgets.add(
              Container(
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image(
                  width: 80,
                  height: 80,
                  image: NetworkImage(image.path),
                ),
              ),
            );
          } else {
            imageWidgets.add(
              Container(
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image(
                  width: 80,
                  height: 80,
                  image: FileImage(File(image.path)),
                ),
              ),
            );
          }
        }
        return Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          scrollbarOrientation: ScrollbarOrientation.top,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 8),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final List<XFile> images = await picker.pickMultiImage();
                    postPagePresenter.addImages(images);
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.photo_camera,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ...imageWidgets,
              ],
            ),
          ),
        );
      },
    );
  }
}
