import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
                      const Text('Full-name *'),
                      DropdownButtonFormField<String>(
                        value: postPageViewModel.fullName.isEmpty
                            ? null
                            : postPageViewModel.fullName,
                        hint: const Text('Full-name *'),
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'John Park',
                            child: Text('12th John Park'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Hyunwoo (Alex) Tak',
                            child: Text('12th Hyunwoo (Alex) Tak'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Seojun (Chris) Kim',
                            child: Text('12th Seojun (Chris) Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Minseo (MK) Kwon',
                            child: Text('12th Minseo (MK) Kwon'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Lorene Yubin Lee',
                            child: Text('12th Lorene Yubin Lee'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Tomas Choi',
                            child: Text('12th Tomas Choi'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Seyoon (Eric) Kim',
                            child: Text('12th Seyoon (Eric) Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Sehyun (Aiden) Kim',
                            child: Text('12th Sehyun (Aiden) Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Seungwoo (Alvin) Son',
                            child: Text('12th Seungwoo (Alvin) Son'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Nayun Kim',
                            child: Text('11th Nayun Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Sage Seohyun Park',
                            child: Text('11th Sage Seohyun Park'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Esther Shin',
                            child: Text('11th Esther Shin'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Brian Jooha Lee',
                            child: Text('11th Brian Jooha Lee'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Clara Yoon Paick',
                            child: Text('11th Clara Yoon Paick'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Joyce Kwack',
                            child: Text('11th Joyce Kwack'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Kenneth Hyo-Sung Kim',
                            child: Text('11th Kenneth Hyo-Sung Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Jiyu Kim',
                            child: Text('11th Jiyu Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Yeongsu Kim',
                            child: Text('10th Yeongsu Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Yenna Park',
                            child: Text('10th Yenna Park'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Juliette Danbi Yoon',
                            child: Text('10th Juliette Danbi Yoon'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'John Lee',
                            child: Text('10th John Lee'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Ellie Yeon-woo Kim',
                            child: Text('10th Ellie Yeon-woo Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Alexander Chu',
                            child: Text('10th Alexander Chu'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Emily Haeun Cho',
                            child: Text('10th Emily Haeun Cho'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Katie Kim',
                            child: Text('10th Katie Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Yuri (Ticket) Lee',
                            child: Text('10th Yuri (Ticket) Lee'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Seungah (Sun) Lee',
                            child: Text('10th Seungah (Sun) Lee'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Jeonghoo Hyun',
                            child: Text('10th Jeonghoo Hyun'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Jihoo (Stella)  Hyun',
                            child: Text('9th Jihoo (Stella)  Hyun'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Jiwon (Angie)  Kim',
                            child: Text('9th Jiwon (Angie)  Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Yaeji  Kim',
                            child: Text('9th Yaeji  Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Nanu (Emily)  Kim',
                            child: Text('9th Nanu (Emily)  Kim'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Hayden  Tong',
                            child: Text('9th Hayden  Tong'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Ethan Shin',
                            child: Text('9th Ethan Shin'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Gunwoo Jeng',
                            child: Text('9th Gunwoo Jeng'),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        decoration: InputDecoration(
                          border: outlinedBorder,
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                        onChanged: (String? value) {
                          if (value != null) {
                            postPagePresenter.fullNameOnChanged(value);
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text('Category *'),
                      DropdownButtonFormField<String>(
                        value: postPageViewModel.category.isEmpty
                            ? null
                            : postPageViewModel.category,
                        hint: const Text('Category *'),
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'Hosting',
                            child: Text('Hosting'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Event',
                            child: Text('Event'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Meeting',
                            child: Text('Meeting'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Project',
                            child: Text('Project'),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        decoration: InputDecoration(
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                          border: outlinedBorder,
                        ),
                        onChanged: (String? value) {
                          if (value != null) {
                            postPagePresenter.categoryOnChanged(value);
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Title - optional',
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
                          labelText: 'Description - optional',
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
                          labelText: 'Suggestion - optional',
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                        readOnly: postPageViewModel.isSubmitting,
                        enabled: !postPageViewModel.isSubmitting,
                        onChanged: postPagePresenter.suggestionOnChanged,
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
                          labelText: 'Date *',
                          suffixIcon: const Icon(Icons.date_range_outlined),
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: TextEditingController(
                          text: postPageViewModel.startTime.format(context),
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
                          labelText: 'Start of Time *',
                          suffixIcon: const Icon(Icons.access_time),
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: TextEditingController(
                          text: postPageViewModel.endTime.format(context),
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
                          labelText: 'End of Time *',
                          suffixIcon: const Icon(Icons.access_time),
                          enabledBorder: outlinedBorder,
                          focusedBorder: outlinedBorder,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: TextEditingController(
                          text: '${postPageViewModel.duration.inMinutes}',
                        ),
                        decoration: InputDecoration(
                          labelText: 'Minutes - auto',
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
        final List<Widget> imageWidgets = <Widget>[];
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
