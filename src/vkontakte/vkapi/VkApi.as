package vkontakte.vkapi
{
	//import src.vkapi.MD5;
	//import src.vkapi.Parameter;

	/**
	 * Класс VkApi. Для каждого запроса создается экземпляр данного класса,
	 * задаются метод API и параметры запроса и вызывается getQuery метод.  
	 *
	 * @package	wronglink.vk
	 * @author	Michael Elovskih <wronglink@gmail.com>
	 */	
	public class VkApi
	{	
		private var parameters: Array;

		public var viewer_id: Number;
		public var api_id: Number;
		public var method: String;
		public var secret: String;
		public var test_mode: Boolean; 
		public var format: String;
		public var version: String;
		public var server_url: String;

		/**
		 * Конструктор класса. Принимает обязательные $api_id (Id приложения) и
		 * $secret (секретный код приложения). 
		 * 
		 * @param	Number	$viewer_id	Id пользователя, просматривающего приложение.
		 * @param	Number	$api_id		Id приложения.
		 * @param	String	$secret		Секретный код приложения.
		 * @param	Boolean	$test_mode	Включен ли тестовый режим. 
 		 * @param	String	$format		Формат ответа (XML или JSON).
		 * @param	String	$version	Версия API.
		 * @param	String	$server_url	Адрес сервера API.
		 */	
		public function VkApi(viewer_id: Number,
								api_id: Number,
								method: String,
								secret: String, 
								test_mode: Boolean,
								format: String,
								version: String,
								server_url: String)
		{
			this.viewer_id = viewer_id;
			this.api_id = api_id;
			this.method = method;
			this.secret = secret;
			this.test_mode = test_mode;
			this.format = format;
			this.version = version;
			this.server_url = server_url;

			parameters = new Array();

			parameters.push(new Parameter('api_id', api_id.toString()));
			parameters.push(new Parameter('method', method));
			parameters.push(new Parameter('test_mode', int(test_mode).toString()));
			parameters.push(new Parameter('format', format));
			parameters.push(new Parameter('v', version));
			parameters.push(new Parameter('random', int(Math.random()*10000).toString()));
		}

		/**
		 * Добавляет параметр запроса.
		 * 
		 * @param	String	$p_name		Название параметра
		 * @param	String	$p_value	Значение параметра
		 * 
		 */
		public function addParameter(p_name: String, p_value: String): void
		{
			parameters.push(new Parameter(p_name, p_value));
		}
		
		/**
		 * toString метод класса.
		 *  
		 * @return	String	Строка запроса. 
		 */
		public function toString(): String
		{
			parameters.push(new Parameter('sig', getSig(parameters)));
			return server_url+parameters.join('&');
		}

		/**
		 * Возвращает строку запроса.
		 *
		 * @return  string	Строка запроса.	
		 */		
		public function getQuery(): String
		{
			return this.toString();
		}
		
		/**
		 * Возвращает сигнатуру (sig-подпись).
		 * 
		 * @param	Array	parameters	Массив параметров.
		 * @return	String	Sig-подпись.
		 * 
		 */
		private function getSig(parameters: Array): String
		{
			parameters.sortOn("name");
			return MD5.encrypt(viewer_id + joinToUsualString(parameters) + secret);
		}
		
		/**
		 * Join массива параметров, вызывающего метод toUsualString у каждого из элементов, который
		 * необходим для правильной кодировки параметров и их значений.
		 * 
		 * @param	Array	parameters	Массив параметров.
		 * @return 
		 * 
		 */
		private function joinToUsualString (parameters: Array): String
		{
			var i: int;
			var str: String = '';
			for (i = 0; i < parameters.length; i++)
				str += parameters[i].toUsualString();
			return str;
		}
	}
}