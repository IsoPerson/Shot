﻿package   Server  
{
	
	public class ServerAbilityPricesInfo  implements IServerInfo
	{

		private var _prices:Array = new Array();
		private var _ability_txt:Array = new Array("Скользкий", "Худой", "Убийца", "Зоркий", "Находчивый", 
			"Широкие Штаны", "Изменчивый", "Гробовщик") ;
		private var _ability_info:Array = new Array("Считается, что у него в игре постоянно есть «Укрытие»",
			"Все игроки видят его на расстоянии +1",
			"Чтобы отменить его карту \"Выстрел!\", нужно 2 карты \"Промах!\" ",
			"Видит всех игроков на расстоянии -1",
			"Когда у него нет карт в руке, он берёт карту с колоды",
			"Может держать в руке в 2 раза больше карт, чем его жизней",
			"На своем ходу может скинуть синюю карту  с руки и потянуть 2 из колоды",
			"Когда кто-то умирает, он тянет одну карту") ;
		
		private var _vip_ability_txt:Array = new Array("Держащийся за жизнь", "Стервятник", "Дядюшка Сэм", 
			"Жертвенность", "Картежник", "Банкир", "Санитар") ;
		private var _vip_ability_info:Array = new Array("В любое время может сбросить 2 карты в отбой, тем самым восстанавливая 1 жизнь. Если есть возможность, может использовать способность более 1 раза, при этом количество жизней не может превышать начального количества", 
			"Когда кто то погибает, он берет его карты к себе в руки (и синие, и с рук)", 
			"1 раз в свой ход он может сыграть любую карту с руки как карту магазин", 
			"В свой ход можно пожертвовать 1 единицу жизни и в награду получить 3 карты с колоды",
			"В свой ход может 1 раз сбросить 2 карты с руки и сыграть их как Выстрел! на кого-то в пределах видимости",
			"Тянет 3 карты вместо 2х в начале каждого хода", 
			"Мспользуя карту «Пиво» лечит 2 жизни") ;
		
		public function ServerAbilityPricesInfo(data:XML) 
		{
			var t:Object;
			var v:int = 0; 
			var n:int = 0;
			for each(var element:XML in data.*) 
			{
				t = new Object();
				t.price = Number(element);
				t.type = String(element.@type);
				if (t.type == "V")
				{
					t.label = _vip_ability_txt[v];
					t.info = _vip_ability_info[v];
					v++;
				}
				else 
				{
					t.label = _ability_txt[n];
					t.info = _ability_info[n];
					n++;
				}	
				_prices.push(t);
			}
		}
		
		public function get prices():Array
		{
			return _prices;
		}
		
	}
	
}