/*
  Sistema necessário para a leitura e armazenamento dos dados
 */

import java.util.*;

// Utils classes ( useds in 'back' and 'frontend' ) -----------------------------
class SceneObject {
  String name = null;
  String image_name = null;

  public SceneObject( String name, String image_name ) {
    this.name = name;
    this.image_name = image_name;
  }
}
// ------------------------------------------------------------------------------

class DataSystemController {

  // null caso o usuário esteja criando um projeto do 0. Se o user esta lendo informações de outros jogos esse valor deve ser preenchido
  // antes de carregar as informacoes do arquivo.
  private String filename = null;
  private JSONObject file;

  // Scenes data -----------------------------------------
  private ArrayList<SceneObject> scenes = new ArrayList<SceneObject>();
  private int mainSceneIndex = -1; // -1 caso não esteja definido

  // -----------------------------------------------------

  void setFilename(String _filename) {
    this.filename = _filename;
  }

  void readFile() {
    file = loadJSONObject(this.filename);
    println(file);
  }

  // Métodos de controle das cenas ----------------------------------

  public ArrayList<SceneObject> getScenes() {
    return scenes;
  }

  public void addScene(String sceneName, String imageRef) {
    SceneObject newScene = new SceneObject(sceneName, imageRef);
    scenes.add(newScene);
  }

  public SceneObject removeSceneAt(int indexSceneToRemove) {
    // Recebe o index da cena que deve ser removida, veirfica se está na lista, se estiver remove a cena e retorna os dados dela.
    // Se a cena não puder ser removida o sistema retorna null;
    if ( indexSceneToRemove >= 0 && indexSceneToRemove < scenes.size() ) {
      SceneObject sceneToRemove = scenes.get(indexSceneToRemove);
      boolean removed = scenes.remove(sceneToRemove);

      return removed ? sceneToRemove : null;
    }
    return null;
  }

  public void setMainScene(int indexScene) {
    if ( indexScene >= 0 && indexScene < scenes.size() ) {
      mainSceneIndex = indexScene;
    }
  }

  public SceneObject getMainScene() {
    if (  mainSceneIndex != -1 ) {
      SceneObject mainScene = scenes.get(mainSceneIndex);
      return  mainScene;
    } else {
      return null;
    }
  }

  // ----------------------------------------------------------------
}
