import ddf.minim.*;            //音楽読み込み用↓
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



Minim minim;
AudioSample player;
AudioSample item;
AudioSample FL;
AudioPlayer loopSound;


void setup () {
  size (500, 500);   //画面サイズ変更
  minim = new Minim(this);  //音楽データの初期化
  player = minim.loadSample("ayasii.mp3"); //正解時SE読み込み
  item = minim.loadSample("item.mp3");  //アイテムSE読み込み
  FL = minim.loadSample("FL.mp3");
  loopSound = minim.loadFile("BGM.mp3");  //BGM読み込み
  loopSound.loop();      //BGMのループ宣言
  img = loadImage("item.png");  //アイテム画像の読み込み↓
  img2 = loadImage("item2.png");
  img3 = loadImage("Bitem.png");
  img4 = loadImage("Bitem2.png");
  img5 = loadImage("SCAUP.png");
  img6 = loadImage("SCADN.png");
  img7 = loadImage("FL.png");
  state = 0;
  SCA_Table = loadTable("data/CSV/SCA.csv", "header");
  PFont font = createFont("MS Gothic", 48, true);
  textFont(font);

  imageMode(CENTER);  //画像の座標指定方法変更
}
int A=  int(random(150, 350)); //三角形のx座標
int B=  int(random(150, 350)); //円のx座標
int C = int(random(150, 350)); //四角形のx座標
int D = int(random(0, 3));  //図形の決定
int E = int(random(150, 350));  //三角形のy座標
int F=  int(random(150, 350));  //円のy座標
int G=  int(random(150, 350));  //四角形のy座標
int H=  int(random(100, 400));  //アイテム1のx座標
int I=  int(random(100, 400));  //アイテム1のy座標
int J=  int(random(100, 400));  //アイテム2のx座標
int K=  int(random(100, 400));  //アイテム2のy座標
int L=  int(random(100, 400));  //アイテム3のx座標
int N=  int(random(100, 400));  //アイテム3のy座標
int M=  int(random(100, 400));  //アイテム4のx座標
int O=  int(random(100, 400));  //アイテム4のy座標
int P=  int(random(100, 400));
int Q=  int(random(100, 400));
int R=  int(random(100, 400));
int S=  int(random(100, 400));
int U=  int(random(100, 400));
int X=  int(random(100, 400));
int IK= int(random(1, 25));  //アイテムの出現確立
int FK= int(random(1, 50));
int SCAPL = 1;
int CLC = 0; 
int numberScore;
int T = 5000;  //残り時間
int SCA = 0;  //スコア
Table SCA_Table;
int state = 0;
int nextstate = 0;
PImage img;  //アイテム画像用の変数宣言↓
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
String Ti;  //残り時間表示用の文字型宣言
String SCAA;  //スコア表示用の文字型宣言

void mousePressed() {
  if (D==0) {
    if ((mouseX-A)*(mouseX-A)+(mouseY-E-20)*(mouseY-E-20)<=14*14) {  //三角形のあたり判定↓
      player.trigger();  
      A = int(random(150, 350));
      B = int(random(150, 350));
      C = int(random(150, 350));
      D = int(random(0, 3));
      E = int(random(150, 350));
      F = int(random(150, 350));
      G = int(random(150, 350));
      H = int(random(100, 400));
      I = int(random(100, 400));
      IK= int(random(1, 25));
      FK= int(random(1, 50));
      SCA = SCA+SCAPL;
      if (CLC > 0) {
        CLC -= 1;
      }
    }
  }
  if (D==1) {
    if ((mouseX-B)*(mouseX-B)+(mouseY-F)*(mouseY-F)<=10*10) {  //円のあたり判定↓
      player.trigger();
      A = int(random(150, 350));
      B = int(random(150, 350));
      C = int(random(150, 350));
      D = int(random(0, 3));
      E = int(random(150, 350));
      F = int(random(150, 350));
      G = int(random(150, 350));
      H= int(random(100, 400));
      I= int(random(100, 400));
      IK= int(random(1, 25));
      FK= int(random(1, 50));
      SCA = SCA + SCAPL;
      
      if (CLC > 0) {
        CLC -= 1;
      }
    }
  }
  if (D==2) {

    if ((mouseX-C)*(mouseX-C)+(mouseY-G)*(mouseY-G)<=10*10) {  //四角形のあたり判定↓
      player.trigger();
      A = int(random(150, 350));
      B = int(random(150, 350));
      C = int(random(150, 350));
      D = int(random(0, 3));
      E = int(random(150, 350));
      F = int(random(150, 350));
      G = int(random(150, 350));
      H= int(random(100, 400));
      I= int(random(100, 400));
      IK= int(random(1, 25));
      FK= int(random(1, 50));
      SCA = SCA + SCAPL;
     
      if (CLC > 0) {
        CLC -= 1;
      }
    }
  }
  if ((mouseX-H)*(mouseX-H)+(mouseY-I)*(mouseY-I)<=20*20) {  //アイテムのあたり判定↓
    if (IK==10) {
      item.trigger();
      IK= 0;
      T = T+1000;
    }
  }
  if ((mouseX-J)*(mouseX-J)+(mouseY-K)*(mouseY-K)<=20*20) {
    if (IK==9) {
      item.trigger();
      IK= 0;
      T = T+500;
    }
  }
  if ((mouseX-L)*(mouseX-L)+(mouseY-N)*(mouseY-N)<=20*20) {
    if (IK==8) {
      item.trigger();
      IK= 0;
      T = T-1000;
    }
  }
  if ((mouseX-M)*(mouseX-M)+(mouseY-O)*(mouseY-O)<=20*20) {
    if (IK==7) {
      item.trigger();
      IK= 0;

      T = T-500;
    }
  }
    if ((mouseX-P)*(mouseX-P)+(mouseY-Q)*(mouseY-Q)<=10*10) {
      if (IK==6) {
        item.trigger();
        IK= 0;

        CLC = 5;
      }
    
  }
  if ((mouseX-R)*(mouseX-R)+(mouseY-S)*(mouseY-S)<=10*10) {
      if (IK==5) {
        item.trigger();
        IK= 0;

        SCA = SCA-10;
      }
    
  }
   if ((mouseX-U)*(mouseX-U)+(mouseY-X)*(mouseY-X)<=20*20) {  //アイテムのあたり判定↓
    if (FK==5) {
      FL.trigger();
      FK= 0;
      SCA = SCA+10;
    }
  }
} 


