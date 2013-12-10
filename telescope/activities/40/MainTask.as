package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import com.greensock.*
	import com.greensock.easing.*
	
	public class MainTask extends MovieClip
	{
		
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
	
		private var mainObjects:MovieClip;
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
			
			for (var i:int = 0; i < oceansArray.length; i++) 
			{
				oceansArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, appearOcean);
			}
			
			if (mainObjects) 
			{
				removeChild(mainObjects);
				mainObjects = null;
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
			soundControl1.loadSound("40.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 4000);
		}
		
		private function startLevel():void
		{
			removeChild(zgarbiObjects);
			zgarbiObjects = null;
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			
			mainObjects = new MainObjects();
			mainObjects.x = _stageWidth / 2;
			mainObjects.y = _stageHeight / 2;
			
			addChild(mainObjects);
			
			mainObjects.height = _stageHeight / 1.2;
			mainObjects.scaleX = mainObjects.scaleY;
			
			oceansArray = [mainObjects.mtvare.wvimis, mainObjects.mtvare.ushfotvelobis, mainObjects.mtvare.siwynaris, mainObjects.mtvare.sinestis, mainObjects.mtvare.sicivis, mainObjects.mtvare.shtormis, mainObjects.mtvare.neqtaris, mainObjects.mtvare.nayofierebis, mainObjects.mtvare.krizisis, mainObjects.mtvare.grublebis];
			mainObjects.mtvare.wvimis.alpha = 0;
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
			if (counter == oceansArray.length)
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
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			
			destroy(null);
		}
	}

}
