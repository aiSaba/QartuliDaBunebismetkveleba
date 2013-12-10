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
		
		//Questions
		private var qsnWvimis:MovieClip;
		private var qsnUsh:MovieClip;
		private var qnsSiwy:MovieClip;
		private var qsnSinestis:MovieClip;
		private var qsnSicivis:MovieClip;
		private var qsnShtorm:MovieClip;
		private var qsnNeqt:MovieClip;
		private var qsnNayof:MovieClip;
		private var qsnKriz:MovieClip;
		private var qsnGrub:MovieClip;
		
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
			soundControl1.loadSound("41.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 2000);
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
			
			mainObjects = new MainObjects();
			mainObjects.x = _stageWidth / 2;
			mainObjects.y = _stageHeight / 2 - mainObjects.height / 6;
			
			addChild(mainObjects);
			
			mainObjects.height = _stageHeight / 1.5;
			mainObjects.scaleX = mainObjects.scaleY;
			
			oceansArray = [mainObjects.mtvare.wvimis, mainObjects.mtvare.ushfotvelobis, mainObjects.mtvare.siwynaris, mainObjects.mtvare.sinestis, mainObjects.mtvare.sicivis, mainObjects.mtvare.shtormis, mainObjects.mtvare.neqtaris, mainObjects.mtvare.nayofierebis, mainObjects.mtvare.krizisis, mainObjects.mtvare.grublebis];
			
			for (var i:int = 0; i < oceansArray.length; i++)
			{
				oceansArray[i].alpha = 0;
				oceansArray[i].mouseEnabled = false;
			}
			
			qsnWvimis = new QsnWvimis();
			qsnUsh = new QsnUsh();
			qnsSiwy = new QsnSiwynaris();
			qsnSinestis = new QsnSinestis();
			qsnSicivis = new QsnSicivis();
			qsnShtorm = new QsnShtormis();
			qsnNeqt = new QsnNeqt();
			qsnNayof = new QsnNayof();
			qsnKriz = new QsnKrizisis();
			qsnGrub = new QsnGrublebis();
			
			getQuestions();
		}
		
		private function getQuestions():void
		{
			if (counter == 0)
			{
				question(qsnWvimis);
				mainObjects.mtvare.wvimis.mouseEnabled = true;
				mainObjects.mtvare.wvimis.addEventListener(MouseEvent.MOUSE_DOWN, wvAppear);
			}
			if (counter == 1)
			{
				removeChild(qsnWvimis);
				qsnWvimis = null;
				mainObjects.mtvare.wvimis.removeEventListener(MouseEvent.MOUSE_DOWN, wvAppear);
				question(qsnUsh);
				mainObjects.mtvare.ushfotvelobis.mouseEnabled = true;
				mainObjects.mtvare.ushfotvelobis.addEventListener(MouseEvent.MOUSE_DOWN, ushAppear);
			}
			if (counter == 2)
			{
				removeChild(qsnUsh);
				qsnUsh = null;
				mainObjects.mtvare.ushfotvelobis.removeEventListener(MouseEvent.MOUSE_DOWN, ushAppear);
				question(qnsSiwy);
				mainObjects.mtvare.siwynaris.mouseEnabled = true;
				mainObjects.mtvare.siwynaris.addEventListener(MouseEvent.MOUSE_DOWN, siwyAppear);
			}
			if (counter == 3)
			{
				removeChild(qnsSiwy);
				qnsSiwy = null;
				mainObjects.mtvare.siwynaris.removeEventListener(MouseEvent.MOUSE_DOWN, siwyAppear);
				question(qsnSinestis);
				mainObjects.mtvare.sinestis.mouseEnabled = true;
				mainObjects.mtvare.sinestis.addEventListener(MouseEvent.MOUSE_DOWN, sinAppear);
			}
			if (counter == 4)
			{
				removeChild(qsnSinestis);
				qsnSinestis = null;
				mainObjects.mtvare.sinestis.removeEventListener(MouseEvent.MOUSE_DOWN, sinAppear);
				question(qsnSicivis);
				mainObjects.mtvare.sicivis.mouseEnabled = true;
				mainObjects.mtvare.sicivis.addEventListener(MouseEvent.MOUSE_DOWN, sicAppear);
			}
			if (counter == 5)
			{
				removeChild(qsnSicivis);
				qsnSicivis = null;
				mainObjects.mtvare.sicivis.removeEventListener(MouseEvent.MOUSE_DOWN, sicAppear);
				question(qsnShtorm);
				mainObjects.mtvare.shtormis.mouseEnabled = true;
				mainObjects.mtvare.shtormis.addEventListener(MouseEvent.MOUSE_DOWN, shtAppear);
			}
			if (counter == 6)
			{
				removeChild(qsnShtorm);
				qsnShtorm = null;
				mainObjects.mtvare.shtormis.removeEventListener(MouseEvent.MOUSE_DOWN, shtAppear);
				question(qsnNeqt);
				mainObjects.mtvare.neqtaris.mouseEnabled = true;
				mainObjects.mtvare.neqtaris.addEventListener(MouseEvent.MOUSE_DOWN, neqtAppear);
			}
			if (counter == 7)
			{
				removeChild(qsnNeqt);
				qsnNeqt = null;
				mainObjects.mtvare.neqtaris.removeEventListener(MouseEvent.MOUSE_DOWN, neqtAppear);
				question(qsnNayof);
				mainObjects.mtvare.nayofierebis.mouseEnabled = true;
				mainObjects.mtvare.nayofierebis.addEventListener(MouseEvent.MOUSE_DOWN, nayofAppear);
			}
			if (counter == 8)
			{
				removeChild(qsnNayof);
				qsnNayof = null;
				mainObjects.mtvare.nayofierebis.removeEventListener(MouseEvent.MOUSE_DOWN, nayofAppear);
				question(qsnKriz);
				mainObjects.mtvare.krizisis.mouseEnabled = true;
				mainObjects.mtvare.krizisis.addEventListener(MouseEvent.MOUSE_DOWN, krizAppear);
			}
			if (counter == 9)
			{
				removeChild(qsnKriz);
				qsnKriz = null;
				mainObjects.mtvare.krizisis.removeEventListener(MouseEvent.MOUSE_DOWN, krizAppear);
				question(qsnGrub);
				mainObjects.mtvare.grublebis.mouseEnabled = true;
				mainObjects.mtvare.grublebis.addEventListener(MouseEvent.MOUSE_DOWN, grubAppear);
			}
			if (counter == 10)
			{
				correctSoundControl = new SoundControl;
				correctSoundControl.loadSound("correct.mp3", 1);
				addChild(correctSoundControl);
				correctSoundControl.soundPlay();
				
				removeChild(qsnGrub);
				qsnGrub = null;
				
				trace("moige");
				setTimeout(nextTast, 2000);
			}
		}
		
		private function question(mc:MovieClip):void
		{
			mc.x = _stageWidth / 2;
			mc.y = _stageHeight - mainObjects.height / 4;
			
			mc.height = _stageHeight / 8;
			mc.scaleX = mc.scaleY;
			
			addChild(mc);
		}
		
		private function nextTast():void
		{
			qula = timerC.returnQula() + 5;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString()));
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			removeChild(timerC);
			timerC = null;
			
			destroy(null);
		}
		
		private function wvAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.wvimis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function ushAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.ushfotvelobis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function siwyAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.siwynaris, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function sinAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.sinestis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function sicAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.sicivis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function shtAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.shtormis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function neqtAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.neqtaris, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function nayofAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.nayofierebis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function krizAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.krizisis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
		
		private function grubAppear(e:MouseEvent):void
		{
			TweenMax.to(mainObjects.mtvare.grublebis, 0.5, {alpha: 1});
			counter++;
			trace(counter);
			getQuestions();
		}
	}
}