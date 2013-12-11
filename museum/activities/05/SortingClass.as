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
		private static const NUM_OF_BOXES:int = 5;
		private static const BOX_SPACING:int = 15;
		
		private var allStatements:MovieClip;
		private var statementsArray:Array;
		////statements
		private var statement0:MovieClip;
		private var statement1:MovieClip;
		private var statement2:MovieClip;
		private var statement3:MovieClip;
		private var statement4:MovieClip;
		
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
			
			TweenMax.killAll();
			
			if (zgarbiObjects)
			{
				removeChild(zgarbiObjects);
				zgarbiObjects = null;
			}
			if (statement1)
			{
				removeChild(statement1);
				statement1 = null;
			}
			if (statement2)
			{
				removeChild(statement2);
				statement2 = null;
			}
			if (statement3)
			{
				removeChild(statement3);
				statement3 = null;
			}
			if (statement0)
			{
				removeChild(statement0);
				statement0 = null;
			}
			if (statement4)
			{
				removeChild(statement4);
				statement4 = null;
			}
			/*if (allText)
			{
				removeChild(allText);
				allText = null;
			}*/
			
			for (var i:int = 1; i < statementsArray.length; i++)
			{
				TweenMax.killTweensOf(statementsArray[i]);
			}
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
			//changePosition();
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
		
		private function sendData():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
		}
		
		private function addText():void
		{
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("5.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 8000);
		}
		
		private function startLevel():void
		{
			removeChild(soundControl1);
			
			removeChild(zgarbiObjects);
			zgarbiObjects = null;
			
			startThirdLevel();
		}
		
		private function startThirdLevel():void
		{
			///////////////
			statement0 = new Statement0();
			statement1 = new Statement1();
			statement2 = new Statement2();
			statement3 = new Statement3();
			statement4 = new Statement4();
			
			statement0.name = "0";
			statement1.name = "1";
			statement2.name = "2";
			statement3.name = "3";
			statement4.name = "4";
			//////////////
			
			statementsArray = [statement0, statement1, statement2, statement3, statement4];
			
			
			allText = new AllText();
			allText.x = _stageWidth / 2;
			allText.y = _stageHeight / 2 - allText.width / 10;
			
			allText.height = _stageHeight / 1.5;
			allText.scaleX = allText.scaleY;
			
			addChild(allText);
			
			soundControl1 = new SoundControl();
		    addChild(soundControl1);
			TweenMax.to(allText.text1, 1, {tint:0xff0000});
			soundControl1.loadSound("5_1.mp3", 1);
			soundControl1.soundPlay();
			setTimeout(nextText, 6000);
			
		
		}
		
		private function nextText():void
		{
			TweenMax.to(allText.text1, 1, {tint: null});
			TweenMax.to(allText.text2, 1, {tint: 0xff0000});
			soundControl2 = new SoundControl();
			addChild(soundControl2);
			soundControl2.loadSound("5_2.mp3", 1);
			soundControl2.soundPlay();
			setTimeout(nextText1, 5000);
		}
		
		private function nextText1():void
		{
			TweenMax.to(allText.text2, 1, {tint: null});
			TweenMax.to(allText.text3, 1, {tint: 0xff0000});
			soundControl3 = new SoundControl();
			addChild(soundControl3);
			soundControl3.loadSound("5_3.mp3", 1);
			soundControl3.soundPlay();
			setTimeout(nextText2, 7000);
		}
		
		private function nextText2():void
		{
			TweenMax.to(allText.text3, 1, {tint: null});
			TweenMax.to(allText.text4, 1, {tint: 0xff0000});
			soundControl4 = new SoundControl();
			addChild(soundControl4);
			soundControl4.loadSound("5_4.mp3", 1);
			soundControl4.soundPlay();
			setTimeout(nextText3, 7200);
		}
		
		private function nextText3():void
		{
			TweenMax.to(allText.text4, 1, {tint: null});
			TweenMax.to(allText.text5, 1, {tint: 0xff0000});
			soundControl5 = new SoundControl();
			addChild(soundControl5);
			soundControl5.loadSound("5_5.mp3", 1);
			soundControl5.soundPlay();
			setTimeout(startTask, 9000);
		}
		
		private function startTask():void
		{
			removeChild(allText);
			
			addShuffledArray();
			return
			
			/*for (var i:int = 0; i < statementsArray.length; i++)
			{
				
				if (i == statementsArray.length - 1)
				{
					TweenMax.to(statementsArray[i], 0.25, {delay: 0.5, x: -_stageWidth, y: statementsArray[i].y, alpha: 0, onComplete: addShuffledArray});
				}
				else
				{
					TweenMax.to(statementsArray[i], 0.25, {delay: (Math.random() * 0.5), x: -_stageWidth, y: statementsArray[i].y, alpha: 0});
				}
			}
		*/
		}
		
		private function addShuffledArray():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			
			timerC = new TimerClass();
			
			addChild(timerC);
			
			timerC.x = _stageWidth - timerC.height;
			timerC.y = timerC.height;
			
			randomPlus = new RandomPlus(0, 4);
			
			for (var i:int = 0; i < statementsArray.length; i++)
			{
				randomIndex = randomPlus.getNum();
				shuffledArray[randomIndex] = statementsArray[i];
			}
			
			for (var j:int = 0; j < shuffledArray.length; j++)
			{
	         	scaleFunc(shuffledArray[j])
			//	shuffledArray[j].y = (shuffledArray[j].height + BOX_SPACING) * j ;
			//	shuffledArray[j].x = _stageWidth / 2;
				TweenMax.to(shuffledArray[j], 0.25, {alpha: 1});
				addChild(shuffledArray[j]);
			}
			
			for (var t:int = 0; t < shuffledArray.length; t++)
			{
				shuffledArray[t].buttonMode = true;
				shuffledArray[t].addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownFunc);
				shuffledArray[t].addEventListener(MouseEvent.MOUSE_UP, onMouseUpFunc);
				shuffledArray[t].back.visible = true;
			}
			
			sortStatements();
		
		}
		
		private function sortStatements():void
		{
			statementsArray.sortOn('y', Array.NUMERIC);
			
			for (var i:int = 0; i < statementsArray.length; i++)
			{
				TweenLite.to(statementsArray[i], 0.5, {x: statementsArray[i].height, y: ((statementsArray[i].height + BOX_SPACING) * i + statementsArray[i].height), ease: Expo.easeInOut});
			}
		}
		
		private function addArray(arr:Array, arrLength:int)
		{
			for (var i:int = 0; i < arrLength; i++)
			{
				
				arr[i].y = (arr[i].height + BOX_SPACING) * i + 0.7 * arr[i].height;
				arr[i].x = arr[i].height;
				TweenMax.to(arr[i], 0.25, {alpha: 1});
				addChild(arr[i]);
				
				scaleFunc(arr[i])
				
			}
		}
		
		private function scaleFunc(mc:MovieClip):void
		{
			mc.height = _stageHeight / 7;
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
				
				for (var t:int = 1; t < shuffledArray.length; t++)
				{
					shuffledArray[t].mouseEnabled = false;
				}
				trace("moige");
				
				qula = timerC.returnQula() + 5;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString()));
				removeChild(timerC);
				
				nextLevel();
			}
			
			event.currentTarget.stopDrag();
			sortStatements();
		}
		
		private function nextLevel():void
		{
			setTimeout(addNextLevel, 2000);
		}
		
		private function addNextLevel():void
		{
			try 
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
				clearTimeout(1);
				destroy(null);
			}
			catch (err:Error)
			{
				
			}
			
		}
	
	}

}
