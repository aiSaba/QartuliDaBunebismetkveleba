package  {
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	public class Game extends MovieClip 
	{
		
		private var loader:Loader;
		private var loadUrl:URLRequest;
		private var RebusiRand:MovieClip;
		private var stringArr:Array;
		private var randNum:Number;
		private var teleskopi:Rebusi;
		private var galaqtika:Galaqtika;
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void 
		{
			teleskopi = new Rebusi();
			galaqtika = new Galaqtika();
			stringArr = [teleskopi, galaqtika]
			randNum = Math.round(Math.random() + 0);
			CompletUrl();
		}
		
		private function CompletUrl():void 
		{
			addChild(stringArr[randNum]);
			stringArr[randNum].addEventListener(DataEvent.DATA, TheEndOfgame)
		}
		
		private function TheEndOfgame(e:DataEvent):void 
		{
			trace(e.data);
			if (e.data == "EndOfGame")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false,  "EndOfStage"));
			}
		}
	}
	
}
