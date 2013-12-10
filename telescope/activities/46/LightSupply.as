package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.utils.*;
	import flash.events.DataEvent;
	
	public class LightSupply extends MovieClip 
	{
		private var stage_light:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var blurX:Number;
		private var blurY:Number;
		private var soundControl:SoundControl;
		private var randomPlus:RandomPlus;
		private var randomText:int;
		private var TextArray:Array;
		private var randomIndex1:int;
		private var qula:int;
		
		public function LightSupply(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			YvelaferiFunc();
		}
		private function YvelaferiFunc():void
		{
			stage_light = new Stage_light();
			addChild(stage_light);
			stage_light.x = _stageWidth / 2;
			stage_light.y = _stageHeight / 2;
			stage_light.height = _stageHeight/1.5;
			stage_light.scaleX = stage_light.scaleY;
			
			TextArray = [ stage_light.TextBox_1, stage_light.TextBox_2 ]
			randomFunc();
		}
		private function randomFunc(): void
		{
			for (var i:int = 0; i < 2; i++)
			{
				randomPlus = new RandomPlus(i);
				randomIndex1 = randomPlus.getNum();
				
				if (TextArray[randomIndex1] == stage_light.TextBox_1)
				{
				stage_light.TextBox_1.visible = true;
				stage_light.TextBox_2.visible = false;
				
				stage_light.Moon.addEventListener(MouseEvent.MOUSE_DOWN, FalseFunc0);
				stage_light.Sun.addEventListener(MouseEvent.MOUSE_DOWN,  TrueFunc1);
				stage_light.Earth.addEventListener(MouseEvent.MOUSE_DOWN, falseFunc3);
				}
				if (TextArray[randomIndex1] != stage_light.TextBox_1)
				{
				stage_light.TextBox_2.visible = true;
				stage_light.TextBox_1.visible = false;
				
				stage_light.Moon.addEventListener(MouseEvent.MOUSE_DOWN, TrueFunc0);
				stage_light.Sun.addEventListener(MouseEvent.MOUSE_DOWN,   FalseFunc1);
				stage_light.Earth.addEventListener(MouseEvent.MOUSE_DOWN, TrueFunc2);
				}
			}
		}	
		
		private function TrueFunc1(event:Event):void 
		{
			if (TextArray[randomIndex1] == stage_light.TextBox_1)
			{
			TweenMax.to(stage_light.Sun.Sun_Shine, 1, { glowFilter: { color:0x91e600, alpha:1, blurX:15, blurY:15, strength:3 , delay:2 , remove:true}} );
			CorrecteFunc();
			}
		}
		
		private function TrueFunc0(event:Event):void 
		{ 
			if (TextArray[randomIndex1] != stage_light.TextBox_1)
			{
			TweenMax.to(stage_light.Moon, 1, { glowFilter: { color:0x91e600, alpha:1, blurX:15, blurY:15, strength:3 , delay:2 , remove:true}} );
			CorrecteFunc();
			}
		}
		
		private function falseFunc3(event:Event):void 
		{
			if (TextArray[randomIndex1] == stage_light.TextBox_1)
			{
			TweenMax.to(stage_light.Earth, 1, { glowFilter: { color:0xff0000, alpha:1, blurX:20, blurY:20, strength:4 , delay:2 , remove:true}} );
			FalseFunc();
			}
		}
		
		private function TrueFunc2(event:Event):void 
		{
			if (TextArray[randomIndex1] != stage_light.TextBox_1)
			{
			TweenMax.to(stage_light.Earth, 1, { glowFilter: { color:0x91e600, alpha:1, blurX:15, blurY:15, strength:3 , delay:2 , remove:true}} );
			CorrecteFunc();
			}
		}
		
		private function FalseFunc0(event:Event):void 
		{
			if (TextArray[randomIndex1] == stage_light.TextBox_1)
			{
			TweenMax.to(stage_light.Moon, 1, { glowFilter: { color:0xff0000, alpha:1, blurX:15, blurY:15, strength:3 , delay:2 , remove:true}} );
			FalseFunc();
			}
		}
		
		private function FalseFunc1(event:Event):void 
		{
			if (TextArray[randomIndex1] != stage_light.TextBox_1)
			{
			TweenMax.to(stage_light.Sun.Sun_Shine, 1, { glowFilter: { color:0xff0000, alpha:1, blurX:15, blurY:15, strength:3 , delay:2 , remove:true }} );
			FalseFunc();
			}
		}
		
		
		
		private function CorrecteFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			setTimeout(destroy, 1500)
		}
		
		private function FalseFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
			
		}
	
		
		private function destroy ()
		{
			
			
			removeChild(stage_light);
			stage_light = null;
			clearTimeout(1);
			TweenMax.killAll();
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene" ));
							
		
			
		}
}
	

}