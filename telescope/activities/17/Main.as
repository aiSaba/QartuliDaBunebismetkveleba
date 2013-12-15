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
	public class  Main extends MovieClip
	{
		
		private var _stageHeight;
		private var _stageWidth;
		
		private var controllerClass:Controller;
		private var sortingClass:SortingClass;
		
		
		
		public function Main():void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
			    stage.align = StageAlign.TOP_LEFT;
			}
			
			addEventListener(Event.ADDED_TO_STAGE, init);		
		}
		private function init(event:Event):void
	    {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			
		    callSortingClass();
			
		}
		
		private function callSortingClass():void 
		{			
			sortingClass = new SortingClass(_stageHeight, _stageWidth);
			addChild(sortingClass);
			
			sortingClass.addEventListener(DataEvent.DATA , endOfGame);
		}
		
		private function endOfGame(e:DataEvent):void 
		{
			if (e.data.indexOf("endOfGame") != -1)
			{
				trace("mevida eventi");
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "endOfGame"));
			}
		}
		
	}
	
}