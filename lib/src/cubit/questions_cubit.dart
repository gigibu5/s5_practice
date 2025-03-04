import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/category.dart';
import '../models/question.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  Future<void> load() async {
    final s = await rootBundle.loadString('assets/questions.json');
    final decoded = jsonDecode(s);
    final c = (decoded['categories'] as List)
        .map((e) => Category.fromJson(e))
        .toList();
    final q = (decoded['questions'] as List)
        .map((e) => Question.fromJson(e))
        .toList();
    emit(QuestionsLoaded(c, q));
  }
}
