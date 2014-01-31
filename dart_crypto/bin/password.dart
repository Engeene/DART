import 'dart:crypto';

void main() {

  if(login("lamiapassword1")) {
    print("Sei autenticato!");
  } else {
    print("Password errata.");
  }
}

bool login(String password) {
  final String salt = "4ll3b041c";
  String hashMemorizzato = "e16c72318c0665c2dcfca6e988133e54";
  String passwordHash;
  String saltedPasswordHash;
  List<int> passwordBytes;
  MD5 md = new MD5();
  md.add(password.codeUnits);
  passwordHash = CryptoUtils.bytesToHex(md.close());
  md = md.newInstance();
  md.add(( passwordHash + salt ).codeUnits);
  saltedPasswordHash = CryptoUtils.bytesToHex(md.close());
  if ( saltedPasswordHash == hashMemorizzato ) return true;
  return false;
}