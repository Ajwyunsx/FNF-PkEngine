// 主类
import openfl.display.Sprite;

class Main extends Sprite {

  public function new() {
    super();
    
    // 初始化游戏
    initGame();
    
    // 检查Android版本
    checkAndroidVersion();
  }

  function initGame() {
    // 使用OpenFL编写游戏逻辑
    
  }

  function checkAndroidVersion() {
    #if android
      // Android 5.0以上
      #if (android && android_version >= 21)

        // 创建线程池
        sys.thread.Thread.createThreadPool(4);

        // 用线程池加载资源
        sys.thread.ThreadPool.queue(function() {
          // 加载资源
        });

        // OpenGL渲染
        Lib.current.addChild(new OpenGLRenderer());

      #end
    #end
  }

}


// OpenGL渲染器
import openfl.display.Sprite;
import extension.renderer.OpenGLRenderer;

class OpenGLRenderer extends Sprite {
  
  public function new() {
    super();
    // 初始化渲染器
  } 

}
