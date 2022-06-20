/*
Challenge: Pass or Fail

Meydan Okuma: Başarılı veya Başarısız
Kendinizi test edin ve şimdiye kadar öğrendiklerinizi bu meydan 
okumada uygulayın.
*/
main() {
  var scores = [50, 96, 57, 68, 52, 87, 97, 43, 81, 30, 75, 60, 59];
  var percentage = 81;

  // Calculate the average class score
  var sum = scores[0] + scores[1] + scores[2] + scores[3] + scores[4] + scores[5] + scores[6] + scores[7] + scores[8] + scores[9] + scores[10] + scores[11] + scores[12];
  var average = sum/13;

  // Check if student has passed or failed
  if (percentage >= 60 && percentage > (average-5)){ 
    print("pass");
  }else { 
    print("fail");
  }
}
