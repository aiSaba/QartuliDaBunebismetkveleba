package  {
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.DataEvent;
	import com.greensock.*;
	import com.greensock.TimelineMax;
	
	
	public class Line extends MovieClip
	{
		private var first:Object;
		private var second:Object;
		private var all:MovieClip;
		
		public function Line(all:MovieClip, first:Object, second:Object)
		{
			this.all = all;
			this.first = first;
			this.second = second;
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			twoPointsJoin();
		}
		
		private function twoPointsJoin():void
		{
			//second.removeEventListener(MouseEvent.MOUSE_DOWN,lineFunc )
			//TweenMax.killTweensOf(second);
			var canvas:Shape = new Shape();
			canvas.graphics.lineStyle(2, 0x2D3258);
			second.scaleX = 1;
			second.scaleY = 1;
			canvas.graphics.moveTo(first.x,first.y);
			canvas.graphics.lineTo(second.x, second.y);
			all.addChildAt(canvas, 0);
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Clicked"));
		}
	}
	
}
