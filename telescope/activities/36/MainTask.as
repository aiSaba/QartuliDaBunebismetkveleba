package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.utils.setTimeout;
	
	public class MainTask extends MovieClip
	{
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		private var allText:MovieClip;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		private var mainGame:MainGame;
		
		private var soundControlz:SoundControl;
		private var soundControl1:SoundControl;
		private var soundControl2:SoundControl;
		private var soundControl3:SoundControl;
		
		public function MainTask(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			TweenMax.killTweensOf(zgarbi);
			TweenMax.killTweensOf(textFrame);
			
			if (zgarbiObjects)
			{
				removeChild(zgarbiObjects);
				zgarbiObjects = null;
			}
			
			if (allText) 
			{
				removeChild(allText);
				allText = null;
			}
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addZgarbi();
		}
		
		private function addZgarbi():void
		{
			setTimeout(sendData, 5);
			
			zgarbiObjects = new Level2Objects();
			
			zgarbiObjects.x = _stageWidth / 2;
			zgarbiObjects.y = _stageHeight / 2;
			
			zgarbiObjects.height = _stageHeight / 1.5;
			zgarbiObjects.scaleX = zgarbiObjects.scaleY;
			
			addChild(zgarbiObjects);
			zgarbi = zgarbiObjects.zgarbi;
			textFrame = zgarbiObjects.textFrame;
			
			zgarbi.alpha = 0;
			textFrame.alpha = 0;
			
			animZgarbi();
		}
		
		private function sendData():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
		}
		
		private function animZgarbi():void
		{
			TweenMax.fromTo(zgarbi, 1, {x: zgarbi.x, y: (2 * _stageHeight)}, {x: zgarbi.x, y: zgarbi.y, alpha: 1, onComplete: addText});
		}
		
		private function addText():void
		{
			soundControlz = new SoundControl();
			addChild(soundControlz);
			soundControlz.loadSound("35.mp3", 1);
			soundControlz.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 4000);
		}
		
		private function startLevel():void
		{
			removeChild(soundControlz);
			soundControlz = null;
			removeChild(zgarbiObjects);
			zgarbiObjects = null;
			
			allText = new AllText();
			allText.x = _stageWidth / 2;
			allText.y = _stageHeight / 2;
			
			allText.height = _stageHeight / 1.5;
			allText.scaleX = allText.scaleY;
			
			addChild(allText);
			
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			TweenMax.to(allText.text1, 1, {tint: 0xff0000});
			soundControl1.loadSound("35_1.mp3", 1);
			soundControl1.soundPlay();
			setTimeout(nextText, 8000);
		}
		private function nextText():void
		{
			removeChild(soundControl1);
			soundControl1 = null;
			TweenMax.to(allText.text1, 1, {tint: null});
			TweenMax.to(allText.text2, 1, {tint: 0xff0000});
			soundControl2 = new SoundControl();
			addChild(soundControl2);
			soundControl2.loadSound("35_2.mp3", 1);
			soundControl2.soundPlay();
			setTimeout(nextText1, 9000);
		}
		
		private function nextText1():void
		{
			removeChild(soundControl2);
			soundControl2 = null;
			TweenMax.to(allText.text2, 1, {tint: null});
			TweenMax.to(allText.text3, 1, {tint: 0xff0000});
			soundControl3 = new SoundControl();
			addChild(soundControl3);
			soundControl3.loadSound("35_3.mp3", 1);
			soundControl3.soundPlay();
			setTimeout(endScene, 11000);
		}
		
		private function endScene():void 
		{
			removeChild(soundControl3);
			soundControl3 = null;
			destroy(null);
			setTimeout(Task, 500);			
		}
		
		private function Task():void 
		{
			mainGame = new MainGame(_stageHeight, _stageWidth);
			mainGame.addEventListener(DataEvent.DATA, mainGameListener);
			addChild(mainGame);
		}
		
		private function mainGameListener(e:DataEvent):void 
		{
			if (e.data.indexOf("endOfGame") != -1)
			{
				trace("mevida eventi");
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "endOfGame"));
			}
			if (e.data == "ButtonVisibleFalse")
			{
				trace("visible false");
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			}
			if (e.data == "ButtonVisibleTrue")
			{
				trace("visible true");
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			}
		}
	}

}
