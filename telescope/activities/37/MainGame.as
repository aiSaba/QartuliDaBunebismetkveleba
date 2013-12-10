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
		
		//////
		private var rogArray:Array;
		private var ramdArray:Array;
		/////
		private var rogTargArray:Array;
		private var ramdTargArray:Array;
		//
		private var rogCounter:int = new int(0);
		private var ramdCounter:int = new int(0);
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		//
		private var rog0FX:Number;
		private var rog1FX:Number;
		private var rog2FX:Number;
		private var rog3FX:Number;
		private var rog4FX:Number;
		
		private var rog0FY:Number;
		private var rog1FY:Number;
		private var rog2FY:Number;
		private var rog3FY:Number;
		private var rog4FY:Number;
		//		
		private var ramd0FX:Number;
		private var ramd1FX:Number;
		private var ramd2FX:Number;
		private var ramd3FX:Number;
		private var ramd4FX:Number;
		
		private var ramd0FY:Number;
		private var ramd1FY:Number;
		private var ramd2FY:Number;
		private var ramd3FY:Number;
		private var ramd4FY:Number;
		
		private var timerC:TimerClass;
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
			
			for (var i:int = 0; i < ramdArray.length; i++) 
			{
				ramdArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRamd);
				ramdArray[i].removeEventListener(MouseEvent.MOUSE_UP, stopDragFuncRamd);
				
				rogArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRog);
				rogArray[i].removeEventListener(MouseEvent.MOUSE_UP, stopDragFuncRog);
				
				TweenMax.killChildTweensOf(ramdArray[i]);
				TweenMax.killChildTweensOf(rogArray[i]);
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
			addZgarbi();
		}
		
		private function addZgarbi():void
		{
			setTimeout(sendData, 5);
			
			zgarbiObjects = new Zgarbi();
			
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
			soundControl1.loadSound("37.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(textFrame, 1, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(addTask, 3000);
		}
		
		private function addTask():void
		{
			removeChild(zgarbiObjects);
			zgarbiObjects = null;
			
			mainObjects = new MainObjects();
			
			mainObjects.x = _stageWidth / 2;
			mainObjects.y = _stageHeight / 2;
			
			mainObjects.height = _stageHeight / 1.4;
			mainObjects.scaleX = mainObjects.scaleY;
			
			mainObjects.alpha = 0;
			addChild(mainObjects);
			
			TweenMax.to(mainObjects, 1, { alpha: 1 } );
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			
			timerC = new TimerClass();
			
			addChild(timerC);
			timerC.x = _stageWidth - timerC.width;
			timerC.y = timerC.width;
			///////////////////////////
			rogArray = [mainObjects.rogoriObj.rog0, mainObjects.rogoriObj.rog1, mainObjects.rogoriObj.rog2, mainObjects.rogoriObj.rog3, mainObjects.rogoriObj.rog4];
			ramdArray = [mainObjects.ramdeniObj.ramd0, mainObjects.ramdeniObj.ramd1, mainObjects.ramdeniObj.ramd2, mainObjects.ramdeniObj.ramd3, mainObjects.ramdeniObj.ramd4];
			
			rog0FX = mainObjects.rogoriObj.rog0.x;
			rog1FX = mainObjects.rogoriObj.rog1.x;
			rog2FX = mainObjects.rogoriObj.rog2.x;
			rog3FX = mainObjects.rogoriObj.rog3.x;
			rog4FX = mainObjects.rogoriObj.rog4.x;
			rog0FY = mainObjects.rogoriObj.rog0.y;
			rog1FY = mainObjects.rogoriObj.rog1.y;
			rog2FY = mainObjects.rogoriObj.rog2.y;
			rog3FY = mainObjects.rogoriObj.rog3.y;
			rog4FY = mainObjects.rogoriObj.rog4.y;
			
			ramd0FX = mainObjects.ramdeniObj.ramd0.x;
			ramd1FX = mainObjects.ramdeniObj.ramd1.x;
			ramd2FX = mainObjects.ramdeniObj.ramd2.x;
			ramd3FX = mainObjects.ramdeniObj.ramd3.x;
			ramd4FX = mainObjects.ramdeniObj.ramd4.x;
			ramd0FY = mainObjects.ramdeniObj.ramd0.y;
			ramd1FY = mainObjects.ramdeniObj.ramd1.y;
			ramd2FY = mainObjects.ramdeniObj.ramd2.y;
			ramd3FY = mainObjects.ramdeniObj.ramd3.y;
			ramd4FY = mainObjects.ramdeniObj.ramd4.y;
			
			//////////////////////////
			
			for (var i:int = 0; i < rogArray.length; i++)
			{
				rogArray[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRog);
				rogArray[i].addEventListener(MouseEvent.MOUSE_UP, stopDragFuncRog);
				
				rogArray[i].buttonMode = true;
			}
			for (var j:int = 0; j < ramdArray.length; j++)
			{
				ramdArray[j].addEventListener(MouseEvent.MOUSE_DOWN, startDragFuncRamd);
				ramdArray[j].addEventListener(MouseEvent.MOUSE_UP, stopDragFuncRamd);
				
				ramdArray[j].buttonMode = true;
			}
			
			///////////////////////
			rogTargArray = [mainObjects.rogori_mc.rogTarg0, mainObjects.rogori_mc.rogTarg1, mainObjects.rogori_mc.rogTarg2, mainObjects.rogori_mc.rogTarg3, mainObjects.rogori_mc.rogTarg4];
			ramdTargArray = [mainObjects.ramdTarg0, mainObjects.ramdTarg1, mainObjects.ramdTarg2, mainObjects.ramdTarg3, mainObjects.ramdTarg4];
			///////////////////////
		}
		
		private function startDragFuncRamd(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function stopDragFuncRamd(e:MouseEvent):void
		{
			if (e.currentTarget.hitTestObject(mainObjects.ramdeni_mc))
			{
				if (e.currentTarget == ramdArray[0])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 150, y: -485, onComplete: function()
						{
							ramdArray[0].mouseEnabled = false;
						
						}});
					ramdCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
					
				}
				else if (e.currentTarget == ramdArray[1])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 130, y: -418, onComplete: function()
						{
							ramdArray[1].mouseEnabled = false;
						
						}});
					ramdCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == ramdArray[2])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 100, y: -345, onComplete: function()
						{
							ramdArray[2].mouseEnabled = false;
						
						}});
					ramdCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == ramdArray[3])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 145, y: -275, onComplete: function()
						{
							ramdArray[3].mouseEnabled = false;
						
						}});
					ramdCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == ramdArray[4])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 150, y: -206, onComplete: function()
						{
							ramdArray[4].mouseEnabled = false;
						
						}});
					ramdCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						trace("moige");
						setTimeout(endGame, 2000);
					}
				}
				
			}
			else
			{
				if (e.currentTarget == ramdArray[0])
				{
					TweenMax.to(ramdArray[0], 0.5, {x: ramd0FX, y: ramd0FY});
				}
				if (e.currentTarget == ramdArray[1])
				{
					TweenMax.to(ramdArray[1], 0.5, {x: ramd1FX, y: ramd1FY});
				}
				if (e.currentTarget == ramdArray[2])
				{
					TweenMax.to(ramdArray[2], 0.5, {x: ramd2FX, y: ramd2FY});
				}
				if (e.currentTarget == ramdArray[3])
				{
					TweenMax.to(ramdArray[3], 0.5, {x: ramd3FX, y: ramd3FY});
				}
				if (e.currentTarget == ramdArray[4])
				{
					TweenMax.to(ramdArray[4], 0.5, {x: ramd4FX, y: ramd4FY});
				}
			}
			
			e.currentTarget.stopDrag();
		
		}
		
		private function startDragFuncRog(e:Event):void
		{
			e.currentTarget.startDrag();
		}
		
		private function stopDragFuncRog(e:Event):void
		{
			if (e.currentTarget.hitTestObject(mainObjects.rogori_mc))
			{
				if (e.currentTarget == rogArray[0])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 39, y: -485, onComplete: function()
						{
							rogArray[0].mouseEnabled = false;
						
						}});
					rogCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
					
				}
				else if (e.currentTarget == rogArray[1])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: -32, y: -418, onComplete: function()
						{
							rogArray[1].mouseEnabled = false;
						
						}});
					rogCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == rogArray[2])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 25, y: -345, onComplete: function()
						{
							rogArray[2].mouseEnabled = false;
						
						}});
					rogCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == rogArray[3])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 20, y: -275, onComplete: function()
						{
							rogArray[3].mouseEnabled = false;
						
						}});
					rogCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
				else if (e.currentTarget == rogArray[4])
				{
					TweenMax.to(e.currentTarget, 0.5, {x: 25, y: -206, onComplete: function()
						{
							rogArray[4].mouseEnabled = false;
						}});
					rogCounter++;
					if (rogCounter == 5 && ramdCounter == 5)
					{
						playCorrectSound();
						setTimeout(endGame, 2000);
						trace("moige");
					}
				}
			}
			else
			{
				if (e.currentTarget == rogArray[0])
				{
					TweenMax.to(rogArray[0], 0.5, {x: rog0FX, y: rog0FY});
				}
				if (e.currentTarget == rogArray[1])
				{
					TweenMax.to(rogArray[1], 0.5, {x: rog1FX, y: rog1FY});
				}
				if (e.currentTarget == rogArray[2])
				{
					TweenMax.to(rogArray[2], 0.5, {x: rog2FX, y: rog2FY});
				}
				if (e.currentTarget == rogArray[3])
				{
					TweenMax.to(rogArray[3], 0.5, {x: rog3FX, y: rog3FY});
				}
				if (e.currentTarget == rogArray[4])
				{
					TweenMax.to(rogArray[4], 0.5, {x: rog4FX, y: rog4FY});
				}
			}
			
			e.currentTarget.stopDrag();
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
