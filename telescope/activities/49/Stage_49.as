package
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_49 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var textArray:Array;
		private var moon:MovieClip;
		private var randomPlus:RandomPlus;
		private var soundControl:SoundControl;
		private var randomIndex:int;
		private var moonArry:Array;
		private var moonArray:Array;
		private var correctMoon:String;
		private var correctMoonObj:String;
		private var scoreCounter:int;
		private var qula:int
		
		public function Stage_49(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			allFunc();
		}
		
		private function destroy():void
		{
			if (moon)
			{
				removeChild(moon);
				moon = null;
			}
			clearTimeout(1);
			TweenMax.killAll();
			
			for (var i:int = 0; i < moonArray.length; i++)
			{
				moonArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, checkFun)
				
			}
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
		}
		
		private function allFunc():void
		{
			addStage();
			
			textArray = ["ნამგალა მთვარე?", "სავსე მთვარე?", "პირველი მეოთხედი?", "ნახევარმთვარე?", "მილეული მთვარე?"];
			moonArray = [moon.namgala_mc, moon.full_mc, moon.half_mc, moon.mileuli_mc];
			
			randomPlus = new RandomPlus(0, 4);
			randomIndex = randomPlus.getNum();
			//trace (textArray[randomIndex]);
			moon.text_place.text = textArray[randomIndex];
			
			for (var i:int = 0; i < moonArray.length; i++)
			{
				moonArray[i].addEventListener(MouseEvent.MOUSE_DOWN, checkFun)
				moonArray[i].txt.visible  = false
			}
			
			if (scoreCounter == 3)
			{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
				destroy();
			}
		}
		
		private function checkFun(e:MouseEvent):void
		
		{
			for (var i:int = 0; i < moonArray.length; i++)
			{
				if (moonArray[i].txt.text == textArray[randomIndex])
				{
					correctMoon = textArray[randomIndex]
				}
			}
			
			if (textArray[randomIndex] == "ნახევარმთვარე?")
			{
				correctMoon = "პირველი მეოთხედი?"
			}
			
			if (e.currentTarget.txt.text == correctMoon)
			{
				trace("correct")
				TweenMax.to(e.currentTarget, 1, { glowFilter: { color:0x33cccc, alpha:1, blurX:15, blurY:15, strength:1 }} );
				setTimeout(destroyCaller, 1500)
				CorrectSound();
				
			}
			else
			{
				
				trace("incorrect")
				TweenMax.to(e.currentTarget, 1, { glowFilter: { color:0xff0000, alpha:1, blurX:15, blurY:15, strength:1, delay:1.5 , remove:true }} );
				IncorrectSound();
			}
		
		}
		
		private function addStage():void
		{
			moon = new Moon();
			addChild(moon);
			moon.x = _stageWidth / 2;
			moon.y = _stageHeight / 2;
			moon.height = _stageHeight / 1.5;
			moon.scaleX = moon.scaleY;
		}
		
		private function CorrectSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			scoreCounter++
			if (scoreCounter == 3)
			{
				ClapSound();
			}
			trace(scoreCounter)
		}
		
		private function IncorrectSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
			private function ClapSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("clap.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		
		private function destroyCaller()
		{
			destroy();
			
			
		}
	
	}

}
