import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;
import spout.*;

PImage tp_renwu;
import processing.video.*;

Movie movie;

int position = 0;
int[]  x =new int[50];
int []  y =new int[50];
int a;
int s;
int d;
int f;
int g;

int qX1=100;
int qY1=100;
int zfx1=87;
int zfy1=87;

int  qX2=200;
int qY2=50;
int zfx2=187;
int zfy2=37;

int  qX3=300;
int qY3=100;
int zfx3=287;
int zfy3=87;

int  qX4=350;
int qY4=100;
int zfx4=337;
int zfy4=87;

int  qX5=500;
int qY5=100;
int zfx5=487;
int zfy5=87;

int  qX6=550;
int qY6=100;
int zfx6=537;
int zfy6=87;

int  qX7=200;
int qY7=300;
int zfx7=187;
int zfy7=287;

int  qX8=300;
int qY8=200;
int zfx8=287;
int zfy8=187;

int  qX9=400;
int qY9=300;
int zfx9=387;
int zfy9=287;

int  qX10=500;
int qY10=500;
int zfx10=487;
int zfy10=487;

int  qX11=400;
int qY11=600;
int zfx11=387;
int zfy11=587;



int qX12=200;
int qY12=650;
int zfx12=187;
int zfy12=637;

int qX13=300;
int qY13=600;
int zfx13=287;
int zfy13=587;

int qX14=50;
int qY14=50;
int zfx14=37;
int zfy14=37;

int qX15=50;
int qY15=500;
int zfx15=37;
int zfy15=487;

int qX=100;
int qY=100;
int zfx=87;
int zfy=87;

KinectPV2 kinect;

import ddf.minim.*;
Minim minim;
AudioPlayer player;

PImage yi;
PImage rt_leg;
PImage lf_leg;
PImage lf_foot;
PImage rt_foot;
PImage hat;
PImage lf_up_arm;
PImage rt_up_arm;
PImage low_l_arm;
PImage low_r_arm;
PImage shoulderr;
PImage shoulderl;
PImage cap;
PImage shanzi;

PImage img1;
PImage img2; 
PImage img3; 
PImage img4; 
PImage img5; 
PImage img6;
PImage img7; 
PImage img8; 
PImage img9; 
PImage img10;
//import processing.video.*;
import java.awt.*;
ArrayList<PImage> faceList;
Rectangle[] faces;
int faceCount = 0;
float scl = 6;
float xx, yy;
float min = 0.2;
float max = 1;
float target_x= 0;
float target_y= 0;
float target_z= 0;
int number = 0;
int time = 0;
float now = 1;
int number666 = 1;
int index = 0;
float facelg = 0;
float facewd = 0;
float ual_degree;
float ual_degree1;
float ull_degree;
float ulr_degree;
float lll_degree;
float llr_degree;
float uar_degree;
float lal_degree;
float lar_degree;
float wrist_degree;


float x_cod_neck;
float y_cod_neck;
float x_cod_shouldermid;
float y_cod_shouldermid;
float x_cod_centerhip;
float y_cod_centerhip;
float x_cod_spinemid;
float y_cod_spinemid;

float x_cod_elbowleft;
float y_cod_elbowleft;
float x_cod_elbowright;
float y_cod_elbowright;

float x_cod_hipleft;
float y_cod_hipleft;
float x_cod_hipright;
float y_cod_hipright;

float x_cod_kneeright;
float y_cod_kneeright;
float x_cod_kneeleft;
float y_cod_kneeleft;

float x_cod_ankleleft;
float y_cod_ankleleft;
float x_cod_ankleright;
float y_cod_ankleright;
float x_cod_footright;
float y_cod_footright;


float x_cod_shoulderleft;
float y_cod_shoulderleft;
float x_cod_shoulderright;
float y_cod_shoulderright;
float x_cod_wristleft;
float y_cod_wristleft;
float x_cod_wristright;
float y_cod_wristright;
//length auto change by diff user
float up_leg_lg;
float leg_foot_lg;
float up_arm_lg;
float lower_arm_lg;
float neck_hip_lg;
float shoulder_lg;
float neck_lg;
PImage body;
PImage bodyRGB;

