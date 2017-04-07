Table [] man_01=new Table[100];
PShape [] picto=new PShape[100];
PFont robolig120;
PFont robobold22;
PFont robolig22;
PFont robolig42;
PFont robobold25;
PFont robolig25;


void setup (){
  size (640, 1280);
  //if (frame != null) {
    //surface.setResizable(true);
 // }
  
for(int i=0;i<100; i=i+1){
    int q1=0; //Correcta
    int q2=0; //CasiCorrecta
    int q3=0; //Dudosa
    int q4=0; //Incorrecta
    int q5=0; //SignificadoOpuesto
    int q6=0; //SinRespuesta

  man_01 [i] = loadTable((i+1)+".csv"); //AUTOMATIZAR CSV
  String name=(man_01[i].getString(0,0) + man_01[i].getString(0,1));
  String svgname=(man_01[i].getString(0,0));
  println(svgname);
  println(name);
  
// Q1 - Correcta
   for (TableRow row : man_01[i].findRows("1", 2)) {
    q1++;
   }
   println(q1);
// Q2 - CasiCorrecta
   for (TableRow row : man_01[i].findRows("2", 2)) {
    q2++;
    }
   println(q2);
// Q3 - Dudosa
   for (TableRow row : man_01[i].findRows("3", 2)) {
    q3++;
    }
   println(q3);   
// Q4 - Incorrecta
   for (TableRow row : man_01[i].findRows("4", 2)) {
    q4++;
    }
   println(q4);   
// Q5 - SignificadoOpuesto
   for (TableRow row : man_01[i].findRows("5", 2)) {
    q5++;
    }
   println(q5);  
// Q6 - SinRespuesta
   for (TableRow row : man_01[i].findRows("6", 2)) {
    q6++;
    }
   println(q6);   
// QRESULTADOS
  int qtotal=q1+q2+q3+q4+q5+q6;
  float punt=(q1*1+q2*0.75+q3*0.5); //PUNTAJES 
  float pond=((punt*100)/(qtotal*1));
  println(qtotal + " en Total");  
  println(punt+"puntos");
  println(qtotal + " en Total");  
  
  //------------------------------------GRAFICA----------------------------------------------
  
  //FONTS
  robolig120=loadFont("Roboto-Light-120.vlw");
  robobold22=loadFont("Roboto-Bold-22.vlw");
  robolig22=loadFont("Roboto-Light-22.vlw");
  robolig42=loadFont("Roboto-Light-42.vlw");
  robobold25=loadFont("Roboto-Bold-25.vlw");
  robolig25=loadFont("Roboto-Light-25.vlw");

  background (255);
  
  //CUADRADOSGRISES
  fill(236);
  noStroke();
  rectMode(CORNERS);
  rect(32,79,293,341);
  rect(545,490,606,526);
  
  ellipse(567,117,78,78);
  
  rectMode(CORNER);
  rect(32,566,132,74);
  rect(238,566,132,74);
  rect(444,566,132,74);
  rect(32,736,132,74);
  rect(238,736,132,74);
  rect(444,736,132,74);
  
  strokeWeight(1);
  stroke(0);
  line(32,470,607,470);
  line(32,913,607,913);
  
  //PICTO
  picto[i] = loadShape(svgname +".svg"); //AUTOMATIZAR PICTOS
  shape(picto[i],50,90,225,225); 
  
  //TEXTOS
  noStroke();
  fill(0);
  //Ponderacion
  textFont(robolig120);
  text(round(pond)+"%",334,280);
  textFont(robobold22);
  text("Performance",334,341);
  textFont(robolig22);
  text("Desempeño",469,341);
  //Nombre
  textFont(robolig42);
  text(name,32,420);
  //Meaning
  textFont(robobold25);
  text("Meaning",32,518);
  textFont(robolig25);
  text("Signifcado",137,518);
  //Answers
  textFont(robobold25);
  text("Answers",304,518);
  textFont(robolig25);
  text("Respuestas",408,518);
  textFont(robobold25);
  text(qtotal,554,518);
  //Qs
  textFont(robolig42);
  text(q1,48,617);
  text(q2,255,617);
  text(q3,464,617);
  text(q4,48,787);
  text(q5,255,787);
  text(q6,464,787);
  //Categorias
  textFont(robobold25);
  text("Correct",35,670);
  text("Almost correct",242,670);
  text("Doubtful",452,670);
  text("Inorrect",35,839);
  text("Opposite",242,839);
  text("No answer",452,839);
  
  textFont(robolig25);
  text("Correcto",35,703);
  text("Casi correcto",242,703);
  text("Dudoso",452,703);
  text("Inorrecto",35,872);
  text("Opuesto",242,872);
  text("Sin respuesto",452,872);
  
  //Action
  textFont(robobold25);
  text("Action",32,958);
  textFont(robolig25);
  text("Acción",112,958);
  
  if(q5>(qtotal*0.05)){ //MAS DE 5% OPUESTAS = X
  textFont(robobold25);
  text("X",558,128); //TESTIGO
  textFont(robolig25);
  text("[Eng] The icon needs to be reconsidered on its design and/or redesigned.\n[Esp] El icono requiere ser rediseñado, esto es un hamburgefionts en español.",47,1021,550,200);
  }
  if(pond>86){ //MAS DE 86% buenas = YES
  textFont(robobold25);
  text("B ",558,128); //TESTIGO
  textFont(robolig25);
  text("[Eng] This icon is actually approved by Tuco and all his friends!.\n[Esp] Este ícono está aprobado por Tuco y sus amigos!.",47,1021,550,200);
  }
  if(pond<86 && q5<(qtotal*0.05)){ //REGULEQUE, NINGUNA DE LAS ANTERIORES
  textFont(robobold25);
  text("- ",558,128); //TESTIGO
  textFont(robolig25);
  text("[Eng] With this icon, no pasa na!.\n[Esp] Con este icono no pasa na!.",47,1021,550,200);
  }
  
  //SAVE
  save(svgname+"test"+".png");
}
}