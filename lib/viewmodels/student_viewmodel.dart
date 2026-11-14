import 'package:flutter/foundation.dart'; // For ChangeNotifier
import '../models/student_model.dart';

class StudentViewModel extends ChangeNotifier {
  // PRIVATE Model instance - the SINGLE SOURCE OF TRUTH
  // The underscore (_) means: "This is private - don't touch from outside"
  StudentModel _student = StudentModel(
    name: "Koketso",
    currentSubject: "TPG316C",
    subjects: ["TPG316C", "SOD316C", "CMN316C", "ITS316C"],
    currentIndex: 0,
    grade: 80,
  );
  // PUBLIC GETTERS - controlled access to data
  // The View can READ but not directly WRITE
  String get studentName => _student.name;
  String get currentSubject => _student.currentSubject;
  List<String> get subjects => _student.subjects;
  int get currentIndex => _student.currentIndex;
  int get grade => _student.grade;
  // LOGIC METHOD - contains the business logic
  // This is the SAME logic from Unit 1, but now in the right place
  void changeSubject() {
    // 1. Calculate new values (same as Unit 1)
    int newIndex = (_student.currentIndex + 1) % _student.subjects.length;
    String newSubject = _student.subjects[newIndex];
    // 2. Create NEW StudentModel with updated values
    _student = _student.copyWith(
      currentIndex: newIndex,
      currentSubject: newSubject,
    );
    notifyListeners();
  }

  //Validation for grade to not pass 100
  void increaseGrade() {
    if (_student.grade < 100) {
      _student = _student.copyWith(grade: _student.grade + 5);
      notifyListeners();
    }
  }

  //Validation for grade to not be below 0
  void decreaseGrade() {
    if (_student.grade > 0) {
      _student = _student.copyWith(grade: _student.grade - 5);
      notifyListeners();
    }
  }
}

void increaseGrade() {
  
}

void decreaseGrade() {}
