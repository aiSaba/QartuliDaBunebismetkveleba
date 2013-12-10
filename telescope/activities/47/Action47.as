package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	public class Action47 extends MovieClip
	{
		private var earthAndMoon:MovieClip;
		private var _Height:Number;
		private var _Width:Number;
		private var count:int;
		private var sound:SoundControl;
		
		public function Action47(_Width:Number = 1024, _Height:Number = 800)
		{
			this._Width = _Width;
			this._Height = _Height;
			addEventListener(Event.ADDED_TO_STAGE, init)
			addEventListener(Event.REMOVED_FROM_STAGE, Destroy);
		}
		
		private function Destroy(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, Destroy);
			earthAndMoon.moon1.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon1.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
			earthAndMoon.moon2.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon2.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
			earthAndMoon.moon3.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon3.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
			earthAndMoon.moon4.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon4.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
			///if (earthAndMoon)
			///{
				///removeChild(earthAndMoon);
				///earthAndMoon = null;
			///}
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler()
		}
		
		private function initHandler():void
		{
			earthAndMoon = new EarthAndMoon();
			earthAndMoon.x = _Width / 2;
			earthAndMoon.y = _Height / 2;
			earthAndMoon.height = _Height / 1.5;
			earthAndMoon.scaleX = earthAndMoon.scaleY;
			addChild(earthAndMoon);
			
			earthAndMoon.moon1.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon1.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
			earthAndMoon.moon2.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon2.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
			earthAndMoon.moon3.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon3.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
			earthAndMoon.moon4.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler)
			earthAndMoon.moon4.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler)
		
		}
		
		private function stopDragHandler(e:MouseEvent):void
		{
			if (e.currentTarget.hitTestObject(earthAndMoon.earth))
			{
				switch (e.currentTarget.name)
				{
					case "moon1": 
						earthAndMoon.moon1.x = 79.6
						earthAndMoon.moon1.y = 1.75
						earthAndMoon.moon1.stopDrag();
						earthAndMoon.moon1.mouseEnabled = false;
						count++
						TheEnd();
						break;
					case "moon2": 
						earthAndMoon.moon2.x = -66.8
						earthAndMoon.moon2.y = 1.75
						earthAndMoon.moon2.stopDrag();
						earthAndMoon.moon2.mouseEnabled = false;
						count++
						TheEnd();
						break;
					case "moon3": 
						earthAndMoon.moon3.x = -211.75
						earthAndMoon.moon3.y = 1.75
						earthAndMoon.moon3.stopDrag();
						earthAndMoon.moon3.mouseEnabled = false;
						count++;
						TheEnd();
						break;
					case "moon4": 
						earthAndMoon.moon4.x = -356.15
						earthAndMoon.moon4.y = 1.75
						earthAndMoon.moon4.stopDrag();
						earthAndMoon.moon4.mouseEnabled = false;
						count++;
						TheEnd();
						break;
				
				}
			}
		}
		
		private function TheEnd():void
		{
			
			if (count == 4)
			{
				sound = new SoundControl()
				sound.loadSound("correct.mp3", 1);
				sound.soundPlay();
				setTimeout(nextStage, 3500)
			}
		}
		
		private function nextStage():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"))
			Destroy(null);
		}
		
		private function startDragHandler(e:MouseEvent):void
		{
			switch (e.currentTarget.name)
			{
				case "moon1": 
					earthAndMoon.moon1.startDrag();
					break;
				case "moon2": 
					earthAndMoon.moon2.startDrag();
					break;
				case "moon3": 
					earthAndMoon.moon3.startDrag();
					break;
				case "moon4": 
					earthAndMoon.moon4.startDrag();
					break;
			
			}
		
		}
	}

}
