package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.utils.Timer;
	
	public class SortingClass extends MovieClip
	{
		private static const NUM_OF_BOXES:int = 3;
		private static const BOX_SPACING:int = 15;
		
		private var allStatements:MovieClip;
		private var versionsArray:Array;
		////statements
		private var version0:MovieClip;
		private var version1:MovieClip;
		private var version2:MovieClip;
		
		/////
		private var randomIndex:int;
		private var shuffledArray:Array = new Array;
		////
		private var randomPlus:RandomPlus;
		//////////main movie clips
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		private var allText:MovieClip;
		////////soundcontrol
		private var soundControl1:SoundControl;
		private var soundControl2:SoundControl;
		private var soundControl3:SoundControl;
		private var soundControl4:SoundControl;
		private var soundControl5:SoundControl;
		private var soundControlz:SoundControl;
		/////
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var timerC:TimerClass;
		private var qula:int;
		
		public function SortingClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
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
			
			if (version0)
			{
				removeChild(version0);
				version0 = null;
			}
			if (version1)
			{
				removeChild(version1);
				version1 = null;
			}
			if (version2)
			{
				removeChild(version2);
				version2 = null;
			}
			for (var i:int = 1; i < versionsArray.length; i++)
			{
				TweenMax.killTweensOf(versionsArray[i]);
			}
			
			TweenMax.killAll();
		}
		
		private function init(event:Event):void
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
			soundControlz.loadSound("17.mp3", 1);
			soundControlz.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 5000);
		}
		
		private function startLevel():void
		{
			removeChild(soundControlz);
			soundControlz = null;
			
			removeChild(zgarbiObjects);
			zgarbiObjects = null;
			
			startThirdLevel();
		}
		
		private function startThirdLevel():void
		{
			///////////////
			version0 = new FirstVersion();
			version1 = new SecondVersion();
			version2 = new ThirdVersion();
			
			version0.name = "0";
			version1.name = "1";
			version2.name = "2";
			
			//////////////
			
			versionsArray = [version0, version1, version2];
			
			allText = new AllText();
			allText.x = _stageWidth / 2;
			allText.y = _stageHeight / 2 - allText.width / 10;
			
			allText.height = _stageHeight / 1.5;
			allText.scaleX = allText.scaleY;
			
			addChild(allText);
			//startTask();
			
			return
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			TweenMax.to(allText.text1, 1, {tint: 0xff0000});
			soundControl1.loadSound("1_1.mp3", 1);
			soundControl1.soundPlay();
			setTimeout(nextText, 3000);
			
			
		
		}
		
		private function nextText():void
		{
			removeChild(soundControl1);
			soundControl1 = null;
			TweenMax.to(allText.text1, 1, {tint: null});
			TweenMax.to(allText.text2, 1, {tint: 0xff0000});
			soundControl2 = new SoundControl();
			addChild(soundControl2);
			soundControl2.loadSound("1_2.mp3", 1);
			soundControl2.soundPlay();
			setTimeout(nextText1, 6000);
		}
		
		private function nextText1():void
		{
			removeChild(soundControl2);
			soundControl2 = null;
			TweenMax.to(allText.text2, 1, {tint: null});
			TweenMax.to(allText.text3, 1, {tint: 0xff0000});
			soundControl3 = new SoundControl();
			addChild(soundControl3);
			soundControl3.loadSound("1_3.mp3", 1);
			soundControl3.soundPlay();
			setTimeout(nextText2, 4000);
		}
		
		private function nextText2():void
		{
			removeChild(soundControl3);
			soundControl3 = null;
			TweenMax.to(allText.text3, 1, {tint: null});
			TweenMax.to(allText.text4, 1, {tint: 0xff0000});
			soundControl4 = new SoundControl();
			addChild(soundControl4);
			soundControl4.loadSound("1_4.mp3", 1);
			soundControl4.soundPlay();
			setTimeout(nextText3, 6000);
		}
		
		private function nextText3():void
		{
			removeChild(soundControl4);
			soundControl4 = null;
			TweenMax.to(allText.text4, 1, {tint: null});
			TweenMax.to(allText.text5, 1, {tint: 0xff0000});
			soundControl5 = new SoundControl();
			addChild(soundControl5);
			soundControl5.loadSound("1_5.mp3", 1);
			soundControl5.soundPlay();
			setTimeout(startTask, 8000);
		}
		
		private function startTask():void
		{
			removeChild(soundControl5);
			soundControl5 = null;
			removeChild(allText);
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			timerC = new TimerClass();
			addChild(timerC);
			timerC.x = _stageWidth - timerC.height;
			timerC.y = timerC.height;
			addShuffledArray();
		}
		
		//private function ShuffleArray():void
		//{
			//randomPlus = new RandomPlus(0, 2);
			//
			//for (var i:int = 0; i < versionsArray.length; i++)
			//{
				//randomIndex = randomPlus.getNum();
				//shuffledArray[randomIndex] = versionsArray[i];
			//}
			//
		//}
		
		function shuffle(array) {
			var counter = array.length, temp, index;

			// While there are elements in the array
			while (counter > 0) {
				// Pick a random index
				index = Math.floor(Math.random() * counter);

				// Decrease counter by 1
				counter--;

				// And swap the last element with it
				temp = array[counter];
				array[counter] = array[index];
				array[index] = temp;
			}

			return array;
		}
		
		//function checkContent($needles:Array, $haystack:Array):Boolean
		//{
			//for each (var item:Object in $needles)
			//{
				//if ($haystack.indexOf(item) == -1)
					//return false;
			//}
			//return true;
		//}
		//
		private function addShuffledArray():void
		{
			
			shuffledArray = shuffle(versionsArray);
			
			//ShuffleArray();
			//if (checkContent(versionsArray, shuffledArray))
			//{
				//trace("again");
				//ShuffleArray();
				//
				//addShuffledArray();
			//}
			//else
			//{
				StartGame();
			//}
		
		}
		private function StartGame():void 
		{
			for (var t:int = 0; t < shuffledArray.length; t++)
			{
				TweenMax.to(shuffledArray[t], 0.25, {alpha: 1});
				addChild(shuffledArray[t]);
				
				scaleFunc(shuffledArray[t]);
			}
			
			sortStatements();
			
			for (var j:int = 0; j < shuffledArray.length; j++)
			{
				shuffledArray[j].buttonMode = true;
				shuffledArray[j].addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownFunc);
				shuffledArray[j].addEventListener(MouseEvent.MOUSE_UP, onMouseUpFunc);
			}
		}
		
		private function sortStatements():void
		{
			shuffledArray.sortOn('y', Array.NUMERIC);
			
			for (var i:int = 0; i < shuffledArray.length; i++)
			{
				TweenLite.to(shuffledArray[i], 0.5, {x: _stageWidth / 2, y: ((shuffledArray[i].height + BOX_SPACING) * i + shuffledArray[i].height / 1.4), ease: Expo.easeInOut});
			}
		}
		
		private function scaleFunc(mc:MovieClip):void
		{
			mc.height = _stageHeight / 3.5;
			mc.scaleX = mc.scaleY;
		}
		
		private function onMouseDownFunc(event:MouseEvent):void
		{
			setChildIndex(event.currentTarget as MovieClip, numChildren - 1);
			event.currentTarget.startDrag();
		}
		
		private function onMouseUpFunc(event:MouseEvent):void
		{
			var correct:Boolean = false;
			
			shuffledArray.sortOn('y', Array.NUMERIC)
			for (var i:int = 0; i < shuffledArray.length; i++)
			{
				if (shuffledArray[i].name == i.toString())
				{
					correct = true
				}
				else
				{
					correct = false
					break
				}
			}
			if (correct)
			{
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				
				//MOUSE ENABLED FALSE
				for (var t:int = 1; t < shuffledArray.length; t++)
				{
					shuffledArray[t].mouseEnabled = false;
				}
				trace("moige");
				
				setTimeout(nextLevel, 2000);
			}
			
			event.currentTarget.stopDrag();
			sortStatements();
		}
		
		private function nextLevel():void
		{
			try
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
				qula = timerC.returnQula() + 5;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString()));
				removeChild(timerC);
				removeChild(version0);
				removeChild(version1);
				removeChild(version2);
				version0 = null;
				version1 = null;
				version2 = null;
				destroy(null);
			}
			catch (err:Error)
			{
				
			}
		}
		
		
	}

}
