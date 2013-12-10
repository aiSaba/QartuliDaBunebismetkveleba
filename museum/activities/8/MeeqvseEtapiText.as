package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	
	public class MeeqvseEtapiText extends MovieClip 
	{
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var example:MovieClip;
		
		public function MeeqvseEtapiText(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler);
		}
		
		private function initHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initText();
		}
	
		private function initText():void
		{
			example =  new Example_MC();
			example.x = _stageWidth / 2;
			example.y = _stageHeight / 2;
			example.width = _stageWidth/1.3;
			example.scaleY = example.scaleX;			
			addChild(example);
			TweenMax.to(example, 3, { frame:20, onComplete:nextClass } )
			
		}
		
		private function nextClass():void 
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchitext"));
			if (example)
			{
				removeChild(example);
				example = null;
			}
						
		}
	}
	
}
