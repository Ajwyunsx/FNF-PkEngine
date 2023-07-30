import haxe.ds.Vector;
import sys.db.Object;
import sys.db.Types;

class GameObject {}

class ObjectPool {

  public var pools:Map<String, Vector<Dynamic>> = new Map();
  public var maxSize = 100;

  public function new() {
  }

  public function getObject(type:String):Dynamic {
    if(!pools.exists(type)) {
      pools[type] = new Vector();
    }

    var pool = pools[type];
    if(pool.length > 0) {
      return pool.pop();
    } else {
      return Type.createInstance(Type.resolveClass(type), []);
    }
  }

  public function freeObject(obj:Dynamic, type:String) {
    if (!pools.exists(type)) return;

    var pool = pools[type];
    if(pool.length >= maxSize) return;

    pool.push(obj);
  }

  public function clearPool(type:String) {
    if (!pools.exists(type)) return;
    
    pools[type] = new Vector();
  }

}


class Main {

  static function main() {
    var pool = new ObjectPool();

    var obj1:GameObject = cast pool.getObject("GameObject");
    pool.freeObject(obj1, "GameObject");

    var obj2:String = cast pool.getObject("String"); 
    pool.freeObject(obj2, "String");

  }

}