package Server.clientInformation {

public class ItemForServer {
	private var itemName:String;
	private var itemValue:String;
	public function ItemForServer(itemName:String, itemValue:String){
		this.itemName = itemName;
		this.itemValue = itemValue;
	}
	
	public function toString():String{
		return itemName + "=" + itemValue;
	}
}

}