package
{
	
	
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;

	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.events.DataEvent;
	
	public class Stage_36 extends MovieClip
	{
		
		private var sun_X1:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		private var  scaleCount:int;
		

		public function Stage_36(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
		
		private function allFunc():void
		{
			addStage();
			
			//next Button
			
			sun_X1.Next_button.addEventListener (MouseEvent.CLICK, destroy)
			
			//  buttons on the top
			sun_X1.sunButton_mc2.visible = false
			sun_X1.earthButton_mc2.visible = false
			sun_X1.moonButton_mc2.visible = false
			
			
			//turn On/Off
			sun_X1.sunButton_mc1.addEventListener (MouseEvent.CLICK, turnOffsun);
			sun_X1.sunButton_mc2.addEventListener (MouseEvent.CLICK, turnOnsun);
			
			sun_X1.earthButton_mc1.addEventListener (MouseEvent.CLICK, turnOffearth);
			sun_X1.earthButton_mc2.addEventListener (MouseEvent.CLICK, turnOnearth);
			
			sun_X1.moonButton_mc1.addEventListener (MouseEvent.CLICK, turnOffmoon);
			sun_X1.moonButton_mc2.addEventListener (MouseEvent.CLICK, turnOnmoon);
			
			//Planets ZOOM
			
			sun_X1.plus_mc.addEventListener (MouseEvent.CLICK, zoomIn);
			sun_X1.minus_mc.addEventListener (MouseEvent.CLICK, zoomOut);
			
			
			
			///FADE///
			
			sun_X1.plus_mc.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.plus_mc.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			sun_X1.minus_mc.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.minus_mc.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			
			sun_X1.sunButton_mc1.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.sunButton_mc2.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			
			sun_X1.sunButton_mc1.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			sun_X1.sunButton_mc2.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			sun_X1.earthButton_mc1.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.earthButton_mc2.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			
			sun_X1.earthButton_mc1.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			sun_X1.earthButton_mc2.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			sun_X1.moonButton_mc1.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.moonButton_mc2.addEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			
			sun_X1.moonButton_mc1.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			sun_X1.moonButton_mc2.addEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			///END FADE///
		}
		
		//destroy
		
		private function destroy (e:MouseEvent):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene" ));
			sun_X1.Next_button.removeEventListener (MouseEvent.CLICK, destroy)
			
			//  buttons on the top
			sun_X1.sunButton_mc2.visible = false
			sun_X1.earthButton_mc2.visible = false
			sun_X1.moonButton_mc2.visible = false
			
			
			//turn On/Off
			sun_X1.sunButton_mc1.removeEventListener (MouseEvent.CLICK, turnOffsun);
			sun_X1.sunButton_mc2.removeEventListener (MouseEvent.CLICK, turnOnsun);
			
			sun_X1.earthButton_mc1.removeEventListener (MouseEvent.CLICK, turnOffearth);
			sun_X1.earthButton_mc2.removeEventListener (MouseEvent.CLICK, turnOnearth);
			
			sun_X1.moonButton_mc1.removeEventListener (MouseEvent.CLICK, turnOffmoon);
			sun_X1.moonButton_mc2.removeEventListener (MouseEvent.CLICK, turnOnmoon);
			
			//Planets ZOOM
			
			sun_X1.plus_mc.removeEventListener (MouseEvent.CLICK, zoomIn);
			sun_X1.minus_mc.removeEventListener (MouseEvent.CLICK, zoomOut);
			
			
			
			///FADE///
			
			sun_X1.plus_mc.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.plus_mc.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			sun_X1.minus_mc.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.minus_mc.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			
			sun_X1.sunButton_mc1.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.sunButton_mc2.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			
			sun_X1.sunButton_mc1.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			sun_X1.sunButton_mc2.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			sun_X1.earthButton_mc1.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.earthButton_mc2.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			
			sun_X1.earthButton_mc1.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			sun_X1.earthButton_mc2.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			sun_X1.moonButton_mc1.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			sun_X1.moonButton_mc2.removeEventListener (MouseEvent.MOUSE_OVER, fadeOn);
			
			sun_X1.moonButton_mc1.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			sun_X1.moonButton_mc2.removeEventListener (MouseEvent.MOUSE_OUT, fadeOff);
			
			///END FADE///
			
			
			
			try{
			
			if (sun_X1)
			{
				removeChild (sun_X1);
				sun_X1 = null
			}
			}
			catch (e:Error)
			{}
			
			
		}
		
		
		//// Add Stage///
		private function addStage ():void
		{
			
			sun_X1 = new Sun_X1 ();
			addChild (sun_X1);
			
			sun_X1.x = _stageWidth / 2;
			sun_X1.y = _stageHeight / 2;
			sun_X1.height = _stageHeight/1.5;
			sun_X1.scaleX = sun_X1.scaleY;
		}
		
		
		///Zoom IN
		
		private function zoomIn (e:MouseEvent):void
		{
			sun_X1.planetsScale.sun_mc.sunText_mc.visible = false;
			sun_X1.planetsScale.earth_mc.earthText_mc.visible = false;
			sun_X1.planetsScale.moon_mc.moonText_mc.visible = false;
			trace (scaleCount)
			scaleCount++
			
			if (scaleCount >= 5)
			{
				scaleCount = 4
				
				return
			}
			
			
			sun_X1.planetsScale.sun_mc.x = sun_X1.planetsScale.sun_mc.x + 21
			sun_X1.planetsScale.sun_mc.y = sun_X1.planetsScale.sun_mc.y + 35
			sun_X1.gotoAndStop(scaleCount*10);
			
		}
		
		/// Zoom OUT
		
				private function zoomOut (e:MouseEvent):void
		{
			
			trace (scaleCount)
			if (scaleCount > 0 )
			{
			scaleCount--
			sun_X1.gotoAndStop(scaleCount * 10);

			sun_X1.planetsScale.sun_mc.x = sun_X1.planetsScale.sun_mc.x - 21
			sun_X1.planetsScale.sun_mc.y = sun_X1.planetsScale.sun_mc.y - 35
			}
			

				
				
				if (scaleCount == 0)
				{
					
			sun_X1.planetsScale.sun_mc.sunText_mc.visible = true;
			sun_X1.planetsScale.earth_mc.earthText_mc.visible = true;
			sun_X1.planetsScale.moon_mc.moonText_mc.visible = true;
			
			
				}
	
			
			
		}
		
		///SUN
		private function turnOffsun (e:MouseEvent):void
		{
			trace ("chaqra")
			//TweenMax.to(sun_X1.planetsScale.sun_mc, 1, {glowFilter:{color:0x91e600, alpha:1, blurX:30, blurY:30}});
			//TweenLite.to(sun_X1.planetsScale.sun_mc, 1, { autoAlpha:0 } );
			//sun_X1.planetsScale.sun_mc.alpha = 0.5
			//TweenLite.to(sun_X1.planetsScale.sun_mc, 1, {autoAlpha:0, ease:Back.easeOut});
			sun_X1.planetsScale.sun_mc.visible = false;
			sun_X1.sunButton_mc1.visible = false
			sun_X1.sunButton_mc2.visible = true
			
			sun_X1.planetsScale.earth_mc.alpha = 0.5
			sun_X1.planetsScale.moon_mc.alpha = 0.5
		}
		
				private function turnOnsun(e:MouseEvent):void
		{
			trace ("ainto")
			//TweenLite.to(sun_X1.sun_mc, 0.1, {autoAlpha:1});
			sun_X1.planetsScale.sun_mc.visible = true;
			sun_X1.sunButton_mc1.visible = true
			sun_X1.sunButton_mc2.visible = false
			sun_X1.planetsScale.earth_mc.alpha = 1
			sun_X1.planetsScale.moon_mc.alpha = 1
			
		}
		
		
		//EARTH
				private function turnOffearth (e:MouseEvent):void
		{
			trace ("chaqra")
			
			//TweenLite.to(sun_X1.sun_mc, 1, {autoAlpha:0});
			sun_X1.planetsScale.earth_mc.visible = false;
			sun_X1.earthButton_mc1.visible = false
			sun_X1.earthButton_mc2.visible = true
		}
		
				private function turnOnearth(e:MouseEvent):void
		{
			trace ("ainto")
			//TweenLite.to(sun_X1.sun_mc, 0.1, {autoAlpha:1});
			sun_X1.planetsScale.earth_mc.visible = true;
			sun_X1.earthButton_mc1.visible = true
			sun_X1.earthButton_mc2.visible = false
			
		}
		
		//MOON
				private function turnOffmoon (e:MouseEvent):void
		{
			trace ("chaqra")
			
			//TweenLite.to(sun_X1.sun_mc, 1, {autoAlpha:0});
			sun_X1.planetsScale.moon_mc.visible = false;
			sun_X1.moonButton_mc1.visible = false
			sun_X1.moonButton_mc2.visible = true
		}
		
				private function turnOnmoon (e:MouseEvent):void
		{
			trace ("ainto")
			//TweenLite.to(sun_X1.sun_mc, 0.1, {autoAlpha:1});
			sun_X1.planetsScale.moon_mc.visible = true;
			sun_X1.moonButton_mc1.visible = true
			sun_X1.moonButton_mc2.visible = false
			
		}
		
		//Fade On/Off
		private function fadeOn(e:MouseEvent):void
		{
			e.currentTarget.alpha = 0.5
		}
		
			private function fadeOff(e:MouseEvent):void
		{
			e.currentTarget.alpha = 1
		}
		
	
	}

}