void draw() {
  nextstate = 0;
  if (state==0) {
    nextstate = title();
  } else if (state==1) {
    nextstate = game();
  } else if (state==2) {
    nextstate = rank();
  }
  state = nextstate;
}

int title() {
  fill(255);
  T = 5000;
  SCA = 0;
  background (0);
  textSize(30);
  text("Find Shadow", 100, 100);
  textSize(15);
  text("Zキー　ゲームスタート", 120, 200);
  text("Xキー　ランキングを見る", 120, 220);
  text("Eキー　ゲーム終了", 120, 240);
  if (keyPressed && key == 'z') {
    return 1;
  } else if (keyPressed && key == 'x') {
    return 2;
  } else if (keyPressed && key == 'e') {
    exit();
  }

  return 0;
}


int game() {
  if (T>0) {
    fill(255);
    background (0, 0, 0);
    stroke (0, 0, 0);
    fill (200, 200, 200);
    ellipse(mouseX, mouseY, 100, 100);  //ライト大
    fill (250, 250, 250);
    stroke (225, 225, 225);
    ellipse(mouseX, mouseY, 50, 50);  //ライト小
    fill (0, 0, 0);
    stroke (0, 0, 0);
    strokeWeight (3);
    triangle(A+20, E+25, A-20, E+25, A, E); //三角形の表示
    ellipse(B, F, 20, 20);  //円の表示
    quad(C+10, G-10, C-10, G-10, C-10, G+10, C+10, G+10);  //四角形の表示
    fill(255, 255, 255);
    textSize(15);
    text ("マウスカーソル　明りの移動", 0, 480);  //説明文の表示↓
    text ("図形をクリック　スコア獲得", 0, 460);
    text ("緑のマークは良いアイテム、赤いマークは悪いアイテム", 0, 497);
    if (D == 0) {  //対象物の指定（ランダム）↓
      textSize(15);
      text ("三角形を探せ", 300, 30);
    } else if (D == 1) {
      textSize(15);
      text ("円を探せ", 300, 30);
    } else {
      textSize(15);
      text ("四角形を探せ", 300, 30);
    }
    textSize(16);
    Ti =String.format( "残り時間 %d", T/100);  //残り時間の型変換
    SCAA = String.format("スコア %d", SCA);  //スコアの型変換
    text (Ti, 400, 460);  //残り時間の表示
    text (SCAA, 400, 475);  //スコアの表示
    T -= 1;  //残り時間減少用の式
    if (IK==10) {  //アイテムの出現判定↓
      image(img, H, I);
    }
    if (IK==9) {
      image(img2, J, K);
    }
    if (IK==8) {
      image(img3, L, N);
    }
    if (IK==7) {
      image(img4, M, O);
    }
    if (IK==6) {
      image(img5, P, Q);
    }
    if (IK==5) {
      image(img6, R, S);
    }
    if(FK==5){
      image(img7,U,X);
      text("妖精出現中！！",300,45);
    }
    if (SCA<0) {
      SCA = 0;
    }
  }
  if (CLC > 0) {
    SCAPL = 2;
  } else {
    SCAPL = 1;
  }
  if (T==0) {  //残り時間が0になったらスコアを表示する↓
    background(0, 0, 0);
    textSize(50);
    text(SCAA, 150, 250);
    textSize(16);
    text("Tキー　タイトルへ戻る", 50, 50);
    if (keyPressed && key == 't') {
      SCA_MEMO();
      return 0;
    }
  }
  return 1;
}

int rank() {

  background(0);
  for (int j = 0; j < SCA_Table.getColumnCount(); j++) {
    String numberScore = (j +1)+"位" +SCA_Table.getString(0, j)+ "\n";
    if (j==0) {
      fill(255, 0, 0);
    } else if (j == 9) {
      fill(0, 0, 255);
    } else {
      fill(255);
    }
    text(numberScore, width / 2, 50 +(j +1) *40);
  }
  textSize(16);
  text("Tキー　タイトルへ戻る", 50, 50);
  if (keyPressed && key == 't') {
    return 0;
  }
  return 2;
}


void SCA_MEMO() {

  int SR = SCA_Table.getColumnCount();
  for ( int n =  SCA_Table.getColumnCount() -1; n >= 0; n--) {
    int numberScore = int(SCA_Table.getString(0, n));
    if (numberScore < SCA) {
      SR = n;
    } else {
      break;
    }
  }
  for (int n = SR; n < SCA_Table.getColumnCount(); n++) {
    int scoreNumber = int(SCA_Table.getString(0, n));
    SCA_Table.setString(0, n, str(SCA));
    SCA = scoreNumber;
    saveTable(SCA_Table, "Data/CSV/SCA.csv");
  }
}


void stop()  //BGMなどの音楽の停止↓
{
  player.close();  
  minim.stop();
  super.stop();
}