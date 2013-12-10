package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class DasasruliClass extends MovieClip
	{
		private var dasasruli:MovieClip;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function DasasruliClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (dasasruli)
			{
				removeChild(dasasruli);
				dasasruli = null;
			}
			
		    TweenMax.killTweensOf(dasasruli);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		
		
		public function addObjects():void
		{
			dasasruli = new Dasasruli();
			
			dasasruli.x = _stageWidth / 2;
			dasasruli.y = _stageHeight / 2;
			
			dasasruli.height = _stageHeight / 2;
			dasasruli.scaleX = dasasruli.scaleY;
			
			dasasruli.alpha = 0;
			addChild(dasasruli);
			animDasasruli();
		}
		private function animDasasruli():void
		{
			TweenMax.to(dasasruli, 1, { alpha:1, onComplete:sceneIsFinished } );
			
			//var tempVariable:String = Settings.score.toString();
			//dasasruli.qulaTextBox.text = "შენ დააგროვე" + " " + tempVariable + " " + "ქულა"; 
		}
		public function gasvla():void
		{
			TweenMax.to(dasasruli, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"));
		}
	}

}
