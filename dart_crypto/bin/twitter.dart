import 'dart:uri';
import 'dart:crypto';
import 'dart:math';

void main() {
  print(getRequestUrl("CONSUMER_KEY","CONSUMER_SECRET"));
}

String getRequestUrl(String consumerKey, String consumerSecret){
  Random rndm = new Random();

  DateTime date = new DateTime.now();
  String requestTokenUrl = "https://api.twitter.com/oauth/request_token";
  //String authorizeUrl = "https://api.twitter.com/oauth/authorize";
  int oauthTimestamp = date.millisecondsSinceEpoch~/1000;

  MD5 md5 = new MD5();
  md5.add([rndm.nextInt(2)]);

  String nonce = CryptoUtils.bytesToHex(md5.close());
  String oauthSignatureMethod = "HMAC-SHA1";
  String oauthVersion = "1.0";

  String sigBase = "GET&" + encodeUriComponent(requestTokenUrl) + "&"
      + encodeUriComponent(
          "oauth_consumer_key=" + encodeUriComponent(consumerKey)
          + "&oauth_nonce=" + encodeUriComponent(nonce)
          + "&oauth_signature_method=" + encodeUriComponent(oauthSignatureMethod)
          + "&oauth_timestamp=" + oauthTimestamp.toString()
          + "&oauth_version=" + oauthVersion
          );

  String sigKey = consumerSecret + "&";

  HMAC hmac = new HMAC(new SHA1(), sigKey.codeUnits);
  hmac.add(sigBase.codeUnits);

  String oauthSig = CryptoUtils.bytesToBase64((hmac.close()));
  String requestUrl = requestTokenUrl + "?"
    + "oauth_consumer_key=" + consumerKey
    + "&oauth_nonce=" + nonce
    + "&oauth_signature_method=" + oauthSignatureMethod
    + "&oauth_timestamp=" + oauthTimestamp.toString()
    + "&oauth_version=" + oauthVersion
    + "&oauth_signature=" + encodeUriComponent(oauthSig) ;

  return requestUrl;

}

