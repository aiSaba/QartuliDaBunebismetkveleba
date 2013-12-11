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
		private static const NUM_OF_BOXES:int = 4;
		private static const BOX_SPACING:int = 15;
		
		private var allStatements:MovieClip;
		private var statementsArray:Array;
		////statements
		private var statement0:MovieClip;
		private var statement1:MovieClip;
		private var statement2:MovieClip;
		private var statement3:MovieClip;
		
		/////
		private var randomIndex:int;
		private var shuffledArray:Array = new Array;
		////
		private var randomPlus:RandomPlus;
		///
		private var startButton:MovieClip;
		////textfield
		private var resultText:TextField;
		private var myTextFormat:TextFormat;
		//////////main movie clips
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		////////soundcontrol
		private var soundControl:SoundControl;
		private var soundControl1:SoundControl;
		private var soundCounter:int = 0;
		private var soundControl2:SoundControl;
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
			if (startButton)
			{
				startButton.removeEventListener(MouseEvent.MOUSE_DOWN, startTask);
				removeChild(startButton);
				startButton = null;
			}
			if (resultText)
			{
				removeChild(resultText);
				resultText = null;
			}
			
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
			soundControl1.loadSound("2.mp3", 1);
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
			statement0 = new Statement1();
			statement1 = new Statement4();
			statement2 = new Statement2();
			statement3 = new Statement3();
			
			statement0.name = "0";
			statement1.name = "1";
			statement2.name = "2";
			statement3.name = "3";
			//////////////
			
			statementsArray = [statement0, statement1, statement2, statement3];
			
			for (var i:int = 0; i < statementsArray.length; i++)
			{
				statementsArray[i].back.visible = false;
				
				statementsArray[i].y = (statementsArray[i].height + BOX_SPACING) * i;
				statementsArray[i].x = 1.3 * statementsArray[i].height;
				TweenMax.to(statementsArray[i], 0.25, {alpha: 1});
				addChild(statementsArray[i]);
				
				scaleFunc(statementsArray[i]);
			}
			soundCounter = 0;
			
			//TweenMax.to(statement0, 0.3, { glowFilter: { color:0xFF0000, alpha:1, blurX:30, blurY:30 }} );
			TweenMax.to(statement0, 1, {tint: 0xff0000});
			
			soundControl = new SoundControl();
			soundControl.addEventListener(DataEvent.DATA, soundListener1);
			addChild(soundControl);
			
			soundControl.loadSound("2_" + soundCounter.toString() + ".mp3", 1);
			soundControl.soundPlay();
		
		}
		
		private function soundListener1(e:DataEvent):void
		{
			soundControl.removeEventListener(DataEvent.DATA, soundListener1);
			removeChild(soundControl);
			soundControl = null;
			
			soundCounter++;
			
			if (soundCounter == statementsArray.length)
			{
				startTask();
				statementsArray[soundCounter - 1].filters = null;
				
				TweenMax.to(statementsArray[soundCounter - 1], 0.1, {tint: null});
				
				soundCounter = 0;
				return;
			}
			
			statementsArray[soundCounter - 1].filters = null;
			TweenMax.to(statementsArray[soundCounter - 1], 0.1, {tint: null});
			
			soundControl = new SoundControl();
			soundControl.addEventListener(DataEvent.DATA, soundListener1);
			addChild(soundControl);
			soundControl.loadSound("2_" + soundCounter.toString() + ".mp3", 1);
			soundControl.soundPlay();
			
			TweenMax.to(statementsArray[soundCounter], 1, {tint: 0xff0000});
		}
		
		private function startTask():void
		{
			
			
			
			
			for (var i:int = 0; i < statementsArray.length; i++)
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
		
		}
		
		private function addShuffledArray():void
		{
			timerC = new TimerClass();
			addChild(timerC);
			timerC.x = _stageWidth - timerC.height;
			timerC.y =  timerC.height;
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			
			randomPlus = new RandomPlus(0, 3);
			
			for (var i:int = 0; i < statementsArray.length; i++)
			{
				randomIndex = randomPlus.getNum();
				shuffledArray[randomIndex] = statementsArray[i];
			}
			
			addArray(shuffledArray, shuffledArray.length);
			
			for (var j:int = 0; j < shuffledArray.length; j++)
			{
				shuffledArray[j].buttonMode = true;
				shuffledArray[j].addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownFunc);
				shuffledArray[j].addEventListener(MouseEvent.MOUSE_UP, onMouseUpFunc);
				shuffledArray[j].back.visible = true;
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
			mc.height = _stageHeight / 6;
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
			
				
				qula = timerC.returnQula();
				removeChild(timerC);
				
				nextLevel();
			}
			
			event.currentTarget.stopDrag();
			sortStatements();
		}
		
		public function get sabolooQula():int
		{
			return qula;
		}
		
		private function nextLevel():void
		{			
			setTimeout(addNextLevel, 2000);
		}
		
		private function addNextLevel():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"));
			
			clearTimeout(1);
			destroy(null);
		}
	
	}

}
