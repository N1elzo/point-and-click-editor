//import controlP5.*;
//import uibooster.*;
//ControlP5 cp5;
//ListBox l;
//int i;
//int limit = 0 ;

//UiBooster booster;
//String scenename = "null";

////Lista String
////String[] list = new String[100];
//StringList list = new StringList();

//// global controlevent
//ControlEvent ce;

//DropdownList d1;
//ListBox lbox;

//void setup()
//{

//  size(800, 600);
//  background(128);
//  noStroke();
//  cp5 = new ControlP5(this);

//  // Botoes
//  cp5.addButton("Adicionar Cena")
//    .setValue(0)
//    .setPosition(width/1.65, height/10)
//    .setSize(100, 30)
//    .plugTo(this, "insertName")
//    ;
//  cp5.addButton("Remover Cena")
//    .setValue(0)
//    .setPosition(width/1.65, height/10 + 40)
//    .setSize(100, 30)
//    .plugTo(this, "deleteScene");
//  ;
//  cp5.addButton("Editar Cena")
//    .setValue(0)
//    .setPosition(width/1.65, height/10 + 80)
//    .setSize(100, 30)
//    ;
//  cp5.addButton("Executar")
//    .setValue(0)
//    .setPosition(width/1.65, height * 2/3)
//    .setSize(100, 30)
//    ;
//  cp5.addButton("Exportar")
//    .setValue(0)
//    .setPosition(width/1.65, height * 2/3 + 40)
//    .setSize(100, 30)
//    .plugTo(this, "dialogExport");
//  ;
//  cp5.addButton("Importar")
//    .setValue(0)
//    .setPosition(width/1.65, height * 2/3 + 80)
//    .setSize(100, 30)
//    .plugTo(this, "dialogImport");
//  ;

//  lbox = cp5.addListBox("myList")
//    .setPosition(width/4, height/10)
//    .setSize(width/3, height/2)
//    .setItemHeight(30)
//    .setBarHeight(30)
//    .setColorBackground(color(60))
//    .setColorActive(color(60))
//    .setColorForeground(color(100))
//    ;
//  // create a DropdownList,
//  d1 = cp5.addDropdownList("Lista de Cenas")
//    .setPosition(width/4, height * 2/3)
//    .setSize(width/3, 200)
//    ;

//  list.append("Teste 0");
//  list.append("Teste 1");
//  list.append("Teste 2");

//  lbox.addItem(list.get(0), 0);
//  lbox.addItem(list.get(1), 1);
//  lbox.addItem(list.get(2), 2);
//}
//void draw()
//{
//  background(128);
//  //texto "Cenas"
//  textSize(25);
//  fill(0);
//  text("Cenas", width/4, height/10 -10);
//  //texto cena inicial
//  fill(0);
//  text("Cena inicial", width/4, height*2/3 -10);

//  lbox.getCaptionLabel().toUpperCase(true);
//  lbox.getCaptionLabel().set("Lista de cenas");
//  lbox.getCaptionLabel().setColor(0xffff0000);

//  for (int i=0; i < list.size(); i++) {
//    lbox.getItem(i).put("color", new CColor().setBackground(0xffff0000).setBackground(0xffff8800));
//  }

//  customize(d1); // customize the first list
//}

//boolean isMouseOver(float x, float y, float w, float h) {
//  if (mouseX>= x && mouseX <= x + w && mouseY>= y && mouseY<= y + h) {
//    return true;
//  }
//  return false;
//}
////metodo adicionar cena
//void addScene() {
//  print("Adicionada");
//  limit ++;
//}
////metodo exportar
//void dialogExport() {
//  UiBooster booster = new UiBooster();
//  File file = booster.showFileSelection();
//  println("fileName = " + file.getName());
//}
////metodo importar
//void dialogImport() {
//  UiBooster booster = new UiBooster();
//  File directory = booster.showDirectorySelection();
//  println("fileName = " + directory.getName());
//}
////metodo dialog Sim ou não excluir cena
//void deleteScene() {
//  new UiBooster().showConfirmDialog(
//    "Você quer mesmo remover essa cena?",
//    "Remover cena",
//    () -> removeElementInListBox(),
//    () -> System.out.println("Action declined"));
//  //println("menos 1");
//}
////metodo dialog box inserir nome
//void insertName() {
//  booster = new UiBooster();
//  scenename = booster.showTextInputDialog("Qual o nome da cena?");

//  //println("insertName: " + new String(scenename));

//  limit ++;
//  list.append(new String(scenename));

//  lbox.addItem(list.get(list.size() - 1), list.size() - 1);
//}

////droplist
//void customize(DropdownList ddl) {
//  // a convenience function to customize a DropdownList
//  ddl.setBackgroundColor(color(190));
//  ddl.setItemHeight(20);
//  ddl.setBarHeight(30);
//  ddl.getCaptionLabel().set("Primeira cena");
//  //for (int i=0; i < list.size(); i++) {
//  //  ddl.getItem(list.get(i), i);
//  //}
//  //ddl.scroll(0);
//  ddl.setColorBackground(color(60));
//  ddl.setColorActive(color(255, 128));
//}

//public void removeElementInListBox() { 
//  int remove_value = int(ce.getValue());
//  if ( remove_value >= 0 && remove_value < list.size() ) {
//    println("Menos um");
//    list.remove(remove_value);
//  }
//}

//public void controlEvent(ControlEvent _ce) {
//  ce = _ce;
//}

/// [estudo] código para personalizar o ControlP5
// teste feito com a classe ListBox

//public class NewListBox extends controlP5.ListBox {
//  private int maxHeight = 180;
  
//  NewListBox(ControlP5 theControlP5, String theName) {
//    super(theControlP5, theName);
//  }
  
//  public ListBox addItem( String theName , Object theValue ) {
//    ListBox lb = super.addItem(theName, theValue);
//    setHeight(updateHeight());
//    return lb;
//  }
  
//  public void setMaxHeight(int nH){ if ( nH >= 0 ) this.maxHeight = nH;}
//  public int getMaxHeight() { return this.maxHeight; }

//  private int updateHeight( ) {
//    print("Invocado");
//    if ( PApplet.abs( getHeight( ) ) < ((items.size( ) * itemHeight) +  ( isBarVisible( ) ? barHeight : 0 )) ) {
//      return ((items.size( ) * itemHeight) +  ( isBarVisible( ) ? barHeight : 0 ));
//    } else {
//      itemRange = ( PApplet.abs( getHeight( ) ) - ( isBarVisible( ) ? barHeight : 0 ) ) / itemHeight;
//      return itemHeight * ( items.size( ) < itemRange ? items.size( ) : itemRange );
//    }
//  }
//}

//public class MyControlP5 extends ControlP5 {

//  MyControlP5(final PApplet theParent) {
//    super(theParent);
//  }
  
//  public ListBox addNewListBox( final String theName ) {
//    return addListBox( theName, 0, 0, 100, 200 );
//  }
//}