Spout spout;

void movieEvent(Movie m) {
  m.read();
}
void setup() {
  rectMode(CENTER);
  minim=new Minim(this);
  player= minim.loadFile("yinyu.mp3");
  //player.loop();
  size (1200, 900, P3D);
  movie = new Movie(this, "bg.mp4");
  image(movie,0,0,width,height);
  movie.loop();
  //tp_renwu=  loadImage("renwu.jpg");
  spout = new Spout(this);
  spout.createSender("Processing Kinect");
  kinect = new KinectPV2(this);
  
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  kinect.enableHDFaceDetection(true);
  kinect.enableColorImg(true);
  kinect.init();
  
  cap = loadImage("cap.png");
  yi=  loadImage("yi.png");
  shoulderl = loadImage("sholderleft.png");
  shoulderr = loadImage("sholderright.png");
  //yi.resize(150, 256);
  rt_leg=  loadImage("rt_leg.png");
  //ku.resize(150, 256);
  lf_leg=  loadImage("lf_leg.png");
  lf_foot=  loadImage("left_foot.png");
  rt_foot=  loadImage("right_foot.png");
  hat = loadImage("maozi.png");
  lf_up_arm = loadImage("left_arm.png");
  rt_up_arm = loadImage("right_arm.png");
  low_l_arm = loadImage("low_l_arm.png");
  low_r_arm = loadImage("low_r_arm.png");
  
  shanzi = loadImage("shanzi.png");
  
  
  //--------------------------------------------------------------  
  faceList = new ArrayList<PImage>();
  // video.start();
  img1 = loadImage("1.png");
  //img1.resize(200, 240);
  img2 = loadImage("2.png");
  //img2.resize(200, 280);
  img3 = loadImage("3.png");
  //img3.resize(200, 280);
  img4 = loadImage("4.png");
  //img4.resize(200, 280);
  img5 = loadImage("5.png");
  //img5.resize(200, 280);
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  img8 = loadImage("8.png");
  img9 = loadImage("9.png");
  img10 = loadImage("10.png");
  faceList.add(img1);
  faceList.add(img2);
  faceList.add(img3);
  faceList.add(img4);
  faceList.add(img5);
  faceList.add(img6);
  faceList.add(img7);
  faceList.add(img8);
  faceList.add(img9);
  faceList.add(img10);
}
void draw() {
  background(255);
  image(movie, 0, 0, width, height);
  translate(0, 0);
  imageMode(0);
  //get the skeletons as an Arraylist of KSkeletons
  scale(scl);
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

  //individual joints
  for (int i = 0; i < skeletonArray.size(); i++) {

    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    //if the skeleton is being tracked compute the skleton joints
    KJoint[] joints;
    if (skeleton.isTracked()) {
      joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      a=int(joints[KinectPV2.JointType_HandRight].getX());
      s=int(joints[KinectPV2.JointType_HandRight].getY());
      d=int(joints[KinectPV2.JointType_HandLeft].getX());
      f=int(joints[KinectPV2.JointType_HandLeft].getY());
      g=int(dist(a, s, d, f));
      drawBody(joints);
      //get x y z for face position
      target_x = joints[KinectPV2.JointType_Head].getX();
      target_y = joints[KinectPV2.JointType_Head].getY();
      target_z = joints[KinectPV2.JointType_Head].getZ();




      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
      if (a>zfx && a<zfx+100 && s>zfy && s<zfy+100 ) {
        zfx=-1000;
        zfy=-1000;
        qY=-1000;
        qX=-1000;
      }
      if (a>zfx1 && a<zfx1+100 && s>zfy1 && s<zfy1+100 ) {
        zfx1=-1000;
        zfy1=-1000;
        qY1=-1000;
        qX1=-1000;
      }
      if (a>zfx2 && a<zfx2+100 && s>zfy2 && s<zfy2+100 ) {
        zfx2=-1000;
        zfy2=-1000;
        qY2=-1000;
        qX2=-1000;
      }
      if (a>zfx3 && a<zfx3+100 && s>zfy3 && s<zfy3+100 ) {
        zfx3=-1000;
        zfy3=-1000;
        qY3=-1000;
        qX3=-1000;
      }
      if (a>zfx4 && a<zfx4+100 && s>zfy4 && s<zfy4+100 ) {
        zfx4=-1000;
        zfy4=-1000;
        qY4=-1000;
        qX4=-1000;
      }
      if (a>zfx5 && a<zfx5+100 && s>zfy5 && s<zfy5+100) {
        zfx5=-1000;
        zfy5=-1000;
        qY5=-1000;
        qX5=-1000;
      }
      if (a>zfx6 && a<zfx6+100 && s>zfy6 && s<zfy6+100) {
        zfx6=-1000;
        zfy6=-1000;
        qY6=-1000;
        qX6=-1000;
      }
      if (a>zfx7 && a<zfx7+100 && s>zfy7 && s<zfy7+100) {
        zfx7=-1000;
        zfy7=-1000;
        qY7=-1000;
        qX7=-1000;
      }
      if (a>zfx8 && a<zfx8+100 && s>zfy8 && s<zfy8+100 ) {
        zfx8=-1000;
        zfy8=-1000;
        qY8=-1000;
        qX8=-1000;
      }
      if (a>zfx9 && a<zfx9+100 && s>zfy9 && s<zfy9+100 ) {
        zfx9=-1000;
        zfy9=-1000;
        qY9=-1000;
        qX9=-1000;

        if (a>zfx10 && a<zfx10+100 && s>zfy10 && s<zfy10+100 ) {
          zfx10=-1000;
          zfy10=-1000;
          qY10=-1000;
          qX10=-1000;
        }
        if (a>zfx11 && a<zfx11+100 && s>zfy11 && s<zfy11+100 ) {
          zfx11=-1000;
          zfy11=-1000;
          qY11=-1000;
          qX11=-1000;
        }
        if (a>zfx12 && a<zfx12+100 && s>zfy12 && s<zfy12+100 ) {
          zfx12=-1000;
          zfy12=-1000;
          qY12=-1000;
          qX12=-1000;
        }
        if (a>zfx13 && a<zfx13+100 && s>zfy13 && s<zfy13+100) {
          zfx13=-1000;
          zfy13=-1000;
          qY13=-1000;
          qX13=-1000;
        }
        if (a>zfx14 && a<zfx14+100 && s>zfy14 && s<zfy14+100 ) {
          zfx14=-1000;
          zfy14=-1000;
          qY14=-1000;
          qX14=-1000;
        }
        if (a>zfx15 && a<zfx15+100 && s>zfy15 && s<zfy15+100) {
          zfx15=-1000;
          zfy15=-1000;
          qY15=-1000;
          qX15=-1000;
        }
      }

      // image(tp_renwu, joints[ KinectPV2.JointType_HandRight].getX()-150, joints[ KinectPV2.JointType_HandRight].getY()-150, 150, 150);
    }
  }

  ArrayList<HDFaceData> hdFaceData = kinect.getHDFaceVertex();
  if (hdFaceData.size()==1) {
    for (int j = 0; j < hdFaceData.size(); j++) {
      HDFaceData HDfaceData = (HDFaceData)hdFaceData.get(j);
      if (HDfaceData.isTracked()) {
          image(faceList.get(index), target_x-facewd*0.5, target_y-facelg*0.5, facewd*1.1, facelg*1.1);        
        //print(" "+j);
      }
    }
  } else {
    if (index ==9) {
      index = 0;
    }
    index++;
  }


  //--------------------------------------------------------

  spout.sendTexture();


}



