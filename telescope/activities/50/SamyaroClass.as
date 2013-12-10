package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class SamyaroClass extends MovieClip
	{
		private var qalaqi:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function SamyaroClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (qalaqi)
			{
				removeChild(qalaqi);
				qalaqi = null;
			}
			
		    TweenMax.killTweensOf(qalaqi);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			qalaqi = new Samyaro();
			
			qalaqi.x = _stageWidth / 2;
			qalaqi.y = _stageHeight / 2;
			
			qalaqi.height = _stageHeight / 1.2;
			qalaqi.scaleX = qalaqi.scaleY;
			
			qalaqi.alpha = 0;
			addChild(qalaqi);
			animMuseum2();
		}
		private function animMuseum2():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.addEventListener(DataEvent.DATA, soundListener);
			soundControl.loadSound("8.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(qalaqi, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		private function soundListener(e:DataEvent):void 
		{
			soundControl.removeEventListener(DataEvent.DATA, soundListener);
			removeChild(soundControl);
			soundControl = null;
			
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("9.mp3", 1);
			soundControl.soundPlay()
			
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(qalaqi, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
