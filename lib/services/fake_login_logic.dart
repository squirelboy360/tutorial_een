
//service
class FakeLoginLogic {
  bool login(passwordCharactersNum, String email) {
    if (email.isNotEmpty &&
        passwordCharactersNum.length > 6 &&
        email.contains("@")) {
      return true;
    } else {
      return false;
    }
  }
}
