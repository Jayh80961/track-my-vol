import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/vol_model.dart';
import 'post_page_view_model.dart';

part 'post_page_presenter.g.dart';

@riverpod
class PostPagePresenter extends _$PostPagePresenter {
  @override
  PostPageViewModel build() {
    return PostPageViewModel(
      images: <XFile>[],
      title: '',
      description: '',
      horus: 0,
      category: '',
      date: DateTime.now(),
      fullName: '',
      isSubmitting: false,
    );
  }

  void titleOnChanged(String value) {
    state = state.copyWith(title: value);
  }

  void descriptionOnChanged(String value) {
    state = state.copyWith(description: value);
  }

  void horusOnChanged(String value) {
    state = state.copyWith(horus: int.tryParse(value) ?? 0);
  }

  void categoryOnChanged(String value) {
    state = state.copyWith(category: value);
  }

  void fullNameOnChanged(String value) {
    state = state.copyWith(fullName: value);
  }

  void dateOnChanged(DateTime value) {
    state = state.copyWith(date: value);
  }

  void addImages(List<XFile> images) {
    state = state.copyWith(images: <XFile>[...state.images, ...images]);
  }

  Future<void> submit() async {
    if (state.isNotValid) {
      return;
    }
    state = state.copyWith(isSubmitting: true);
    final List<String> imageUrls = <String>[];
    final Reference ref = FirebaseStorage.instance.ref('/vol_images');
    for (int index = 0; index < state.images.length; index++) {
      final XFile image = state.images[index];
      final Uint8List bytes = await image.readAsBytes();
      final Reference imageRef = ref
          .child('/${state.date.microsecondsSinceEpoch}-$index-${image.name}');
      await imageRef.putData(bytes);
      final String imageUrl = await imageRef.getDownloadURL();
      imageUrls.add(imageUrl);
    }
    final VolModel volModel = VolModel(
      images: imageUrls,
      title: state.title,
      description: state.description,
      horus: state.horus,
      year: state.date.year,
      month: state.date.month,
      day: state.date.day,
      fullName: state.fullName,
      category: state.category,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isApproved: false,
      id: '',
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
    );
    await FirebaseFirestore.instance.collection('vols').add(
          volModel.toFirestore(),
        );
    state = state.copyWith(isSubmitting: false);
  }
}
