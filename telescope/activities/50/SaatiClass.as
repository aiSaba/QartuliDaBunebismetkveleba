package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class SaatiClass extends MovieClip
	{
		private var saatiObjects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function SaatiClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (saatiObjects)
			{
				removeChild(saatiObjects);
				saatiObjects = null;
			}
			
		    TweenMax.killTweensOf(saatiObjects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			saatiObjects = new Saati();
			
			saatiObjects.x = _stageWidth / 2;
			saatiObjects.y = _stageHeight / 2;
			
			saatiObjects.height = _stageHeight / 1.2;
			saatiObjects.scaleX = saatiObjects.scaleY;
			
			saatiObjects.alpha = 0;
			addChild(saatiObjects);
			animSaati();
		}
		private function animSaati():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_03_page.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(saatiObjects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(saatiObjects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
