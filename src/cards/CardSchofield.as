package cards {
import inGameRoom.player.PlayerInfo;

public class CardSchofield extends Card {
	public function CardSchofield(id:int){
		super(id);
		cardFunction = Card.RADIUS_GUN;
		radius = 2;
		playingType = Card.PASSIVE;
	}
	
	override public function play(player:PlayerInfo = null):void{
		openOnTable();
		sendToServer(player);
	}
}
}