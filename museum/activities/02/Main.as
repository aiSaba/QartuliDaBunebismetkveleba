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
		
		//public static var _stage:*;
		
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
			
			//var context:LoaderContext = new LoaderContext();
			//var current:ApplicationDomain = ApplicationDomain.currentDomain;
			//context.applicationDomain = new ApplicationDomain();
			//context.allowLoadBytesCodeExecution = true;
			
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			
			//_stage = stage;
			
			//callControllerClass();	
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
			
			if (e.data == "ButtonVisibleFalse")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
				
			}
			if (e.data == "ButtonVisibleTrue")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
				
			}
			if (e.data == "endOfStage")
			{
				
				var qula:int = sortingClass.sabolooQula;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
			}
			
		}
		
	}
	
}