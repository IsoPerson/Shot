package Server.clientInformation {

public class DataForServer {
	private var _items:Vector.<ItemForServer>;
	public function DataForServer(){
		
	}
	
	public function get items():Vector.<ItemForServer>{
		return items;
	}
	public function set items(value:Vector.<ItemForServer>):void{
		items = value;
	}
	
	public function addItem(itemName:String, itemValue:String):void{
		if (!_items) { _items = new Vector.<ItemForServer>(); }
		_items.push(new ItemForServer(itemName, itemValue));
	}
	
	public function toString():String{
		var result:String = "";
		_items.forEach(function(item:ItemForServer, index:int, ..._):void{ 
										result += (index == 0) ? "?" : "&" + item.toString(); } );
		return result;
	}

}
}