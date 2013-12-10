package
{
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.display.Loader;
	
	/**
	 * ...
	 * @author ... nika
	 */
	public class Main extends MovieClip
	{
		
		private var _stageHeight;
		private var _stageWidth;
		
		//public static var _stage:*;
		
		private var boloZgarbiClass:BoloZgarbiClass;
		
		public function Main():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//_stage = stage;
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			
			callControllerClass();
		
		}
		
		private function callControllerClass():void
		{
			boloZgarbiClass = new BoloZgarbiClass(_stageHeight, _stageWidth);
			addChild(boloZgarbiClass);
			boloZgarbiClass.addEventListener(DataEvent.DATA, endOfGame)
		
		}
		
		private function endOfGame(e:DataEvent):void
		{
			if (e.data == "endOfZgarbi")
			{				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "The End"));
			}
		}
	
	}

}