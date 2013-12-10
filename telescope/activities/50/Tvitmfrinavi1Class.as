package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class Tvitmfrinavi1Class extends MovieClip
	{
		private var tvitmfrinavi1Objects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function Tvitmfrinavi1Class(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (tvitmfrinavi1Objects)
			{
				removeChild(tvitmfrinavi1Objects);
				tvitmfrinavi1Objects = null;
			}
			
		    TweenMax.killTweensOf(tvitmfrinavi1Objects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			tvitmfrinavi1Objects = new Tvitmfrinavi();
			
			tvitmfrinavi1Objects.x = _stageWidth / 2;
			tvitmfrinavi1Objects.y = _stageHeight / 2;
			
			tvitmfrinavi1Objects.height = _stageHeight / 1.2;
			tvitmfrinavi1Objects.scaleX = tvitmfrinavi1Objects.scaleY;
			
			tvitmfrinavi1Objects.alpha = 0;
			addChild(tvitmfrinavi1Objects);
			animTvitmfrinavi();
		}
		private function animTvitmfrinavi():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_05_page.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(tvitmfrinavi1Objects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(tvitmfrinavi1Objects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