void drawBody(KJoint[] joints) {
  
  
  //image for cap
  pushMatrix();
  translate(x_cod_neck,y_cod_neck);
  //float sdr = radians(degrees(uar_degree));
  imageMode(CENTER);
  image(cap,0,neck_hip_lg,neck_hip_lg*1.8,neck_hip_lg*2);
  popMatrix();
  
  pushMatrix();
  translate(target_x,target_y);
  imageMode(CENTER);
  image(hat, 0, -50, facewd*3, facelg*3);
  popMatrix();
  // Right Arm
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  x_cod_shoulderright =joints[KinectPV2.JointType_ShoulderRight].getX();
  y_cod_shoulderright =joints[KinectPV2.JointType_ShoulderRight].getY();
    pushMatrix();
    translate(x_cod_shoulderright,y_cod_shoulderright);
    float uar = radians(degrees(uar_degree)-95);
    rotate(uar);
    imageMode(CENTER);
    image(rt_up_arm, 0, up_arm_lg*0.5, up_arm_lg*0.5, up_arm_lg);
    
    popMatrix();
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
    pushMatrix();
    translate(x_cod_elbowright,y_cod_elbowright);
    float lar = radians(degrees(lar_degree)-95);
    rotate(lar);
    imageMode(CENTER);
    image(low_r_arm, 0, lower_arm_lg*0.5,lower_arm_lg*0.5 , lower_arm_lg);
    popMatrix();
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);
  //shanzi location right hand
  pushMatrix();
  translate(a,s);
  float sz = radians(degrees(lar_degree));
  rotate(sz);
  imageMode(CENTER);
  image(shanzi,0,0,facelg*scl,facelg*scl);
  
  popMatrix();
  

  // Left Arm
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  x_cod_shoulderleft =joints[KinectPV2.JointType_ShoulderLeft].getX();
  y_cod_shoulderleft =joints[KinectPV2.JointType_ShoulderLeft].getY();
    pushMatrix();
    translate(x_cod_shoulderleft,y_cod_shoulderleft);
    float ual = radians(degrees(ual_degree)-95);
    rotate(ual);
    imageMode(CENTER);
    image(lf_up_arm, 0, up_arm_lg*0.5, up_arm_lg*0.5, up_arm_lg);
    popMatrix();


  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  x_cod_elbowleft =joints[KinectPV2.JointType_ElbowLeft].getX();
  y_cod_elbowleft =joints[KinectPV2.JointType_ElbowLeft].getY();
    pushMatrix();
    translate(x_cod_elbowleft,y_cod_elbowleft);
    float lal = radians(degrees(lal_degree)-90);
    rotate(lal);
    imageMode(CENTER);
    image(low_l_arm, 0, lower_arm_lg*0.5, lower_arm_lg*0.5, lower_arm_lg);
    popMatrix();
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  x_cod_hipright = joints[KinectPV2.JointType_HipRight].getX();
  y_cod_hipright = joints[KinectPV2.JointType_HipRight].getY();
  pushMatrix();
  translate(x_cod_hipright,y_cod_hipright);
  float url = radians(degrees(ulr_degree)-90);
  rotate(url);
  imageMode(CENTER);
  image(lf_leg, 0, up_leg_lg/2, up_leg_lg*0.7, up_leg_lg);
  popMatrix();
  //position = 2;
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  //position = 23;
  x_cod_kneeright = joints[KinectPV2.JointType_KneeRight].getX();
  y_cod_kneeright = joints[KinectPV2.JointType_KneeRight].getY();
  pushMatrix();
  translate(x_cod_kneeright,y_cod_kneeright);
    float llr = radians(degrees(ulr_degree)-90);
    rotate(llr);
    imageMode(CENTER);
    image(rt_foot, 0, leg_foot_lg/2, leg_foot_lg*0.36, leg_foot_lg);
    popMatrix();

  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);
  x_cod_ankleright = joints[KinectPV2.JointType_AnkleRight].getX();
  y_cod_ankleright = joints[KinectPV2.JointType_AnkleRight].getY();

  
  
  // Left Leg
  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  //position = 21;
  x_cod_hipleft = joints[KinectPV2.JointType_HipLeft].getX();
  y_cod_hipleft = joints[KinectPV2.JointType_HipLeft].getY();
    pushMatrix();
  translate(x_cod_hipleft,y_cod_hipleft);
    float ull = radians(degrees(ull_degree)-90);
    rotate(ull);
    imageMode(CENTER);
    image(rt_leg, 0, up_leg_lg/2, up_leg_lg*0.7, up_leg_lg);
    popMatrix();
  
  
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  x_cod_kneeleft = joints[KinectPV2.JointType_KneeLeft].getX();
  y_cod_kneeleft = joints[KinectPV2.JointType_KneeLeft].getY();
  pushMatrix();
  translate(x_cod_kneeleft,y_cod_kneeleft);
  float lll = radians(degrees(ull_degree)-90);
  rotate(lll);
  imageMode(CENTER);
  image(lf_foot, 0, leg_foot_lg/2, leg_foot_lg*0.36, leg_foot_lg);
  popMatrix();
  //position = 22;
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);
  x_cod_ankleleft = joints[KinectPV2.JointType_AnkleLeft].getX();
  y_cod_ankleleft = joints[KinectPV2.JointType_AnkleLeft].getY();
  x_cod_footright = joints[KinectPV2.JointType_FootRight].getX();
  y_cod_footright = joints[KinectPV2.JointType_FootRight].getY();

  


  drawJoint(joints, KinectPV2.JointType_HandTipLeft);
  drawJoint(joints, KinectPV2.JointType_HandTipRight);
  drawJoint(joints, KinectPV2.JointType_FootLeft);
  drawJoint(joints, KinectPV2.JointType_FootRight);

  drawJoint(joints, KinectPV2.JointType_ThumbLeft);
  drawJoint(joints, KinectPV2.JointType_ThumbRight);

  drawJoint(joints, KinectPV2.JointType_Head);
  position = 3;
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
  position=0;
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
  y_cod_neck = joints[KinectPV2.JointType_Neck].getY();
  x_cod_neck = joints[KinectPV2.JointType_Neck].getX();
  x_cod_shouldermid = joints[KinectPV2.JointType_SpineShoulder].getX();
  y_cod_shouldermid = joints[KinectPV2.JointType_SpineShoulder].getY();
  pushMatrix();
  translate(x_cod_neck,y_cod_neck);
  //float sdr = radians(degrees(uar_degree));
  imageMode(CENTER);
  image(shoulderr,shoulder_lg,0,shoulder_lg*1.5,shoulder_lg*1.5);
  popMatrix();
  
  pushMatrix();
  translate(x_cod_neck,y_cod_neck);
  //float sdr = radians(degrees(uar_degree));
  imageMode(CENTER);
  image(shoulderl,-shoulder_lg,0,shoulder_lg*1.5,shoulder_lg*1.5);
  popMatrix();

  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  //position = 1;
  y_cod_spinemid = joints[KinectPV2.JointType_SpineMid].getY();
  x_cod_spinemid = joints[KinectPV2.JointType_SpineMid].getX();
  pushMatrix();
  translate(x_cod_spinemid,y_cod_spinemid);
  imageMode(CENTER);
  image(yi,0,0,neck_hip_lg*0.7,neck_hip_lg);
  //image(shoulderr,0,0,80,55);
  popMatrix();
  
  drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  y_cod_centerhip = joints[KinectPV2.JointType_SpineBase].getY();
  x_cod_centerhip = joints[KinectPV2.JointType_SpineBase].getX();
  position = 0;
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
  //position = 4;
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
  //position = 0;
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);

  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);
  
  
    //update x and y coordinates for elbowleft
  //float x_cod_spinshoulder =joints[KinectPV2.JointType_SpineShoulder].getX();
  //float y_cod_spinshoulder =joints[KinectPV2.JointType_SpineShoulder].getY();

  //print (x_cod + " ");
  x_cod_elbowleft = joints[KinectPV2.JointType_ElbowLeft].getX();
  y_cod_elbowleft = joints[KinectPV2.JointType_ElbowLeft].getY();
  
  x_cod_elbowright = joints[KinectPV2.JointType_ElbowRight].getX();
  y_cod_elbowright = joints[KinectPV2.JointType_ElbowRight].getY();
  
  x_cod_wristleft = joints[KinectPV2.JointType_WristLeft].getX();
  y_cod_wristleft = joints[KinectPV2.JointType_WristLeft].getY();
  x_cod_wristright = joints[KinectPV2.JointType_WristRight].getX();
  y_cod_wristright = joints[KinectPV2.JointType_WristRight].getY();
  
  x_cod_kneeright = joints[KinectPV2.JointType_KneeRight].getX();
  y_cod_kneeright = joints[KinectPV2.JointType_KneeRight].getY();



  //ual_degree = atan2(y_cod, x_cod);
  ull_degree = atan2(y_cod_kneeleft - y_cod_hipleft, x_cod_kneeleft - x_cod_hipleft);
  ulr_degree = atan2(y_cod_kneeright - y_cod_hipright, x_cod_kneeright - x_cod_hipright);
  ual_degree = atan2(y_cod_elbowleft-y_cod_shoulderleft, x_cod_elbowleft-x_cod_shoulderleft);
  uar_degree = atan2(y_cod_elbowright-y_cod_shoulderright, x_cod_elbowright-x_cod_shoulderright);
  lal_degree = atan2(y_cod_wristleft - y_cod_elbowleft, x_cod_wristleft - x_cod_elbowleft);
  lar_degree = atan2(y_cod_wristright - y_cod_elbowright, x_cod_wristright - x_cod_elbowright);
  llr_degree = atan2(y_cod_ankleright - y_cod_kneeright, x_cod_ankleright - x_cod_kneeright);
  lll_degree = atan2(y_cod_ankleleft - y_cod_kneeleft, x_cod_ankleleft - x_cod_kneeleft);
  wrist_degree = atan2(y_cod_wristright-y_cod_elbowright, x_cod_wristright - x_cod_elbowright);
   //ual_degree3 = atan2(y_cod_spinshoulder, x_cod_spinshoulder);
  //print (radians(ual_degree)+" ");
}

