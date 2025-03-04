part of 'generator_cubit.dart';

enum GeneratorType {
  practice,
  test,
}

class GeneratorState extends Equatable {
  final int practiceQuestionCount;
  final int testQuestionCount;
  final bool singleCategory;
  final Category? category;
  final Duration timerDuration;

  const GeneratorState({
    this.practiceQuestionCount = 5,
    this.testQuestionCount = kDebugMode ? 6 : 60,
    this.singleCategory = false,
    this.category,
    this.timerDuration = const Duration(minutes: kDebugMode ? 9 : 90),
  });

  GeneratorState copyWith({
    GeneratorType? type,
    int? practiceQuestionCount,
    int? testQuestionCount,
    bool? singleCategory,
    Category? category,
    Duration? timerDuration,
  }) {
    final newSingleCategory = singleCategory ?? this.singleCategory;

    return GeneratorState(
      practiceQuestionCount:
          practiceQuestionCount ?? this.practiceQuestionCount,
      testQuestionCount: testQuestionCount ?? this.testQuestionCount,
      singleCategory: newSingleCategory,
      category: newSingleCategory ? (category ?? this.category) : null,
      timerDuration: timerDuration ?? this.timerDuration,
    );
  }

  @override
  List<Object?> get props => [
        practiceQuestionCount,
        testQuestionCount,
        singleCategory,
        category,
        timerDuration,
      ];
}
