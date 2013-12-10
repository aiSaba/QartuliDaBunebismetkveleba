package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class Controller47 extends MovieClip
	{
		
		private var meshvideetpatiStart:Zgarbi;
		private var meshvideEtapiClass:Action47;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		
		private var qula:int;

		
		public function Controller47()
		{

			addEventListener(Event.ADDED_TO_STAGE, initHandler, false, 0, true)		
		}
		
		private function initHandler(e:Event):void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
			    stage.align = StageAlign.TOP_LEFT;
			}
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMain();
		}
		
		private function initMain():void
		{
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;			
			meshvideetpatiStart = new Zgarbi(_stageWidth, _stageHeight);
			addChild(meshvideetpatiStart);
			meshvideetpatiStart.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			
			
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchishemosvlas")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
				
			
			
				meshvideEtapiClass = new Action47(_stageWidth, _stageHeight);
				addChild(meshvideEtapiClass);
				meshvideEtapiClass.addEventListener(DataEvent.DATA, endOfGame, false, 0, true);
			}	
			
		}
		
		private function endOfGame(e:DataEvent):void 
		{
			if (e.data == "endOfStage")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame" ));
				
			}
		}		
		
	}

}

