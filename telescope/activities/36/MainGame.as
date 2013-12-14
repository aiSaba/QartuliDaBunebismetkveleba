package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	public class MainGame extends MovieClip
	{
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		
		private var mainObjects:MovieClip;
		private var timerC:TimerClass;
		
		private var vinArray:Array;
		private var raArray:Array;
		private var rasAkArray:Array;
		
		//////////////////
		private var vin0FX:Number;
		private var vin1FX:Number;
		private var vin2FX:Number;
		private var vin3FX:Number;
		
		private var vin0FY:Number;
		private var vin1FY:Number;
		private var vin2FY:Number;
		private var vin3FY:Number;
		//
		private var ra0FX:Number;
		private var ra1FX:Number;
		private var ra2FX:Number;
		private var ra3FX:Number;
		
		private var ra0FY:Number;
		private var ra1FY:Number;
		private var ra2FY:Number;
		private var ra3FY:Number;
		//
		private var rasAk0FX:Number;
		private var rasAk1FX:Number;
		private var rasAk2FX:Number;
		private var rasAk3FX:Number;
		
		private var rasAk0FY:Number;
		private var rasAk1FY:Number;
		private var rasAk2FY:Number;
		private var rasAk3FY:Number;
		
		//
		private var vinCounter:int;
		private var raCounter:int;
		private var rasAkCounter:int;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var correctSoundControl:SoundControl;
		private var soundControl1:SoundControl;
		
		public function MainGame(_stageHeight, _stageWidth)
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
			
			for (var i:int = 0; i < vinArray.length; i++)
			{
				vinArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDragFuncVin);
				vinArray[i].removeEventListener(MouseEvent.MOUSE_UP, stopDragFuncVin);
				
				raArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRa);
				raArray[i].removeEventListener(MouseEvent.MOUSE_UP, stopDragFuncRa);
				
				rasAkArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRasAk);
				rasAkArray[i].removeEventListener(MouseEvent.MOUSE_UP, stopDragFuncRasAk);
				
				TweenMax.killChildTweensOf(vinArray[i]);
				TweenMax.killChildTweensOf(raArray[i]);
				TweenMax.killChildTweensOf(rasAkArray[i]);
			}
			
			if (mainObjects)
			{
				removeChild(mainObjects);
				mainObjects = null;
			}
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//addZgarbi();
			addTask();
		}
		
		//private function addZgarbi():void
		//{
			//setTimeout(sendData, 5);
			//
			//zgarbiObjects = new Zgarbi();
			//
			//zgarbiObjects.x = _stageWidth / 2;
			//zgarbiObjects.y = _stageHeight / 2;
			//
			//zgarbiObjects.height = _stageHeight / 1.5;
			//zgarbiObjects.scaleX = zgarbiObjects.scaleY;
			//
			//addChild(zgarbiObjects);
			//zgarbi = zgarbiObjects.zgarbi;
			//textFrame = zgarbiObjects.textFrame;
			//
			//zgarbi.alpha = 0;
			//textFrame.alpha = 0;
			//
			//animZgarbi();
		//}
		//
		//private function sendData():void
		//{
			//dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
		//}
		//
		//private function animZgarbi():void
		//{
			//TweenMax.fromTo(zgarbi, 1, {x: zgarbi.x, y: (2 * _stageHeight)}, {x: zgarbi.x, y: zgarbi.y, alpha: 1, onComplete: addText});
		//}
		//
		//private function addText():void
		//{
			//soundControl1 = new SoundControl();
			//addChild(soundControl1);
			//soundControl1.loadSound("38.mp3", 1);
			//soundControl1.soundPlay();
			//
			//TweenMax.to(textFrame, 1, {alpha: 1, onComplete: timerFunc});
		//}
		
		//private function timerFunc():void
		//{
			//setTimeout(addTask, 2000);
		//}
		
		private function addTask():void
		{
			//removeChild(zgarbiObjects);
			//zgarbiObjects = null;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			mainObjects = new MainObjects();
			
			mainObjects.x = _stageWidth / 2;
			mainObjects.y = _stageHeight / 2;
			
			mainObjects.height = _stageHeight / 1.2;
			mainObjects.scaleX = mainObjects.scaleY;
			
			mainObjects.alpha = 0;
			addChild(mainObjects);
			
			TweenMax.to(mainObjects, 1, {alpha: 1});
			
			timerC = new TimerClass();
			
			addChild(timerC);
			timerC.x = _stageWidth - timerC.width;
			timerC.y = timerC.width;
			
			/////////////////////////
			vinArray = [mainObjects.vinObj.vinObj0, mainObjects.vinObj.vinObj1, mainObjects.vinObj.vinObj2, mainObjects.vinObj.vinObj3];
			vin0FX = mainObjects.vinObj.vinObj0.x;
			vin0FY = mainObjects.vinObj.vinObj0.y;
			vin1FX = mainObjects.vinObj.vinObj1.x;
			vin1FY = mainObjects.vinObj.vinObj1.y;
			vin2FX = mainObjects.vinObj.vinObj2.x;
			vin2FY = mainObjects.vinObj.vinObj2.y;
			vin3FX = mainObjects.vinObj.vinObj3.x;
			vin3FY = mainObjects.vinObj.vinObj3.y;
			//////
			raArray = [mainObjects.raObj.raObj0, mainObjects.raObj.raObj1, mainObjects.raObj.raObj2, mainObjects.raObj.raObj3];
			ra0FX = mainObjects.raObj.raObj0.x;
			ra0FY = mainObjects.raObj.raObj0.y;
			ra1FX = mainObjects.raObj.raObj1.x;
			ra1FY = mainObjects.raObj.raObj1.y;
			ra2FX = mainObjects.raObj.raObj2.x;
			ra2FY = mainObjects.raObj.raObj2.y;
			ra3FX = mainObjects.raObj.raObj3.x;
			ra3FY = mainObjects.raObj.raObj3.y;
			//////
			rasAkArray = [mainObjects.rasAkObj.rasAkObj0, mainObjects.rasAkObj.rasAkObj1, mainObjects.rasAkObj.rasAkObj2, mainObjects.rasAkObj.rasAkObj3];
			rasAk0FX = mainObjects.rasAkObj.rasAkObj0.x;
			rasAk0FY = mainObjects.rasAkObj.rasAkObj0.y;
			rasAk1FX = mainObjects.rasAkObj.rasAkObj1.x;
			rasAk1FY = mainObjects.rasAkObj.rasAkObj1.y;
			rasAk2FX = mainObjects.rasAkObj.rasAkObj2.x;
			rasAk2FY = mainObjects.rasAkObj.rasAkObj2.y;
			rasAk3FX = mainObjects.rasAkObj.rasAkObj3.x;
			rasAk3FY = mainObjects.rasAkObj.rasAkObj3.y;
			//
			
			for (var i:int = 0; i < vinArray.length; i++)
			{
				vinArray[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragFuncVin);
				vinArray[i].addEventListener(MouseEvent.MOUSE_UP, stopDragFuncVin);
				vinArray[i].buttonMode = true;
				
				raArray[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRa);
				raArray[i].addEventListener(MouseEvent.MOUSE_UP, stopDragFuncRa);
				raArray[i].buttonMode = true;
				
				rasAkArray[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRasAk);
				rasAkArray[i].addEventListener(MouseEvent.MOUSE_UP, stopDragFuncRasAk);
				rasAkArray[i].buttonMode = true;
			}
		
		}
		
		private function stopDragFuncRasAk(e:MouseEvent):void
		{
			if (e.currentTarget.hitTestObject(mainObjects.rasAketebs))
			{
				if (e.currentTarget == rasAkArray[0])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 365, y: -373.20, onComplete: function()
						{
							rasAkArray[0].mouseEnabled = false;
						
						}});
					rasAkCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
					
				}
				else if (e.currentTarget == rasAkArray[1])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 383.50, y: -301.95, onComplete: function()
						{
							rasAkArray[1].mouseEnabled = false;
						
						}});
					rasAkCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == rasAkArray[2])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 370.50, y: -231.30, onComplete: function()
						{
							rasAkArray[2].mouseEnabled = false;
						
						}});
					rasAkCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == rasAkArray[3])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 397, y: -160.95, onComplete: function()
						{
							rasAkArray[3].mouseEnabled = false;
						
						}});
					rasAkCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
			}
			
			else
			{
				if (e.currentTarget == rasAkArray[0])
				{
					TweenMax.to(rasAkArray[0], 0.5, {x: rasAk0FX, y: rasAk0FY});
				}
				if (e.currentTarget == rasAkArray[1])
				{
					TweenMax.to(rasAkArray[1], 0.5, {x: rasAk1FX, y: rasAk1FY});
				}
				if (e.currentTarget == rasAkArray[2])
				{
					TweenMax.to(rasAkArray[2], 0.5, {x: rasAk2FX, y: rasAk2FY});
				}
				if (e.currentTarget == rasAkArray[3])
				{
					TweenMax.to(rasAkArray[3], 0.5, {x: rasAk3FX, y: rasAk3FY});
				}
			}
			e.currentTarget.stopDrag();
		}
		
		private function stopDragFuncRa(e:MouseEvent):void
		{
			if (e.currentTarget.hitTestObject(mainObjects.ra))
			{
				if (e.currentTarget == raArray[0])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 150, y: -341.10, onComplete: function()
						{
							raArray[0].mouseEnabled = false;
						
						}});
					raCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
					
				}
				else if (e.currentTarget == raArray[1])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 85.50, y: -270.25, onComplete: function()
						{
							raArray[1].mouseEnabled = false;
						
						}});
					raCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == raArray[2])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 113.40, y: -196.90, onComplete: function()
						{
							raArray[2].mouseEnabled = false;
						
						}});
					raCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == raArray[3])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 118.5, y: -126.05, onComplete: function()
						{
							raArray[3].mouseEnabled = false;
						
						}});
					raCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
			}
			
			else
			{
				if (e.currentTarget == raArray[0])
				{
					TweenMax.to(raArray[0], 0.5, {x: ra0FX, y: ra0FY});
				}
				if (e.currentTarget == raArray[1])
				{
					TweenMax.to(raArray[1], 0.5, {x: ra1FX, y: ra1FY});
				}
				if (e.currentTarget == raArray[2])
				{
					TweenMax.to(raArray[2], 0.5, {x: ra2FX, y: ra2FY});
				}
				if (e.currentTarget == raArray[3])
				{
					TweenMax.to(raArray[3], 0.5, {x: ra3FX, y: ra3FY});
				}
			}
			e.currentTarget.stopDrag();
		}
		
		private function stopDragFuncVin(e:MouseEvent):void
		{
			if (e.currentTarget.hitTestObject(mainObjects.vin))
			{
				if (e.currentTarget == vinArray[0])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: -190.55, y: -379.15, onComplete: function()
						{
							vinArray[0].mouseEnabled = false;
						
						}});
					vinCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
					
				}
				else if (e.currentTarget == vinArray[1])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: -138.5, y: -306.80, onComplete: function()
						{
							vinArray[1].mouseEnabled = false;
						
						}});
					vinCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == vinArray[2])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: -164.5, y: -233.4, onComplete: function()
						{
							vinArray[2].mouseEnabled = false;
						
						}});
					vinCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == vinArray[3])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: -154.5, y: -163.2, onComplete: function()
						{
							vinArray[3].mouseEnabled = false;
						
						}});
					vinCounter++;
					if (vinCounter == 4 && raCounter == 4 && rasAkCounter == 4)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
			}
			
			else
			{
				if (e.currentTarget == vinArray[0])
				{
					TweenMax.to(vinArray[0], 0.5, {x: vin0FX, y: vin0FY});
				}
				if (e.currentTarget == vinArray[1])
				{
					TweenMax.to(vinArray[1], 0.5, {x: vin1FX, y: vin1FY});
				}
				if (e.currentTarget == vinArray[2])
				{
					TweenMax.to(vinArray[2], 0.5, {x: vin2FX, y: vin2FY});
				}
				if (e.currentTarget == vinArray[3])
				{
					TweenMax.to(vinArray[3], 0.5, {x: vin3FX, y: vin3FY});
				}
			}
			e.currentTarget.stopDrag();
		}
		
		private function startDragFuncRasAk(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function startDragFuncRa(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function startDragFuncVin(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function playCorrectSound():void
		{
			correctSoundControl = new SoundControl();
			addChild(correctSoundControl);
			correctSoundControl.loadSound("correct.mp3", 1);
			correctSoundControl.soundPlay();
		}
		
		private function sendEvent():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			var qula = timerC.returnQula() + 5;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString()));
		}
		
		private function endGame():void
		{
			sendEvent();
			removeChild(timerC);
			timerC = null;
			destroy(null);
		}
	}

}
