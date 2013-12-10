package  {
	
	import flash.automation.StageCaptureEvent;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class FourthStageController extends MovieClip 
	{
		private var meoreEtapiClass:MeoreEtapiClass;
		private var fitrstText:FirstTextClass;
		private var secondText:SecondTextClass;
		private var thirdText:ThirdTextClass;
		private var fourthText:FourthTextClass;
		private var fifthText:FifthTextClass;
		private var sixthText:SixTextClass;
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var timerC:TimerClass;
		private var qula:int;
	
		
		public function FourthStageController()
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
			    stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initMain();
		}
		private function initMain():void
		{			
			
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			
			meoreEtapiClass = new MeoreEtapiClass(_stageWidth,_stageHeight);
			addChild(meoreEtapiClass);
			dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
			meoreEtapiClass.addEventListener(DataEvent.DATA, first);
			fitrstText = new FirstTextClass(_stageWidth,_stageHeight);
			fitrstText.addEventListener(DataEvent.DATA, first);
			secondText = new SecondTextClass(_stageWidth,_stageHeight);
			secondText.addEventListener(DataEvent.DATA, first);
			thirdText = new ThirdTextClass(_stageWidth,_stageHeight);
			thirdText.addEventListener(DataEvent.DATA, first);
			fourthText = new FourthTextClass(_stageWidth,_stageHeight);
			fourthText.addEventListener(DataEvent.DATA, first);
			fifthText = new FifthTextClass(_stageWidth,_stageHeight);
			fifthText.addEventListener(DataEvent.DATA, first);;
			sixthText = new SixTextClass(_stageWidth,_stageHeight);
			sixthText.addEventListener(DataEvent.DATA, first1);
			
			
			
		}
		
		private function first1(e:DataEvent):void 
		{
			if (e.data == "endOfStage")
			{		
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
				qula = timerC.returnQula();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				removeChild(timerC);
			}
		}
		
		private function first(e:DataEvent):void 
		{
			if (e.data == "MovrchiShesvlas")
			{	
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleTrue"));
				timerC = new TimerClass();
				addChild(timerC);
				timerC.x = _stageWidth - timerC.width;
				timerC.y =  timerC.height;
				addChild(fitrstText);	
			}
			if (e.data == "MovrchiPirvels")
			{
				addChild(secondText);
			}
			if (e.data == "MovrchiMeores")
			{
				addChild(thirdText);
			}
			if (e.data == "MovrchiMesames")
			{
				addChild(fourthText);
			}
			if (e.data == "MovrchiMeotxes")
			{
				addChild(fifthText);
			}
			if (e.data == "MovrchiMexutes")
			{				
				addChild(sixthText);
			}
			
		}
		
		
		
	}
	
}
