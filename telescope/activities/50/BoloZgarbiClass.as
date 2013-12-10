package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	public class BoloZgarbiClass extends MovieClip
	{
		
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		
		private var nextBack:NextBack;
		private var soundControl1:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function BoloZgarbiClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (zgarbiObjects)
			{
				removeChild(zgarbiObjects);
				zgarbiObjects = null;
			}
			
			TweenMax.killTweensOf(zgarbi);
			TweenMax.killTweensOf(textFrame);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addZgarbi();
		}
		
		private function addZgarbi():void
		{
			zgarbiObjects = new BoloZgarbi();
			
			zgarbiObjects.x = _stageWidth / 2;
			zgarbiObjects.y = _stageHeight / 2;
			
			zgarbiObjects.heigth = _stageHeight / 1.3;
			zgarbiObjects.scaleX = zgarbiObjects.scaleY;
			//Main.backGround.visible = true;
			addChild(zgarbiObjects);
			
			zgarbi = zgarbiObjects.zgarbi;
			textFrame = zgarbiObjects.textFrame;
			
			zgarbi.alpha = 0;
			textFrame.alpha = 0;
			
			animZgarbi();
		
		}
		
		private function animZgarbi():void
		{
			TweenMax.fromTo(zgarbi, 1, {x: zgarbi.x, y: (2 * _stageHeight)}, {x: zgarbi.x, y: zgarbi.y, alpha: 1, onComplete: addText});
		}
		
		private function addText():void
		{
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("50.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 0.7, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(callNextBack, 6000);
		}
		
		private function callNextBack():void
		{
			removeChild(zgarbiObjects);
			
			nextBack = new NextBack(_stageHeight, _stageWidth);
			addChild(nextBack);
			nextBack.addEventListener(DataEvent.DATA, endOfGame);
		}
		
		private function endOfGame(e:DataEvent):void
		{
			if (e.data == "endOfStage")
			{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfZgarbi"));
			}
		}
	}

}
