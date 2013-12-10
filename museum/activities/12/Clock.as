package
{
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class Clock extends MovieClip
	{
		//private var clockLoader:Loader;
		//private var clockUrl:URLRequest;
		private var clock:MovieClip;
		
		
		TweenPlugin.activate([ShortRotationPlugin]);
		private var oldRotation:Number;
		private var ax:Number;
		private var ay:Number;
		private var bx:Number;
		private var by:Number;
		private var thetaA:Number;
		private var thetaB:Number;
		private var delTheta:Number;
		private var newTheta:Number;
		
		private var oldRotation1:Number;
		private var ax1:Number;
		private var ay1:Number;
		private var bx1:Number;
		private var by1:Number;
		private var thetaA1:Number;
		private var thetaB1:Number;
		private var delTheta1:Number;
		private var newTheta1:Number;
		
		private var bool1:Boolean;
		private var bool2:Boolean;
				
		private var timeArray:Array;
		private var randomNumb:Number;
		private var random1:RandomPlus;
		
		private var count:int;
		
		
		
		
		private var direction:String;
		private var soundControl2:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function Clock(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMain();
		}
		
		private function initMain():void
		{
			
			clock = new SaatiMc();

			//clock.height = _stageHeight/1.2;
			clock.scaleX = clock.scaleY;
			addChild(clock)
			
			clock.vinyl_mc.buttonMode = true;
			clock.arrow.buttonMode = true;
			clock.vinyl_mc.addEventListener(MouseEvent.MOUSE_DOWN, dragger);
			clock.arrow.addEventListener(MouseEvent.MOUSE_DOWN, dragger1);
			
			timeArray = ["21:00", "2:25", "13:40", "7:15", "23:30","12:50"];
			random1 = new RandomPlus(5);
			randomNumb = random1.getNum();
			
			clock.SaatiText.text = timeArray[randomNumb];
			
			
			
			bool1 = false;
			bool2 = false;
			
			
		}		
		private function dragger1(evt:MouseEvent):void
		{
			if (evt.type == MouseEvent.MOUSE_DOWN)
			{
				
				stage.addEventListener(MouseEvent.MOUSE_MOVE, dragger1);
				stage.addEventListener(MouseEvent.MOUSE_UP, dragger1);
				oldRotation1 = clock.arrow.rotation;
				ax1 = stage.mouseX - clock.arrow.x;
				ay1 = stage.mouseY - clock.arrow.y;
				thetaA1 = Math.atan2(ay1, ax1) * 180 / Math.PI;
				if (thetaA1 < 0)
				{
					thetaA1 = -thetaA1;
				}
				else
				{
					thetaA1 = 360 - thetaA1;
				}
				
			}
			else if (evt.type == MouseEvent.MOUSE_MOVE)
			{				
				
				bx1 = stage.mouseX - clock.arrow.x;
				by1 = stage.mouseY - clock.arrow.y;
				thetaB1 = Math.atan2(by1, bx1) * 180 / Math.PI;
				
				if (thetaB1 < 0)
				{
					thetaB1 = -thetaB1;
				}
				else
				{
					thetaB1 = 360 - thetaB1;
				}
				
				delTheta1 = thetaB1- thetaA1;
				newTheta1 = oldRotation1 - delTheta1;
				
				TweenMax.to(clock.arrow, 0.1, {shortRotation: {rotation: newTheta1}, overwrite: true});
				
			}
			else if (evt.type == MouseEvent.MOUSE_UP)
			{
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragger1);
				stage.removeEventListener(MouseEvent.MOUSE_UP, dragger1);
				if (clock.SaatiText.text == "21:00")
				{
					if (clock.arrow.hitTestObject(clock.tormeti))
					{
						
						bool1 = true;
						count++;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "2:25")
				{
					if (clock.arrow.hitTestObject(clock.xuti))
					{
						
						bool1 = true;
						count++;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "13:40")
				{
					if (clock.arrow.hitTestObject(clock.rva))
					{
						
						bool1 = true;
						count++;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "7:15")
				{
					if (clock.arrow.hitTestObject(clock.sami))
					{
						
						bool1 = true;
						count++;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "23:30")
				{
					if (clock.arrow.hitTestObject(clock.eqvsi))
					{
						
						bool1 = true;
						count++;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "12:50")
				{
					if (clock.arrow.hitTestObject(clock.ati))
					{
						
						bool1 = true;
						count++;
						newtext();
						return
					}
					
				}
				
			}
		
		}
		
		private function dragger(evt:MouseEvent)
		{
			if (evt.type == MouseEvent.MOUSE_DOWN)
			{
				stage.addEventListener(MouseEvent.MOUSE_MOVE, dragger);
				stage.addEventListener(MouseEvent.MOUSE_UP, dragger);
				oldRotation = clock.vinyl_mc.rotation;
				ax = stage.mouseX - clock.vinyl_mc.x;
				ay = stage.mouseY - clock.vinyl_mc.y;
				thetaA = Math.atan2(ay, ax) * 180 / Math.PI;
				if (thetaA < 0)
				{
					thetaA = -thetaA;
				}
				else
				{
					thetaA = 360 - thetaA;
				}
				
			}
			else if (evt.type == MouseEvent.MOUSE_MOVE)
			{
				bx = stage.mouseX - clock.vinyl_mc.x;
				by = stage.mouseY - clock.vinyl_mc.y;
				thetaB = Math.atan2(by, bx) * 180 / Math.PI;
				
				if (thetaB < 0)
				{
					thetaB = -thetaB;
				}
				else
				{
					thetaB = 360 - thetaB;
				}
				
				delTheta = thetaB - thetaA;
				newTheta = oldRotation - delTheta;
				
				TweenMax.to(clock.vinyl_mc, 0.1, {shortRotation: {rotation: newTheta}, overwrite: true, ease: Cubic.easeOut});
				
			}
			else if (evt.type == MouseEvent.MOUSE_UP)
			{
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragger);
				stage.removeEventListener(MouseEvent.MOUSE_UP, dragger);
				
				if (clock.SaatiText.text == "21:00")
				{
					if (clock.vinyl_mc.hitTestObject(clock.cxra1))
					{
						
						bool2 = true;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "2:25")
				{
					if (clock.vinyl_mc.hitTestObject(clock.ori1))
					{
						
						bool2 = true;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "13:40")
				{
					if (clock.vinyl_mc.hitTestObject(clock.erti1))
					{
						
						bool2 = true;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "7:15")
				{
					if (clock.vinyl_mc.hitTestObject(clock.shvidi1))
					{
						
						bool2 = true;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "23:30")
				{
					if (clock.vinyl_mc.hitTestObject(clock.tertmeti1))
					{
						
						bool2 = true;
						newtext();
						return
					}
					
				}
				if (clock.SaatiText.text == "12:50")
				{
					if (clock.vinyl_mc.hitTestObject(clock.tormeti1))
					{
						
						bool2 = true;
						newtext();
						return
					}
					
				}		
				
			}
		}
		
		private function newtext():void 
		{
			randomNumb = random1.getNum();
			if (bool1 && bool2)
			{
				bool1 = false;
				bool2 = false;
				clock.SaatiText.text = timeArray[randomNumb];
				
			}
			if (count == 4)
			{
				
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOFClass"));
				destroy();
			}
			
		}
		private function destroy():void 
		{
			TweenMax.killTweensOf(clock.arrow);
			if (clock) 
			{
				removeChild(clock)
				clock = null;		
			}			
						
		}
	}

}


