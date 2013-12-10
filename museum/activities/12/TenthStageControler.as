package
{
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.net.URLRequest;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class TenthStageControler extends MovieClip
	{
		private var meateEtapiStart:MeateEtapi;
		private var meateEtapiClass:Clock;
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var timerC:TimerClass;
		private var qula:int;
		
		public function TenthStageControler()
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
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
			meateEtapiStart = new MeateEtapi(_stageWidth, _stageHeight);
			addChild(meateEtapiStart);
			dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
			meateEtapiStart.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			
			
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchishemosvlas")
			{
				timerC = new TimerClass();
				addChild(timerC);
				timerC.x = _stageWidth - timerC.width;
				timerC.y =  timerC.height;
				meateEtapiClass = new Clock(_stageWidth, _stageHeight);
				addChild(meateEtapiClass);
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleTrue"));
				meateEtapiClass.addEventListener(DataEvent.DATA, endOfGame, false, 0, true);
			}	
			
		}
		
		private function endOfGame(e:DataEvent):void 
		{
			if (e.data == "EndOFClass")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
				qula = timerC.returnQula();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				removeChild(timerC);
			}
		}		
		
		
	}
}