//draw joint
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  //ellipse(0, 0, 25, 25);
  popMatrix();
}

//draw bone
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  //ellipse(0, 0, 25, 25);
  //scale(scl);
  fill(255, 255, 255);
  imageMode(CENTER);

  //get size for cloth

  neck_lg = 2*dist(x_cod_shouldermid,y_cod_shouldermid,x_cod_neck,y_cod_neck);
  shoulder_lg = dist(x_cod_shoulderleft,y_cod_shoulderleft,x_cod_neck,y_cod_neck);
  up_leg_lg = dist(x_cod_kneeleft,y_cod_kneeleft,x_cod_hipleft,y_cod_hipleft);
  leg_foot_lg = dist(x_cod_kneeright,y_cod_kneeright,x_cod_footright,y_cod_footright);
  
  up_arm_lg =dist(x_cod_shoulderleft,y_cod_shoulderleft,x_cod_elbowleft,y_cod_elbowleft) ;
  lower_arm_lg = dist(x_cod_wristleft,y_cod_wristleft,x_cod_elbowleft,y_cod_elbowleft);
  
  neck_hip_lg = dist(x_cod_neck,y_cod_neck,x_cod_centerhip,y_cod_centerhip);
  

  facelg = (joints[KinectPV2.JointType_ShoulderRight].getX()-joints[KinectPV2.JointType_ShoulderLeft].getX())/2;
  facewd = (joints[KinectPV2.JointType_Neck].getY()-joints[KinectPV2.JointType_Head].getY());
  
  imageMode(0);
  popMatrix();
  //line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  //ellipse(0, 0, 70, 70);
  popMatrix();
}

void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    fill(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}
//------------------------------------------------------------------------------------------
