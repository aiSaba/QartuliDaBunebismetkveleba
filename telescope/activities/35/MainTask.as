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
		
		private var oceansArray:Array;
		private var qsnArray:Array;
		private var counter:int;
		
		private var qsnArqtikis:MovieClip;
		private var qsnIndoetis:MovieClip;
		private var qsnWynari:MovieClip;
		private var qsnSamxretis:MovieClip;
		private var qsnAtlantis:MovieClip;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var timerC:TimerClass;
		private var qula:int;
		private var correctSoundControl:SoundControl;
		private var earth:MovieClip;
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
			if (earth) 
			{
				removeChild(earth);
				earth = null;
			}
			
			if (qsnArqtikis) 
			{
				removeChild(qsnArqtikis);
				qsnArqtikis = null;
			}
			
			if (qsnAtlantis) 
			{
				removeChild(qsnAtlantis);
				qsnAtlantis = null;
			}
			
			if (qsnIndoetis) 
			{
				removeChild(qsnIndoetis);
				qsnIndoetis = null;
			}
			
			if (qsnSamxretis) 
			{
				removeChild(qsnSamxretis);
				qsnSamxretis = null;
			}
			
			if (qsnWynari) 
			{
				removeChild(qsnWynari);
				qsnWynari = null;
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
			soundControl1.loadSound("35.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 3000);
		}
		
		private function startLevel():void
		{
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
			
			earth.height = _stageHeight / 1.8;
			earth.scaleX = earth.scaleY;
			
			oceansArray = [earth.arqtikis, earth.atlanta, earth.indoetis, earth.samxretis, earth.wynari1];
			
			for (var i:int = 0; i < oceansArray.length; i++)
			{
				oceansArray[i].alpha = 0;
				oceansArray[i].mouseEnabled = false;
					//oceansArray[i].addEventListener(MouseEvent.MOUSE_DOWN, appearOcean);
			}
			
			////////////////////////
			qsnArqtikis = new QsnArqtikis();
			qsnAtlantis = new QsnAtlantis();
			qsnIndoetis = new QsnIndoetis();
			qsnSamxretis = new QsnSamxretis();
			qsnWynari = new QsnWynari();
			
			qsnArray = [qsnArqtikis, qsnAtlantis, qsnIndoetis, qsnSamxretis, qsnWynari];
			
			getQuestions();
		
		}
		
		private function getQuestions():void
		{
			if (counter == 0)
			{
				question(qsnArqtikis);
				earth.arqtikis.mouseEnabled = true;
				earth.arqtikis.addEventListener(MouseEvent.MOUSE_DOWN, arqAppear);
			}
			if (counter == 1)
			{
				removeChild(qsnArqtikis);
				qsnArqtikis = null;
				
				question(qsnAtlantis);
				earth.atlanta.mouseEnabled = true;
				earth.atlanta.addEventListener(MouseEvent.MOUSE_DOWN, atlAppear);
			}
			if (counter == 2)
			{
				removeChild(qsnAtlantis);
				qsnAtlantis = null;
				
				question(qsnIndoetis);
				earth.indoetis.mouseEnabled = true;
				earth.indoetis.addEventListener(MouseEvent.MOUSE_DOWN, indAppear);
			}
			if (counter == 3)
			{
				removeChild(qsnIndoetis);
				qsnIndoetis = null;
				
				question(qsnSamxretis);
				earth.samxretis.mouseEnabled = true;
				earth.samxretis.addEventListener(MouseEvent.MOUSE_DOWN, samxAppear);
			}
			if (counter == 4)
			{
				removeChild(qsnSamxretis);
				qsnSamxretis = null;
				
				question(qsnWynari);
				earth.wynari1.mouseEnabled = true;
				earth.wynari1.addEventListener(MouseEvent.MOUSE_DOWN, wynAppear);
			}
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
		
		private function wynAppear(e:MouseEvent):void 
		{
			TweenMax.to(earth.wynari1, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function samxAppear(e:MouseEvent):void 
		{
			TweenMax.to(earth.samxretis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function indAppear(e:MouseEvent):void 
		{
			TweenMax.to(earth.indoetis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function atlAppear(e:MouseEvent):void
		{
			TweenMax.to(earth.atlanta, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function arqAppear(e:Event):void
		{
			TweenMax.to(earth.arqtikis, 0.5, {alpha: 1});
			e.currentTarget.mouseEnabled = false;
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function question(mc:MovieClip):void
		{
			mc.x = _stageWidth / 2.2;
			mc.y = earth.y + earth.width / 2.2;
			
			mc.height = _stageHeight / 8;
			mc.scaleX = mc.scaleY;
			
			addChild(mc);
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
