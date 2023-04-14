enum Users {
  faculty,
  student,
}

extension AsString on Users {
  String get value {
    switch (this) {
      case Users.faculty:
        return "faculty";
      case Users.student:
        return "student";
      default:
        return "student";
    }
  }
}

Users userFromString(String value) {
  switch (value) {
    case "faculty":
      return Users.faculty;
    case "student":
      return Users.student;
    default:
      return Users.student;
  }
}
