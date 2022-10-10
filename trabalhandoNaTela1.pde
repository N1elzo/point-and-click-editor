import controlP5.*; //<>// //<>//
import uibooster.*;

ControlP5 cp5;
ScrollableList l;

UiBooster booster;

StringList list = new StringList();
String textSelectedInDropDownList = null;

// [ISSUE] : Incoporar essa propriedade e controle da lbox em uma classe a parte;
int min_number_of_itens_in_lbox; // existe para resolver o bug do erro no index da listbox.

DropdownList d1;
ListBox lbox;

void setup()
{

  size(800, 600);
  background(128);
  noStroke();
  cp5 = new ControlP5(this);

  // Botoes
  cp5.addButton("Adicionar Cena")
    .setValue(0)
    .setPosition(width/1.65, height/10)
    .setSize(100, 30)
    .plugTo(this, "insertName")
    ;
  cp5.addButton("Remover Cena")
    .setValue(0)
    .setPosition(width/1.65, height/10 + 40)
    .setSize(100, 30)
    .plugTo(this, "deleteScene");
  ;
  cp5.addButton("Editar Cena")
    .setValue(0)
    .setPosition(width/1.65, height/10 + 80)
    .setSize(100, 30)
    ;
  cp5.addButton("Executar")
    .setValue(0)
    .setPosition(width/1.65, height * 2/3)
    .setSize(100, 30)
    ;
  cp5.addButton("Exportar")
    .setValue(0)
    .setPosition(width/1.65, height * 2/3 + 40)
    .setSize(100, 30)
    .plugTo(this, "dialogExport");
  ;
  cp5.addButton("Importar")
    .setValue(0)
    .setPosition(width/1.65, height * 2/3 + 80)
    .setSize(100, 30)
    .plugTo(this, "dialogImport");
  ;

  // Item List --------------------
  lbox = cp5.addListBox("myList")
    .setPosition(width/4, height/10)
    // tive que colocar 180 para ficar multiplo do tamanho dos itens + barHeight, dava um bug sem isso e travavava tudo
    .setSize(width/3, 210)
    .setItemHeight(30)
    .setBarHeight(30)
    .setColorBackground(color(60))
    .setColorActive(color(60))
    .setColorForeground(color(100))
    ;
  //create a DropdownList,
  d1 = cp5.addDropdownList("Lista de Cenas")
    .setPosition(width/4, height * 2/3)
    .setSize(width/3, 200)
    ;


  min_number_of_itens_in_lbox = ceil((PApplet.abs( lbox.getHeight() ) - ( lbox.getBarHeight() )) / 30);// 30 = lbox.setItemHeight(30)
  for ( int i = 0; i < min_number_of_itens_in_lbox; i++) {
    lbox.addItem("", i);
    lbox.getItem(i).put("state", false);
  }

  //list.append("Teste 0");
  //list.append("Teste 1");
  //list.append("Teste 2");
}
void draw()
{
  background(128); //#777777
  //texto "Cenas"
  textSize(25);
  fill(0);
  text("Cenas", width/4, height/10 -10);
  //texto cena inicial
  fill(0);
  text("Cena inicial", width/4, height*2/3 -10);

  lbox.getCaptionLabel().toUpperCase(true);
  lbox.getCaptionLabel().set("Lista de cenas");
  lbox.getCaptionLabel().setColor(0xffff0000);

  for (int i=0; i < lbox.getItems().size(); i++) {
    if ( i < list.size() ) {
      //lbox.getItem(i).put("state", false);
      lbox.getItem(i).put("color", new CColor().setBackground(0xffff0000).setBackground(0xffff8800));
    } else {
      lbox.getItem(i).put("text", " ");
      lbox.getItem(i).put("state", false);
      lbox.getItem(i).put("color", new CColor().setBackground(0xff777777).setBackground(0xff777777));
    }
  }

  customize(d1); // customize the first list
}

boolean isMouseOver(float x, float y, float w, float h) {
  if (mouseX>= x && mouseX <= x + w && mouseY>= y && mouseY<= y + h) {
    return true;
  }
  return false;
}
//metodo adicionar cena
void addScene() {
  print("Adicionada");
}
//metodo exportar
void dialogExport() {
  UiBooster booster = new UiBooster();
  File file = booster.showFileSelection();
  println("fileName = " + file.getName());
}
//metodo importar
void dialogImport() {
  UiBooster booster = new UiBooster();
  File directory = booster.showDirectorySelection();
  println("fileName = " + directory.getName());
}
//metodo dialog Sim ou não excluir cena
void deleteScene() {
  new UiBooster().showConfirmDialog(
    "Você quer mesmo remover essa cena?",
    "Remover cena",
    () -> removeElementInListBox(),
    () -> System.out.println("Action declined"));
  //println("menos 1");
}
//metodo dialog box inserir nome
void insertName() {
  booster = new UiBooster();
  String scenename = booster.showTextInputDialog("Qual o nome da cena?");

  list.append(new String(scenename));

  if ( list.size() > cp5.get(ListBox.class, "myList").getItems().size() ) {
    lbox.addItem(list.get(list.size() - 1), list.size() - 1);
  } else {
    lbox.getItem(list.size() - 1).put("name", list.get(list.size() - 1));
    lbox.getItem(list.size() - 1).put("text", list.get(list.size() - 1));
  }
}

//droplist
void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(30);
  ddl.getCaptionLabel().set("Primeira cena");
  //for (int i=0; i < list.size(); i++) {
  //  ddl.getItem(list.get(i), i);
  //}
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

public void myList(int selected_element) {
  // Recebe o 'sinal' (evento) de que o objeto <ListBox> de identificado como "myList" ( variavel lbox ) foi modificado.
  if ( selected_element < lbox.getItems().size() ) {
    textSelectedInDropDownList = lbox.getItem(selected_element).get("name").toString();
    println(cp5.get(ListBox.class, "myList").getItem(textSelectedInDropDownList));
  }
}

public void removeElementInListBox() {
  println("removeElement foi chamado");
  try {
    println(cp5.get(ListBox.class, "myList").getItem(textSelectedInDropDownList));

    if ( cp5.get(ListBox.class, "myList").getItem(textSelectedInDropDownList).get("value") == null ) return;
    int remove_value = (int) cp5.get(ListBox.class, "myList").getItem(textSelectedInDropDownList).get("value");
    if ( remove_value >= 0 && remove_value < list.size() ) {

      list.removeValue(textSelectedInDropDownList);

      if ( list.size() > min_number_of_itens_in_lbox) {
        //cp5.get(ListBox.class, "myList").removeItem(textSelectedInDropDownList);
        lbox.removeItem(textSelectedInDropDownList);
      } else {
        lbox.getItem(list.size()).put("text", " ");
      }
    }
  }
  catch (Exception e) {
    e.printStackTrace();
    //println("Deu ruim aq...");
  }
}
