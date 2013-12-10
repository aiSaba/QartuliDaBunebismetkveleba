package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.utils.setTimeout;
	import flash.utils.*;
	
	public class Fazebi extends MovieClip
	{
		private var stage_moon:MovieClip;
		
		private var spincounter:int
		private var bruniCount:int;
		private var CurrentX:Number;
		private var CurrentY:Number;
		private var soundControl:SoundControl;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var qula:int
		
		private var counter:int;
		
		public function Fazebi(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage_moon = new Stage_moon();
			addChild(stage_moon);
			stage_moon.x = _stageWidth / 2;
			stage_moon.y = _stageHeight / 2;
			stage_moon.height = _stageHeight / 1.5;
			stage_moon.scaleX = stage_moon.scaleY;
			
			YvelaferiFunc();
		}
		private function YvelaferiFunc():void
		{
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_DOWN, startSpin1);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_DOWN, startSpin2);
			stage_moon.button_Start.addEventListener(MouseEvent.MOUSE_DOWN, startSpin3);
			stage_moon.Pause.addEventListener(MouseEvent.MOUSE_DOWN, stopSpin);
			
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee1);
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee2);
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee3);
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee4);
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee5);
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee6);
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee7);
			stage_moon.button_Next.addEventListener(MouseEvent.MOUSE_UP, letsSee8);
			
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee1);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee2);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee3);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee4);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee5);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee6);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee7);
			stage_moon.button_Back.addEventListener(MouseEvent.MOUSE_UP, letsSee8);
			
			stage_moon.next_button.addEventListener(MouseEvent.CLICK, destroy);
		}
		private function destroy(e:Event):void
		{
			
			
			if (stage_moon)
			{
				
				removeChild(stage_moon)
				stage_moon = null
			}
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"  ));
		}
		private function CorrecteFunc():void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		private function stopSpin(e:Event):void
		{
			CorrecteFunc();
			stage_moon.Pause.visible = false;
			stage_moon.button_Start.visible = true;
			stage_moon.Moving_Moon.rotation = counter;
			spincounter = 8;
			if (spincounter == 0)
			{
				stage_moon.text_Box1.text = "ახალი";
				stage_moon.text_Box2.text = "მთვარე";
				
			}
			if (spincounter == 1)
			{
				stage_moon.text_Box1.text = "ნამგალა";
				stage_moon.text_Box2.text = "მთვარე";
			}
			if (spincounter == 2)
			{
				stage_moon.text_Box1.text = "პირველი მეოთხედი,";
				stage_moon.text_Box2.text = "ნახევარ მთვარე";
			}
			if (spincounter == 3)
			{
				stage_moon.text_Box1.text = "შევსებადი";
				stage_moon.text_Box2.text = "მთვარე";
			}
			if (spincounter == 4)
			{
				stage_moon.text_Box1.text = "სავსე";
				stage_moon.text_Box2.text = "მთვარე";
			}
			if (spincounter == 5)
			{
				stage_moon.text_Box1.text = "მილევადი";
				stage_moon.text_Box2.text = "მთვარე";
			}
			if (spincounter == 6)
			{
				stage_moon.text_Box1.text = "ბოლო მეოთხედი,";
				stage_moon.text_Box2.text = "ნახევარ მთვარე";
			}
			if (spincounter == 7)
			{
				stage_moon.text_Box1.text = "მილეული,";
				stage_moon.text_Box2.text = "მთვარე";
			}
		}
		private function startSpin1(event:Event):void
		{
			CorrecteFunc();
			stage_moon.Moving_Moon.rotation -= 45;
		}
		private function startSpin2(event:Event):void
		{
			CorrecteFunc();
			stage_moon.Moving_Moon.rotation += 45;
		}
		private function startSpin3(e:MouseEvent):void
		{
			CorrecteFunc();
			
			setTimeout(startSpinXX, 50);
			stage_moon.Pause.visible = true;
			stage_moon.button_Start.visible = false;
		}
		private function startSpinXX():void
		{
			
			if (spincounter >= 8)
			{
				spincounter = 0;
				YvelaferiFunc();
				stage_moon.Pause.visible = false;
				stage_moon.button_Start.visible = true;
			}
			
			else
			{
				stage_moon.button_Start.removeEventListener(MouseEvent.MOUSE_DOWN, startSpin3);
				stage_moon.button_Back.removeEventListener(MouseEvent.MOUSE_DOWN, startSpin2);
				stage_moon.button_Next.removeEventListener(MouseEvent.MOUSE_DOWN, startSpin1);
				stage_moon.next_button.removeEventListener(MouseEvent.CLICK, destroy);
				spincounter++
				
				stage_moon.Moving_Moon.rotation -= 45
				counter = stage_moon.Moving_Moon.rotation;
				
				setTimeout(startSpinXX, 1500);
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_1) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_1, 1, {x: -77.7, y: 20.45, alpha: 1});
					TweenLite.to(stage_moon.Moon_shad_1, 1, {x: 327.1, y: -91.85, alpha: 1});
					stage_moon.text_Box1.text = "ახალი";
					stage_moon.text_Box2.text = "მთვარე";
					
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_1, 0.2, {x: -77.7, y: 20.45, alpha: 0});
					TweenLite.to(stage_moon.Moon_shad_1, 0.2, {x: 327.1, y: -91.85, alpha: 0});
				}
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_2) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_2, 1, {x: -107, y: -90, alpha: 1});
					
					TweenLite.to(stage_moon.Moon_shad_2, 1, {x: 296.8, y: -117.5, alpha: 1});
					stage_moon.text_Box1.text = "ნამგალა";
					stage_moon.text_Box2.text = "მთვარე";
					
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_2, 0.2, {x: -107, y: -90, alpha: 0});
					TweenLite.to(stage_moon.Moon_shad_2, 0.2, {x: 296.8, y: -117.5, alpha: 0});
				}
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_3) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_3, 1, {x: -207.55, y: -132.15, alpha: 1});
					TweenLite.to(stage_moon.Moon_shad_3, 1, {x: 266.8, y: -100, alpha: 1});
					stage_moon.text_Box1.text = "პირველი მეოთხედი,";
					stage_moon.text_Box2.text = "ნახევარ მთვარე";
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_3, 0.2, {x: -207.55, y: -132.15, alpha: 0});
					TweenLite.to(stage_moon.Moon_shad_3, 0.2, {x: 266.8, y: -100, alpha: 0});
					
				}
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_4) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_4, 1, {x: -316.45, y: -90.25, alpha: 1});
					TweenLite.to(stage_moon.Moon_shad_4, 1, {x: 291.4, y: -94.05, alpha: 1});
					stage_moon.text_Box1.text = "შევსებადი";
					stage_moon.text_Box2.text = "მთვარე";
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_4, 0.2, {x: -316.45, y: -90.25, alpha: 0});
					TweenLite.to(stage_moon.Moon_shad_4, 0.2, {x: 291.4, y: -94.05, alpha: 0});
					
				}
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_5) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_5, 1, {x: -339.25, y: 17.8, alpha: 1});
					stage_moon.text_Box1.text = "სავსე";
					stage_moon.text_Box2.text = "მთვარე";
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_5, 0.2, {x: -339.25, y: 17.8, alpha: 0});
				}
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_6) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_6, 1, {x: -306.7, y: 126.45, alpha: 1});
					TweenLite.to(stage_moon.Moon_shad_6, 1, {x: 369.05, y: -96.4, alpha: 1});
					stage_moon.text_Box1.text = "მილევადი";
					stage_moon.text_Box2.text = "მთვარე";
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_6, 0.2, {x: -306.7, y: 126.45, alpha: 0});
					TweenLite.to(stage_moon.Moon_shad_6, 0.2, {x: 369.05, y: -96.4, alpha: 0});
				}
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_7) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_7, 1, {x: -257, y: 155.4, alpha: 1});
					TweenLite.to(stage_moon.Moon_shad_7, 1, {x: 392.4, y: -86.4, alpha: 1});
					stage_moon.text_Box1.text = "ბოლო მეოთხედი,";
					stage_moon.text_Box2.text = "ნახევარ მთვარე";
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_7, 0.2, {x: -257, y: 155.4, alpha: 0});
					TweenLite.to(stage_moon.Moon_shad_7, 0.2, {x: 392.4, y: -86.4, alpha: 0});
				}
				
				if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_8) == true)
				{
					TweenLite.to(stage_moon.Moon_shadow_8, 1, {x: -103.9, y: 128.15, alpha: 1});
					TweenLite.to(stage_moon.Moon_shad_8, 1, {x: 362.4, y: -92.05, alpha: 1});
					stage_moon.text_Box1.text = "მილეული,";
					stage_moon.text_Box2.text = "მთვარე";
				}
				else
				{
					TweenLite.to(stage_moon.Moon_shadow_8, 0.2, {x: -103.9, y: 128.15, alpha: 0});
					TweenLite.to(stage_moon.Moon_shad_8, 0.2, {x: 362.4, y: -92.05, alpha: 0});
					
				}
				
			}
		}
		private function letsSee1(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_1) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_1, 1, {x: -77.7, y: 20.45, alpha: 1});
				TweenLite.to(stage_moon.Moon_shad_1, 1, {x: 327.1, y: -91.85, alpha: 1});
				stage_moon.text_Box1.text = "ახალი";
				stage_moon.text_Box2.text = "მთვარე";
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_1, 0.2, {x: -77.7, y: 20.45, alpha: 0});
				TweenLite.to(stage_moon.Moon_shad_1, 0.2, {x: 327.1, y: -91.85, alpha: 0});
			}
		}
		private function letsSee2(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_2) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_2, 1, {x: -107, y: -90, alpha: 1});
				
				TweenLite.to(stage_moon.Moon_shad_2, 1, {x: 296.8, y: -117.5, alpha: 1});
				stage_moon.text_Box1.text = "ნამგალა";
				stage_moon.text_Box2.text = "მთვარე";
				
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_2, 0.2, {x: -107, y: -90, alpha: 0});
				TweenLite.to(stage_moon.Moon_shad_2, 0.2, {x: 296.8, y: -117.5, alpha: 0});
			}
		}
		private function letsSee3(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_3) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_3, 1, {x: -207.55, y: -132.15, alpha: 1});
				TweenLite.to(stage_moon.Moon_shad_3, 1, {x: 266.8, y: -100, alpha: 1});
				stage_moon.text_Box1.text = "პირველი მეოთხედი,";
				stage_moon.text_Box2.text = "ნახევარ მთვარე";
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_3, 0.2, {x: -207.55, y: -132.15, alpha: 0});
				TweenLite.to(stage_moon.Moon_shad_3, 0.2, {x: 266.8, y: -100, alpha: 0});
				
			}
		}
		private function letsSee4(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_4) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_4, 1, {x: -316.45, y: -90.25, alpha: 1});
				TweenLite.to(stage_moon.Moon_shad_4, 1, {x: 291.4, y: -94.05, alpha: 1});
				stage_moon.text_Box1.text = "შევსებადი";
				stage_moon.text_Box2.text = "მთვარე";
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_4, 0.2, {x: -316.45, y: -90.25, alpha: 0});
				TweenLite.to(stage_moon.Moon_shad_4, 0.2, {x: 291.4, y: -94.05, alpha: 0});
				
			}
		}
		private function letsSee5(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_5) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_5, 1, {x: -339.25, y: 17.8, alpha: 1});
				stage_moon.text_Box1.text = "სავსე";
				stage_moon.text_Box2.text = "მთვარე";
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_5, 0.2, {x: -339.25, y: 17.8, alpha: 0});
			}
		}
		private function letsSee6(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_6) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_6, 1, {x: -306.7, y: 126.45, alpha: 1});
				TweenLite.to(stage_moon.Moon_shad_6, 1, {x: 369.05, y: -96.4, alpha: 1});
				stage_moon.text_Box1.text = "მილევადი";
				stage_moon.text_Box2.text = "მთვარე";
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_6, 0.2, {x: -306.7, y: 126.45, alpha: 0});
				TweenLite.to(stage_moon.Moon_shad_6, 0.2, {x: 369.05, y: -96.4, alpha: 0});
			}
		}
		private function letsSee7(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_7) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_7, 1, {x: -257, y: 155.4, alpha: 1});
				TweenLite.to(stage_moon.Moon_shad_7, 1, {x: 392.4, y: -86.4, alpha: 1});
				stage_moon.text_Box1.text = "ბოლო მეოთხედი,";
				stage_moon.text_Box2.text = "ნახევარ მთვარე";
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_7, 0.2, {x: -257, y: 155.4, alpha: 0});
				TweenLite.to(stage_moon.Moon_shad_7, 0.2, {x: 392.4, y: -86.4, alpha: 0});
			}
		}
		private function letsSee8(e:Event):void
		{
			if (stage_moon.Moving_Moon.hitTestObject(stage_moon.Moon_shadow_8) == true)
			{
				TweenLite.to(stage_moon.Moon_shadow_8, 1, {x: -103.9, y: 128.15, alpha: 1});
				TweenLite.to(stage_moon.Moon_shad_8, 1, {x: 362.4, y: -92.05, alpha: 1});
				stage_moon.text_Box1.text = "მილეული";
				stage_moon.text_Box2.text = "მთვარე";
			}
			else
			{
				TweenLite.to(stage_moon.Moon_shadow_8, 0.2, {x: -103.9, y: 128.15, alpha: 0});
				TweenLite.to(stage_moon.Moon_shad_8, 0.2, {x: 362.4, y: -92.05, alpha: 0});
			}
		}
	}

}
