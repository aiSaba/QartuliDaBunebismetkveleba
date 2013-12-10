package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.*;
	import flash.events.DataEvent;
	
	public class StartStopHit3 extends MovieClip
	{
		private var Drag:MovieClip
		private var Drag1:MovieClip;
		private var Drag2:MovieClip;
		private var Hit:MovieClip
		
		private var StartCordinats:Point;
		private var StartCordinats1:Point;
		private var StartCordinats2:Point;
		
		private var fordispach:Boolean;
		private var fordispach1:Boolean;
		private var fordispach2:Boolean;
		
		public function StartStopHit3(_Drag:MovieClip, _Drag1:MovieClip, _Drag2:MovieClip,  _Hit:MovieClip)
		{
			
			this.Drag = _Drag;
			this.Hit = _Hit;
			this.Drag1 = _Drag1;
			this.Drag2 = _Drag2;
			
			StartCordinats = new Point();
			StartCordinats.x = Drag.x;
			StartCordinats.y = Drag.y;
			StartCordinats1 = new Point;
			StartCordinats1.x = Drag1.x;
			StartCordinats1.y = Drag1.y;
			StartCordinats2 = new Point;
			StartCordinats2.x = Drag2.x;
			StartCordinats2.y = Drag2.y;
			
			Drag.addEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
			Drag.addEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
			Drag1.addEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler1)
			Drag1.addEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
			Drag2.addEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler2)
			Drag2.addEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
			fordispach = false;
			fordispach1 = false;
			fordispach2 = false;
		
		}
		
		private function StopDragHandler(e:MouseEvent):void
		{
			
			if (Drag.hitTestObject(Hit))
			{
				Drag.visible = false;
				Drag.x = StartCordinats.x;
				Drag.y = StartCordinats.y;
				Drag.stopDrag();
				Drag.mouseEnabled = false;
				fordispach = true;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "showeb"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "gamo"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "mo"));
				
			}
			else
			{
				Drag.x = StartCordinats.x;
				Drag.y = StartCordinats.y;
				Drag.stopDrag();
			}
			if (Drag1.hitTestObject(Hit))
			{
				Drag1.visible = false;
				Drag1.x = StartCordinats1.x;
				Drag1.y = StartCordinats1.y;
				Drag1.stopDrag();
				Drag1.mouseEnabled = false;
				fordispach1 = true;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "gaul"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ur"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "eb"));			
			}
			else
			{
				Drag1.x = StartCordinats1.x;
				Drag1.y = StartCordinats1.y;
				Drag1.stopDrag();
			}
			if (Drag2.hitTestObject(Hit))
			{
				Drag2.visible = false;
				Drag2.x = StartCordinats2.x;
				Drag2.y = StartCordinats2.y;
				Drag2.stopDrag();
				Drag2.mouseEnabled = false;
				fordispach2 = true;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "i"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "a"));
				
			}
			else
			{
				Drag2.x = StartCordinats2.x;
				Drag2.y = StartCordinats2.y;
				Drag2.stopDrag();
			}
			if (fordispach && fordispach1 && fordispach2) 
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ShecvaleTexti"));
			}
		}
		
		private function StartDragHandler(e:MouseEvent):void
		{
			Drag.startDrag();
			StartCordinats.x = Drag.x;
			StartCordinats.y = Drag.y;
		}
		
		private function StartDragHandler1(e:MouseEvent):void
		{
			
			Drag1.startDrag();
			StartCordinats1.x = Drag1.x;
			StartCordinats1.y = Drag1.y;
		
		}		
		private function StartDragHandler2(e:MouseEvent):void
		{
			
			Drag2.startDrag();
			StartCordinats2.x = Drag2.x;
			StartCordinats2.y = Drag2.y;
		
		}
		
		private function destroy():void
		{
			
			Drag.removeEventListener(MouseEvent.MOUSE_DOWN, StartDragHandler)
			Drag.removeEventListener(MouseEvent.MOUSE_UP, StopDragHandler)
		}
	
	}

}
