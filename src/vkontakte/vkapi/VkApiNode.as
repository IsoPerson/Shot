package src.vkontakte.vkapi
{
	
	/**
	 * Класс обертка, для VkApi. Здесь описываются методы для запросов.
	 *
	 * @package	vk
	 * @author	Michael Elovskih <wronglink@gmail.com>
	 */
	public class VkApiNode
	{
		public var viewer_id: Number;
		public var api_id: Number;
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
 		 * @param	String	$format		Формат ответа (XML или JSON). По умолчанию, 'XML'.
		 * @param	String	$version	Версия API. По умолчанию, '2.0'.
		 * @param	String	$server_url	Адрес сервера API. По умолчанию 'http://api.vkontakte.ru/api.php?'.
		 */	
		public function VkApiNode (viewer_id: Number,
									api_id: Number,
									secret: String, 
									test_mode: Boolean = false,
									format: String = 'XML',
									version: String = '2.0',
									server_url: String = 'http://api.vkontakte.ru/api.php?')
		{
			this.viewer_id = viewer_id;
			this.api_id = api_id;
			this.secret = secret;
			this.test_mode = test_mode;
			this.format = format;
			this.version = version;
			this.server_url = server_url;
		}
	
		
		//////////////////////
		//	User methods	//
		//////////////////////

		/**
		 * Возвращает установил пользователь данное приложение или нет.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=isAppUser
		 * 
		 * @param	Number	uid Id пользователя.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function isAppUser (uid: Number = -1): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'isAppUser',
										secret,
										test_mode,
										format,
										version,
										server_url);
			if (uid != -1)
				api.addParameter('uid', uid.toString());
			return api.getQuery();
		}

		/**
		 * Возвращает расширенную информацию о пользователях.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getProfiles
		 * 
		 * @param	Array	uids	Массив Id пользователей.
		 * @param	Array	fields	Массив полей (uid, first_name, last_name, nickname, sex,
		 * bdate (birthdate), city, country, timezone, photo, photo_medium, photo_big)
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getProfiles (uids: Array, fields: Array = null): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getProfiles',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('uids', uids.join(','));
			if (fields)
				api.addParameter('fields', fields.join(','));
			return api.getQuery();
		}

		/**
		 * Возвращает список идентификаторов друзей текущего пользователя.
 		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getFriends	
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getFriends (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getFriends',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}

		/**
		 * Возвращает список идентификаторов друзей текущего пользователя, которые установили данное приложение.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getAppFriends
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getAppFriends (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getAppFriends',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}

		/**
		 * Возвращает баланс текущего пользователя на счету приложения в сотых долях голоса.
	 	 * @see	http://vkontakte.ru/pages.php?o=-1&p=getUserBalance
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getUserBalance (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getUserBalance',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}


		//////////////////////
		//	Photo methods	//
		//////////////////////

		/**
 		 * Возвращает список альбомов пользователя.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getPhotoAlbums
		 * 
		 * @param	Number	uid	Id пользователя. По умолчанию - текущий пользователь.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getPhotoAlbums (uid: Number = -1): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getPhotoAlbums',
										secret,
										test_mode,
										format,
										version,
										server_url);
			if (uid != -1)
				api.addParameter('uid', uid.toString());
			return api.getQuery();
		}

		/**
		 * Возвращает список фотографий в альбоме. 
 		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getPhotos
		 * 
		 * @param	Number	uid		Id пользователя.
		 * @param	Number	aid		Id альбома.
		 * @param	Array	pids	Массив Id фотографий.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getPhotos (uid: Number, aid: Number, pids: Array = null): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getPhotos',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('uid', uid.toString());
			api.addParameter('aid', aid.toString());
			if (pids)
				api.addParameter('pids', pids.join(','));
			return api.getQuery();
		}

		/**
		 * Создает пустой альбом для фотографий.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=createPhotoAlbum
		 *  
		 * @param	String	title		Заголовок альбома.
		 * @param	Number	privacy		уровень доступа к альбому. Возможные значения: 
		 * 0 – друзья и друзья друзей, 1 – все пользователи, 2 – только друзья.
		 * @param	String	description	Описание альбома.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function createPhotoAlbum (title: String, privacy: Number = -1, description: String = ''): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'createPhotoAlbum',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('title', title);
			if (privacy != -1)
				api.addParameter('privacy', privacy.toString());
			if (description != '')
				api.addParameter('description', description);
			return api.getQuery();
		}

		/**
		 * Возвращает адрес сервера для загрузки фотографий.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getPhotosUploadServer
		 * 
		 * @param	Number	aid	Id альбома.	
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getPhotosUploadServer (aid: Number = -1): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getPhotosUploadServer',
										secret,
										test_mode,
										format,
										version,
										server_url);
			if (aid != -1)
				api.addParameter('aid', aid.toString());
			return api.getQuery();
		}

		/**
		 * Сохраняет фотографии после успешной загрузки.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=savePhotos
		 * 
		 * @param	Number aid			Id альбома.
		 * @param	String server		Параметр, возвращаемый в результате загрузки фотографий на сервер.
		 * @param	String photos_list	Параметр, возвращаемый в результате загрузки фотографий на сервер.
		 * @param	String hash			Параметр, возвращаемый в результате загрузки фотографий на сервер.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function savePhotos (aid: Number, server: String, photos_list: String, hash: String): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'savePhotos',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('aid', aid.toString());
			api.addParameter('server', server);
			api.addParameter('photos_list', photos_list);
			api.addParameter('hash', hash);
			return api.getQuery();
		}


		//////////////////////
		//	Audio methods	//
		//////////////////////

		/**
		 * Возвращает список аудиозаписей пользователя. 
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getAudios
		 * 
		 * @param	Number	uid		Id пользователя.
		 * @param	Array	aids	Массив Id аудиозаписей.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getAudios (uid: Number = -1, aids: Array = null): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getAudios',
										secret,
										test_mode,
										format,
										version,
										server_url);
			if (uid != -1)	
				api.addParameter('uid', uid.toString());
			if (aids)
				api.addParameter('aids', aids.join(','));
			return api.getQuery();
		}
		
		/**
		 * Возвращает адрес сервера для загрузки аудиозаписей.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getAudioUploadServer
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getAudioUploadServer (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getAudioUploadServer',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}
		
		/**
		 * Сохраняет аудиозаписи после успешной загрузки. 
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=saveAudio
		 * 
		 * @param	String	server	Параметр, возвращаемый в результате загрузки аудиофайла на сервер.
		 * @param	String	audio	Параметр, возвращаемый в результате загрузки аудиофайла на сервер.
		 * @param	String	hash	Параметр, возвращаемый в результате загрузки аудиофайла на сервер.
		 * @param	String	artist	Автор композиции.
		 * @param	String	title	Название трека.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function saveAudio (server: String,
									audio: String,
									hash: String,
									artist: String = '',
									title: String = ''): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'saveAudio',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('server', server);
			api.addParameter('audio', audio);
			api.addParameter('hash', hash);
			if (artist != '')
				api.addParameter('artist', artist);
			if (title != '')
				api.addParameter('title', title);
			return api.getQuery();
		}


		//////////////////////
		//	Geo methods		//
		//////////////////////

		/**
		 * Возвращает информацию о городах по их идентификаторам.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getCities
		 * 
		 * @param	Array	cids	Массив Id городов.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getCountries (cids: Array): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getCountries',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('cids', cids.join(','));
			return api.getQuery();
		}
		
		/**
		 * Возвращает информацию о странах по их идентификаторам.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getCountries
		 * 
		 * @param	Array	cids	Массив Id стран.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getCities (cids: Array): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getCities',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('cids', cids.join(','));
			return api.getQuery();
		}
		

		//////////////////////
		//	Other methods	//
		//////////////////////

		/**
		 * Возвращает значение переменной, номер которой задан в параметре key (0-4095).
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getVariable
		 * 
		 * @param	Number	key		Ключ переменной.
		 * @param	Number	user_id	Id пользователя.
		 * @param	Number	session	Целочисленный идентификатор сеанса (комнаты).
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getVariable (key: Number, user_id: Number = -1, session: Number = -1): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getVariable',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('key', key.toString());
			if(user_id != -1)
				api.addParameter('user_id', user_id.toString());	
			if(session != -1)
				api.addParameter('session', session.toString());
							
			return api.getQuery();
		}

		/**
		 * Возвращает список значений диапазона переменных.
		 * key - номер первой переменной, count - число переменных.
		 * Данный метод позволяет получить за один запрос до 32 переменных. 
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getVariables
		 * 
		 * @param	Number	key		Ключ переменной.
		 * @param	Number	count	Количество переменных
		 * @param	Number	user_id	Id пользователя.
		 * @param	Number	session	Целочисленный идентификатор сеанса (комнаты).
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getVariables (key: Number, count: Number, user_id: Number = -1, session: Number = -1): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getVariables',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('key', key.toString());
			api.addParameter('count', count.toString());
			if(user_id != -1)
				api.addParameter('user_id', user_id.toString());	
			if(session != -1)
				api.addParameter('session', session.toString());
			return api.getQuery();
		}

		/**
		 * Помещает в переменную, номер которой задан в параметре key.
		 * value - строка в utf-8, не более 255 байтов. 
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=putVariable	
		 * 
		 * @param	Number	key		Ключ переменной.
		 * @param	String	value	Значение переменной.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function putVariable (key: Number, value: String): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'putVariable',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('key', key.toString());
			api.addParameter('value', value);
			return api.getQuery();
		}

		/**
		 * Возвращает таблицу рекордов.
 		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getHighScores
		 *  
 		 * @return  String	Строка запроса.	
		 */		
		public function getHighScores (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getHighScores',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}

		/**
		 * Добавляет в таблицу рекордов результат текущего пользователя.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=setUserScore
		 * 
		 * @param score
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function setUserScore (score: String): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'setUserScore',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('score', score);
			return api.getQuery();
		}

		/**
		 * Получает очередь сообщений.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getMessages
		 * 
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getMessages (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getMessages',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}

		/**
		 * Добавляет в очередь сообщение.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=sendMessage
		 * 
		 * @param	String	message	Текст сообщения.
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function sendMessage (message: String): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'sendMessage',
										secret,
										test_mode,
										format,
										version,
										server_url);
			api.addParameter('message', message);
			return api.getQuery();
		}

		/**
		 * Возвращает текущее время на сервере ВКонтакте в unixtime.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getServerTime
		 * 
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getServerTime (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getServerTime',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}


		//////////////////////
		//	Old methods		//
		//////////////////////

		/**
		 * Возвращает id и имя текущего пользователя. 
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getUserInfo
		 * 
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getUserInfo (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getUserInfo',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}

		/**
		 * Возвращает расширенную информацию о текущем пользователе.
		 * @see	http://vkontakte.ru/pages.php?o=-1&p=getUserInfoEx
		 * 
		 * 
 		 * @return  String	Строка запроса.	
		 */		
		public function getUserInfoEx (): String
		{
			var api: VkApi = new VkApi(viewer_id,
										api_id,
										'getUserInfoEx',
										secret,
										test_mode,
										format,
										version,
										server_url);
			return api.getQuery();
		}
	}
}