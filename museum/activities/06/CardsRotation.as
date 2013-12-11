package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.filters.GlowFilter;
	import flash.events.DataEvent;
	
	public class CardsRotation extends MovieClip
	{
		
		private var all:MovieClip;
		
		///arrays
		private var correctArray:Array;
		
		private var wrongArray:Array;
		private var answerArray:Array;
		private var otherArray:Array;
		private var correctIndex:Number;
		private var soundControl:SoundControl;
		private var currentMovieClip:Object;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function CardsRotation(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			initializationCards();
		}
		
		private function initializationCards():void
		{
			
			all = new All() as MovieClip;
			
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			
			all.height = _stageHeight / 1.2;
			all.scaleX = all.scaleY;
			
			//Main.button.visible = true;
			correctArray = [all.plane, all.phone, all.clock, all.binocular];
			wrongArray = [all.lamp, all.hippopotamus, all.ball, all.jug, all.book];
			answerArray = [all.planeText, all.phoneText, all.clockText, all.binocularText];
			otherArray = [all.chest, all.music, all.roll, all.hookah];
			correctIndex = 0;
			
			for (var j:int = 0; j < otherArray.length; j++)
			{
				otherArray[j].visible = false;
			}
			
			for (var i:int = 0; i < answerArray.length; i++)
			{
				answerArray[i].visible = false;
			}
			addRandom();
		}
		
		private function addRandom():void
		{
			
			var random:RandomPlus = new RandomPlus(3);
			var random1:RandomPlus = new RandomPlus(4);
			var mathRandom:Number = Math.random() * 2;
			
			for (var i:int; i < wrongArray.length; i++)
			{
				var rand:Number = random.getNum();
				var rand1:Number = random1.getNum();
				swap(correctArray[rand], wrongArray[rand1]);
			}
			
			if (mathRandom < 1)
			{
				var randOtherArray:Number = random.getNum();
				otherArray[randOtherArray].x = wrongArray[randOtherArray].x;
				otherArray[randOtherArray].y = wrongArray[randOtherArray].y;
				otherArray[randOtherArray].visible = true;
				
			}
			
			if (mathRandom > 1 && mathRandom < 2)
			{
				var randOtherArray1:Number = random.getNum();
				otherArray[randOtherArray1].x = wrongArray[randOtherArray1].x;
				otherArray[randOtherArray1].y = wrongArray[randOtherArray1].y;
				otherArray[randOtherArray1].visible = true;
			}
			
			if (mathRandom > 2)
			{
				
			}
			
			addChild(all);
			addListeners();
		} /// end andRandom
		
		private function swap(first:MovieClip, second:MovieClip):void
		{
			var thirdX:Number;
			var thirdY:Number;
			thirdX = first.x;
			first.x = second.x;
			second.x = thirdX;
			
			thirdY = first.y;
			first.y = second.y;
			second.y = thirdY;
		} // end swap
		
		private function addListeners():void
		{
			for (var j:int = 0; j < correctArray.length; j++)
			{
				correctArray[j].buttonMode = true;
				correctArray[j].addEventListener(MouseEvent.MOUSE_DOWN, correctFunc);
			}
			
			for (var i:int = 0; i < wrongArray.length; i++)
			{
				wrongArray[i].buttonMode = true;
				wrongArray[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunc);
				
			}
			
			for (var k:int = 0; k < otherArray.length; k++)
			{
				otherArray[k].buttonMode = true;
				otherArray[k].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunc);
			}
		
		} /// end addListeners
		
		private function wrongFunc(ev:MouseEvent):void
		{
			currentMovieClip = ev.currentTarget;
			var glow:GlowFilter = new GlowFilter();
			glow.color = 0xFF0000;
			glow.alpha = 1;
			glow.blurX = 25;
			glow.blurY = 25;
			ev.currentTarget.filters = [glow];
			setTimeout(gaqroba, 500);
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		
		} //end wrongFunc
		
		private function gaqroba():void
		{
			var glow:GlowFilter = new GlowFilter();
			glow.color = 0xFF0000;
			glow.alpha = 0;
			glow.blurX = 0;
			glow.blurY = 0;
			currentMovieClip.filters = [glow];
		}
		
		private function correctFunc(ev:MouseEvent):void
		{
			
			correctIndex++;
			
			for (var i:int = 0; i < correctArray.length; i++)
			{
				if (ev.currentTarget == correctArray[i])
				{
					answerArray[i].x = correctArray[i].x;
					answerArray[i].y = correctArray[i].y;
					answerArray[i].visible = true;
				}
			}
			
			if (correctIndex == 4)
			{
				
				soundControl = new SoundControl;
				soundControl.loadSound("correct.mp3", 1);
				addChild(soundControl);
				soundControl.soundPlay();
				setTimeout(next, 2000);
			}
		} ///end CoorectFunc
		
		private function next():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		} //end next
		
		private function destroy():void
		{
			
			for (var j:int = 0; j < correctArray.length; j++)
			{
				correctArray[j].removeEventListener(MouseEvent.MOUSE_DOWN, correctFunc);
			}
			
			for (var i:int = 0; i < wrongArray.length; i++)
			{
				wrongArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, wrongFunc);
				
			}
			removeChild(all);
			all = null;
		
		} //end destroy
	}
}
