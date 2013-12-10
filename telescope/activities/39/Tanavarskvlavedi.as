package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Tanavarskvlavedi extends MovieClip 
	{
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var all:MovieClip;
		
		
		
		public function Tanavarskvlavedi(_stageWidth:Number=1024, _stageHeight:Number=768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			initObjects();
		}
		
		private function initObjects():void
		{
			all = new All();
			
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			
			all.height = _stageHeight / 1.2;
			all.scaleX = all.scaleY;
			
			all.first_n.visible = true;
			all.second_n.visible = false;
			
			all.first.buttonMode = true;
			all.second.buttonMode = true;
			all.next.buttonMode = true;
			addChild(all);
			
			all.first.addEventListener(MouseEvent.MOUSE_DOWN, firstFunc);
			all.second.addEventListener(MouseEvent.MOUSE_DOWN, SecondFunc);
			all.next.addEventListener(MouseEvent.MOUSE_DOWN, nextFunc);
		}
		
		private function nextFunc(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		}
		
		private function firstFunc(e:MouseEvent):void 
		{
			all.first_n.visible = true;
			all.second_n.visible = false;
		}
		
		private function SecondFunc(e:MouseEvent):void 
		{
			all.first_n.visible = false;
			all.second_n.x = all.first_n.x;
			all.second_n.y = all.first_n.y;
			//all.second_n.scaleX = all.first_n.scaleX;
			//all.second_n.scaleY = all.first_n.scaleY;
			all.second_n.visible = true;
		}
	
		private function destroy():void
		{
			all.first_n.removeEventListener(MouseEvent.MOUSE_DOWN, firstFunc);
			all.second_n.removeEventListener(MouseEvent.MOUSE_DOWN, SecondFunc);
			all.next.removeEventListener(MouseEvent.MOUSE_DOWN, nextFunc);
			removeChild(all);
			all = null;
	
		} //end destroy
		
	}
	
}
