package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class Museumi3Class extends MovieClip
	{
		private var museum3Objects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function Museumi3Class(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (museum3Objects)
			{
				removeChild(museum3Objects);
				museum3Objects = null;
			}
			
		    TweenMax.killTweensOf(museum3Objects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			museum3Objects = new Museum3();
			
			museum3Objects.x = _stageWidth / 2;
			museum3Objects.y = _stageHeight / 2;
			
			museum3Objects.height = _stageHeight / 1.2;
			museum3Objects.scaleX = museum3Objects.scaleY;
			
			museum3Objects.alpha = 0;
			addChild(museum3Objects);
			animMuseum3();
		}
		private function animMuseum3():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_10_page.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(museum3Objects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(museum3Objects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
