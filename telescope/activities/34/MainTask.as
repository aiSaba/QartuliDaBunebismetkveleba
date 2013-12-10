package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	public class MainTask extends MovieClip
	{
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		
		private var earth:MovieClip;
		private var oceansArray:Array;
		
		private var counter:int;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var timerC:TimerClass;
		private var qula:int;
		private var correctSoundControl:SoundControl;
		private var soundControl1:SoundControl;
		
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
			//if (earth.indoetis) 
			//{
			//removeChild(earth.indoetis);
			//earth.indoetis = null;
			//}
			//if (earth.samxretis) 
			//{
			//removeChild(earth.samxretis);
			//earth.samxretis = null;
			//}
			//if (earth.wynari) 
			//{
			//removeChild(earth.wynari);
			//earth.wynari = null;
			//}
			//if (earth.wynari2) 
			//{
			//removeChild(earth.wynari2);
			//earth.wynari2 = null;
			//}
			//if (earth.atlantis) 
			//{
			//removeChild(earth.atlanta);
			//earth.atlantis = null;
			//}
			//if (earth.arqtikis) 
			//{
			//removeChild(earth.arqtikis);
			//earth.arqtikis = null;
			//}
			if (earth)
			{
				removeChild(earth);
				earth = null;
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
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("34.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 3000);
		}
		
		private function startLevel():void
		{
			removeChild(soundControl1);
			soundControl1 = null;
			removeChild(zgarbiObjects);
			zgarbiObjects = null;
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			
			timerC = new TimerClass();
			addChild(timerC);
			timerC.x = _stageWidth - timerC.height;
			timerC.y = timerC.height;
			
			earth = new Earth();
			
			earth.x = _stageWidth / 2;
			earth.y = _stageHeight / 2;
			
			addChild(earth);
			
			earth.height = _stageHeight / 1.2;
			earth.scaleX = earth.scaleY;
			
			oceansArray = [earth.arqtikis, earth.atlanta, earth.indoetis, earth.samxretis, earth.wynariOrive];
			
			for (var i:int = 0; i < oceansArray.length; i++)
			{
				oceansArray[i].alpha = 0;
				oceansArray[i].addEventListener(MouseEvent.MOUSE_DOWN, appearOcean);
			}
		}
		
		private function appearOcean(e:MouseEvent):void
		{
			TweenMax.to(e.currentTarget, 0.5, {alpha: 1});
			e.currentTarget.mouseEnabled = false;
			counter++;
			if (counter == 5)
			{
				correctSoundControl = new SoundControl;
				correctSoundControl.loadSound("correct.mp3", 1);
				addChild(correctSoundControl);
				correctSoundControl.soundPlay();
				
				trace("moige");
				setTimeout(nextTast, 2000);
			}
		}
		
		private function nextTast():void
		{
			qula = timerC.returnQula() + 5;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString()));
			
			removeChild(timerC);
			timerC = null;
			
			destroy(null);
		}
	
	}

}
