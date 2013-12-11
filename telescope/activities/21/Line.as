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
		private var first:MovieClip;
		private var second:MovieClip;
		private var all:MovieClip;

		
		public function Line(all:MovieClip, first:MovieClip, second:MovieClip)
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
			second.parent.setChildIndex(second, second.parent.numChildren - 1);
			TweenMax.to(second, .3, {startAt:{alpha:0.7,scaleX:2.2,scaleY:2.2}, alpha:1,scaleX:2.6,scaleY:2.6, repeat:9999});
			second.addEventListener(MouseEvent.MOUSE_DOWN, lineFunc)
		}
		
		private function lineFunc(ev:MouseEvent):void
		{
			TweenMax.killChildTweensOf(second);
			second.alpha = 1;
			second.scaleX = 1;
			second.scaleY = 1;
			second.removeEventListener(MouseEvent.MOUSE_DOWN,lineFunc )
			TweenMax.killTweensOf(second);
			var canvas:Shape = new Shape();
			canvas.graphics.lineStyle(2, 0xDE9C24);
			second.scaleX = 1;
			second.scaleY = 1;
			canvas.graphics.moveTo(first.x,first.y);
			canvas.graphics.lineTo(second.x, second.y);
			all.addChild(canvas);
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "Clicked"));
		}
	}
	
}
