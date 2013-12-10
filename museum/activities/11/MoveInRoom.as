package
{
	
	import flash.automation.MouseAutomationAction;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	
	public class MoveInRoom extends MovieClip
	{
		
		private var roomMc:MovieClip;
		
		///numbers
		private var one:MovieClip;
		private var two:MovieClip;
		private var three:MovieClip;
		private var four:MovieClip;
		private var five:MovieClip;
		private var six:MovieClip;
		private var seven:MovieClip;
		private var eight:MovieClip;
		private var nine:MovieClip;
		private var numberArray:Array;
		
		//arrows
		private var upArrow:MovieClip;
		private var leftArrow:MovieClip;
		private var downArrow:MovieClip;
		private var arrowArray:Array;
		
		///counters
		private var counterNumbers:Number = 0;
		private var counterArrows:Number = 0;
		private var counterQueue:Number = 0;
		private var stepCounter:Array;
		private var arrowCounter:Array;
		private var moveCounter:Number = 0;
		private var i:Number = 0;
		private var j:Number = 0;
		private var playMcChecker:Number = 0;
		
		//currentCoordinates
		private var currY:Number;
		private var currX:Number;
		
		private var oldStepX:Number;
		private var oldStepY:Number;
		
		private var oldStepDeleteX:Number;
		private var oldStepDeleteY:Number;
		///delete and play
		private var playMc:MovieClip;
		private var deleteMc:MovieClip;
		
		////oldCoordinates
		private var oldOneX:Number;
		private var oldOneY:Number;
		
		private var oldTwoX:Number;
		private var oldTwoY:Number;
		
		private var oldThreeX:Number;
		private var oldThreeY:Number;
		
		private var oldFourX:Number;
		private var oldFourY:Number;
		
		private var oldFiveX:Number;
		private var oldFiveY:Number;
		
		private var oldSixX:Number;
		private var oldSixY:Number;
		
		private var oldSevenX:Number;
		private var oldSevenY:Number;
		
		private var oldEightX:Number;
		private var oldEightY:Number;
		
		private var oldNineX:Number;
		private var oldNineY:Number;
		
		private var oldLeftX:Number;
		private var oldLeftY:Number;
		
		private var oldUpX:Number;
		private var oldUpY:Number;
		
		private var oldDownX:Number;
		private var oldDownY:Number;
		
		private var oldErrorX:Number;
		private var oldErrorY:Number;
		
		private var step:MovieClip;
		private var errorMc:MovieClip;
		
		private var soundcontrol1:SoundControl;
		private var soundcontrol2:SoundControl;
		private var soundcontrol3:SoundControl;
		private var soundcontrol4:SoundControl;
		private var soundsArray:Array;
		private var soundRandom:Number;
		private var hintArray:Array;
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function MoveInRoom(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addRoom();
		}
		
		private function addRoom():void
		{
			roomMc = new RoomMc();
			roomMc.x = _stageWidth / 2;
			roomMc.y = _stageHeight / 2 + 50;
			roomMc.height = _stageHeight / 1.3;
			roomMc.scaleX = roomMc.scaleY;
			addChild(roomMc);
			
			///numbers initialization
			one = roomMc.numberBar.one;
			two = roomMc.numberBar.two;
			three = roomMc.numberBar.three;
			four = roomMc.numberBar.four;
			five = roomMc.numberBar.five;
			six = roomMc.numberBar.six;
			seven = roomMc.numberBar.seven;
			eight = roomMc.numberBar.eight;
			nine = roomMc.numberBar.nine;
			
			/////save oldCoordinates
			
			oldOneX = one.x;
			oldOneY = one.y;
			
			oldTwoX = two.x;
			oldTwoY = two.y;
			
			oldThreeX = three.x;
			oldThreeY = three.y;
			
			oldFourX = four.x;
			oldFourY = four.y;
			
			oldFiveX = five.x;
			oldFiveY = five.y;
			
			oldSixX = six.x;
			oldSixY = six.y;
			
			oldSevenX = seven.x;
			oldSevenY = seven.y;
			
			oldEightX = eight.x;
			oldEightY = eight.y;
			
			oldNineX = nine.x;
			oldNineY = nine.y;
			
			numberArray = [one, two, three, four, five, six, seven, eight, nine];
			
			///arrows initializarion
			leftArrow = roomMc.arrowBar.leftArrow;
			upArrow = roomMc.arrowBar.upArrow;
			downArrow = roomMc.arrowBar.downArrow;
			
			oldLeftX = leftArrow.x;
			oldLeftY = leftArrow.y;
			
			oldUpX = upArrow.x;
			oldUpY = upArrow.y;
			
			oldDownX = downArrow.x;
			oldDownY = downArrow.y;
			
			arrowArray = [leftArrow, upArrow, downArrow];
			
			errorMc = roomMc.home.errorMc;
			oldErrorX = errorMc.x;
			oldErrorY = errorMc.y;
			errorMc.visible = false;
			playMc = roomMc.hitBar.playMc;
			deleteMc = roomMc.hitBar.deleteMc;
			step = roomMc.home.step;
			oldStepX = step.x;
			oldStepY = step.y;
			oldStepDeleteX = step.x;
			oldStepDeleteY = step.y;
			deleteMc.buttonMode = true;
			playMc.buttonMode = true;
			
			playMc.addEventListener(MouseEvent.MOUSE_DOWN, playMcFunc);
			deleteMc.addEventListener(MouseEvent.MOUSE_DOWN, deleteMcFunc);
			stepCounter = new Array();
			arrowCounter = new Array();
			for (var i:int = 0; i < numberArray.length; i++)
			{
				numberArray[i].buttonMode = true;
				numberArray[i].addEventListener(MouseEvent.MOUSE_DOWN, numbersFunc);
			}
			
			for (var j:int = 0; j < arrowArray.length; j++)
			{
				arrowArray[j].buttonMode = true;
				arrowArray[j].addEventListener(MouseEvent.MOUSE_DOWN, arrowsFunc);
			}
			
			hintArray = [roomMc.hint1, roomMc.hint2, roomMc.hint3, roomMc.hint4];
			
			for (var k:int = 0; k < hintArray.length; k++)
			{
				hintArray[k].x = 0;
				hintArray[k].y = 30;
				hintArray[k].visible = false;
			}
			soundRandom = Math.round(Math.random() * 3);
			hintArray[soundRandom].visible = true;
			
			soundcontrol1 = new SoundControl();
			soundcontrol1.loadSound("09_aqtivoba_01.mp3", 1)
			soundcontrol2 = new SoundControl();
			soundcontrol2.loadSound("09_aqtivoba_02.mp3", 1)
			soundcontrol3 = new SoundControl();
			soundcontrol3.loadSound("09_aqtivoba_03.mp3", 1)
			soundcontrol4 = new SoundControl();
			soundcontrol4.loadSound("09_aqtivoba_04.mp3", 1)
			setTimeout(garqroba, 6000);
			soundsArray = [soundcontrol1, soundcontrol2, soundcontrol3, soundcontrol4];
			soundsArray[soundRandom].soundPlay();
		
		} ////end addRooms
		
		private function garqroba():void
		{
			
			hintArray[soundRandom].visible = false;
		}
		
		private function numbersFunc(ev:MouseEvent):void
		{
			
			if (counterQueue % 2 == 1 || counterQueue == 6)
			{
				return;
			}
			
			currX = 217;
			if (counterNumbers == 0)
			{
				currY = -32;
			}
			
			if (counterNumbers == 1)
			{
				currY = 0;
			}
			
			if (counterNumbers == 2)
			{
				currY = 32;
			}
			
			///write in stepCounter
			if (ev.currentTarget == one)
			{
				stepCounter[i] = 1;
				i++;
			}
			if (ev.currentTarget == two)
			{
				stepCounter[i] = 2;
				i++;
				
			}
			if (ev.currentTarget == three)
			{
				stepCounter[i] = 3;
				i++;
			}
			if (ev.currentTarget == four)
			{
				stepCounter[i] = 4;
				i++;
				
			}
			if (ev.currentTarget == five)
			{
				stepCounter[i] = 5;
				i++;
				
			}
			if (ev.currentTarget == six)
			{
				stepCounter[i] = 6;
				i++;
				
			}
			if (ev.currentTarget == seven)
			{
				stepCounter[i] = 7;
				i++;
				
			}
			if (ev.currentTarget == eight)
			{
				stepCounter[i] = 8;
				i++;
				
			}
			if (ev.currentTarget == nine)
			{
				stepCounter[i] = 9;
				i++;
				
			}
			
			//ev.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, numbersFunc);		
			ev.currentTarget.x = currX;
			ev.currentTarget.y = currY;
			counterNumbers++;
			counterQueue++;
			//moveCounter++;
		
		} ///end NumbersFunc
		
		private function arrowsFunc(ev:MouseEvent):void
		{
			if (counterQueue % 2 == 0 || counterQueue == 6)
			{
				return;
			}
			
			currX = 545;
			
			if (counterArrows == 0)
			{
				currY = -33;
			}
			
			if (counterArrows == 1)
			{
				currY = -1;
			}
			
			if (counterArrows == 2)
			{
				currY = 31;
			}
			
			if (ev.currentTarget == leftArrow)
			{
				arrowCounter[j] = "left"
				j++;
			}
			if (ev.currentTarget == upArrow)
			{
				arrowCounter[j] = "up"
				j++;
			}
			if (ev.currentTarget == downArrow)
			{
				arrowCounter[j] = "down"
				j++;
			}
			
			//ev.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, arrowsFunc);
			ev.currentTarget.x = currX;
			ev.currentTarget.y = currY;
			counterArrows++;
			counterQueue++;
			moveCounter++;
		
		} ///endarrowsFunc
		
		private function playMcFunc(ev:MouseEvent):void
		{
			if (playMcChecker != 0)
			{
				return;
			}
			if (counterArrows != counterNumbers)
			{
				return;
			}
			if (arrowCounter[0] == "left")
			{
				
				if (stepCounter[0] == 7 || stepCounter[0] == 4)
				{
					TweenMax.fromTo(step, 1, {x: step.x, y: step.y}, {x: (step.x - stepCounter[0] * 66), y: step.y, onComplete: secondFunc});
					oldStepX = step.x - stepCounter[0] * 66;
					oldStepY = step.y;
					
				}
				else
				{
					TweenMax.fromTo(step, 1, {x: step.x, y: step.y}, {x: (step.x - stepCounter[0] * 66), y: step.y, onComplete: errorFunc});
					errorMc.x -= stepCounter[0] * 67;
					errorMc.y = -22;
				}
			}
			
			if (arrowCounter[0] == "up")
			{
				trace("error");
				TweenMax.fromTo(step, 1, {x: step.x, y: step.y}, {x: (step.x - stepCounter[0] * 66), y: step.y, onComplete: errorFunc});
				errorMc.x = step.x - stepCounter[0] * 67;
				errorMc.y = -78;
			}
			if (arrowCounter[0] == "down")
			{
				trace("error")
				TweenMax.fromTo(step, 1, {x: step.x, y: step.y}, {x: (step.x - stepCounter[0] * 66), y: step.y, onComplete: errorFunc});
				errorMc.x = step.x - stepCounter[0] * 67;
				errorMc.y = 33;
				
			} ////One
			playMcChecker++;
		
		}
		
		private function secondFunc():void
		{
			///////Up
			
			if (arrowCounter[1] == "up")
			{
				if ((!(stepCounter[0] == 4) && (stepCounter[0] == 7)) && soundRandom == 0)
				{
					if (stepCounter[1] < 4 && stepCounter[1] > 1)
					{
						TweenMax.fromTo(step, 1, {x: oldStepX, y: oldStepY}, {x: oldStepX, y: (oldStepY - stepCounter[1] * 48 + oldStepY), rotation: 90, onComplete: next});
					}
					else
					{
						//TweenMax.fromTo(step, 1, { x:oldStepX, y:oldStepY }, { x:(oldStepX - stepCounter[0] * 66), y:oldStepY, onComplete:errorFunc } );
						errorFunc();
						errorMc.x -= stepCounter[0] * 67;
						errorMc.y = -78;
					}
					
				}
				else if ((stepCounter[0] == 4 || !(stepCounter[0] == 7)) && soundRandom == 1)
				{
					
					if (stepCounter[1] < 4 && stepCounter[1] > 1)
					{
						TweenMax.fromTo(step, 1, {x: oldStepX, y: oldStepY}, {x: oldStepX, y: (oldStepY - stepCounter[1] * 48 + oldStepY), rotation: 90, onComplete: next});
					}
					else
					{
						trace("error");
						//TweenMax.fromTo(step, 1, { x:oldStepX, y:oldStepY }, { x:(oldStepX - stepCounter[0] * 66), y:oldStepY, onComplete:errorFunc } );
						errorFunc();
						errorMc.x -= stepCounter[0] * 67;
						errorMc.y = -78;
					}
				}
				else
				{
					
					trace("error");
					//TweenMax.fromTo(step, 1, { x:oldStepX, y:oldStepY }, { x:(oldStepX - stepCounter[0] * 66), y:oldStepY, onComplete:errorFunc } );
					errorFunc();
					errorMc.x -= stepCounter[0] * 67;
					errorMc.y = -78;
					
				}
			}
			
			///////////Down
			
			if (arrowCounter[1] == "down")
			{
				if ((!(stepCounter[0] == 4) && (stepCounter[0] == 7)) && soundRandom == 2)
				{
					if (stepCounter[1] < 4 && stepCounter[1] > 1)
					{
						TweenMax.fromTo(step, 1, {x: oldStepX, y: oldStepY}, {x: oldStepX, y: (oldStepY + stepCounter[1] * 48 - oldStepY), rotation: -90, onComplete: next});
					}
					else
					{
						trace("error");
						//TweenMax.fromTo(step, 1, { x:oldStepX, y:oldStepY }, { x:(oldStepX - stepCounter[0] * 66 ), y:oldStepY, onComplete:errorFunc } );
						errorFunc();
						errorMc.x -= stepCounter[0] * 67;
						errorMc.y = 33;
					}
					
				}
				else if ((stepCounter[0] == 4 && !(stepCounter[0] == 7)) && soundRandom == 3)
				{
					if (stepCounter[1] < 4 && stepCounter[1] > 1)
					{
						TweenMax.fromTo(step, 1, {x: oldStepX, y: oldStepY}, {x: oldStepX, y: (oldStepY + stepCounter[1] * 48 - oldStepY), rotation: -90, onComplete: next});
					}
					else
					{
						trace("error");
						//TweenMax.fromTo(step, 1, { x:oldStepX, y:oldStepY }, { x:(oldStepX - stepCounter[0] * 66 ), y:oldStepY, onComplete:errorFunc } );
						errorFunc();
						errorMc.x -= stepCounter[0] * 67;
						errorMc.y = 33;
					}
					
				}
				else
				{
					
					trace("error");
					//TweenMax.fromTo(step, 1, { x:oldStepX, y:oldStepY }, { x:(oldStepX - stepCounter[0] * 66 ), y:oldStepY, onComplete:errorFunc } );
					errorFunc();
					errorMc.x -= stepCounter[0] * 67;
					errorMc.y = 33;
					
				}
			}
			
			if (moveCounter > 2)
			{
				trace("Error")
				
			}
		
		}
		
		private function errorFunc():void
		{
			errorMc.visible = true;
		}
		
		private function deleteMcFunc(ev:MouseEvent):void
		{
			step.x = oldStepDeleteX;
			step.y = oldStepDeleteY;
			i = 0;
			j = 0;
			counterQueue = 0;
			counterArrows = 0;
			counterNumbers = 0;
			moveCounter = 0;
			
			one.x = oldOneX;
			one.y = oldOneY;
			
			two.x = oldTwoX;
			two.y = oldTwoY;
			
			three.x = oldThreeX;
			three.y = oldThreeY;
			
			four.x = oldFourX;
			four.y = oldFourY;
			
			five.x = oldFiveX;
			five.y = oldFiveY;
			
			six.x = oldSixX;
			six.y = oldSixY;
			
			seven.x = oldSevenX;
			seven.y = oldSevenY;
			
			eight.x = oldEightX;
			eight.y = oldEightY;
			;
			
			nine.x = oldNineX;
			nine.y = oldNineY;
			
			leftArrow.x = oldLeftX;
			leftArrow.y = oldLeftY;
			
			upArrow.x = oldUpX;
			upArrow.y = oldUpY;
			
			downArrow.x = oldDownX;
			downArrow.y = oldDownY;
			
			playMcChecker = 0;
			
			errorMc.x = oldErrorX;
			errorMc.y = oldErrorY;
			errorMc.visible = false;
		
		}
		
		private function next():void
		{
			setTimeout(nextSceneCall, 1000);
		}
		
		private function nextSceneCall():void
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		}
		
		private function destroy():void
		{
			
			removeChild(roomMc);
			roomMc = null;
			for (var i:int = 0; i < numberArray.length; i++)
			{
				
				numberArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, numbersFunc);
			}
			
			for (var j:int = 0; j < arrowArray.length; j++)
			{
				
				arrowArray[j].removeEventListener(MouseEvent.MOUSE_DOWN, arrowsFunc);
			}
			
			playMc.removeEventListener(MouseEvent.MOUSE_DOWN, playMcFunc);
			deleteMc.removeEventListener(MouseEvent.MOUSE_DOWN, deleteMcFunc);
		}
	
	}

}
