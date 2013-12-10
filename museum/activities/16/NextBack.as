package
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.DataEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TransformGestureEvent;
	import flash.utils.setTimeout;
	import com.greensock.*
	import com.greensock.easing.*
	
	public class NextBack extends MovieClip
	{
		
		//scenes
		private var satauriClass:Class;
		private var museumiClass:Class;
		private var telefoniClass:Class;
		private var saatiClass:Class;
		private var durbindiClass:Class;
		private var tvitmfrinavi1Class:Class;
		private var tvitmfrinavi2Class:Class;
		private var tvitmfrinavi3Class:Class;
		private var tvitmfrinavi4Class:Class;
		private var museumi2Class:Class;
		private var museumi3Class:Class;
		private var dasasruliClass:Class;
		////////
		private var staage:Stage;
		private var bgForCoordinates:MovieClip;
		//
		private var next:Next;
		private var back:Back;
		private var sceneArray:Array;
		private var currentIndex:int;
		private var axlaRaScenacaa:MovieClip;
		private var isNextBack:String;
		private var isScenePlaying:Boolean;
		/////
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function NextBack(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (next)
			{
				next.removeEventListener(MouseEvent.MOUSE_DOWN, funcNext);
				removeChild(next);
				next = null;
			}
			if (back)
			{
				back.removeEventListener(MouseEvent.MOUSE_DOWN, funcBack);
				removeChild(back);
				back = null;
			}
			if (axlaRaScenacaa)
			{
				axlaRaScenacaa.removeEventListener(DataEvent.DATA, dataEventListener);
				removeChild(axlaRaScenacaa);
				axlaRaScenacaa = null;
			}
		
		}
		
		private function init(event:Event):void
		{
			isScenePlaying = false;
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initObjects();
		}
		
		private function initObjects():void
		{
			//removeChild(zgarbiObjects);
			isNextBack = "next";
			currentIndex = -1;
			//Multitouch.inputMode = MultitouchInputMode.GESTURE;
			
			satauriClass = SatauriClass;
			museumiClass = MuseumiClass;
			telefoniClass = TelefoniClass;
			saatiClass = SaatiClass;
			durbindiClass = DurbindiClass;
			tvitmfrinavi1Class = Tvitmfrinavi1Class;
			tvitmfrinavi2Class = Tvitmfrinavi2Class;
			tvitmfrinavi3Class = Tvitmfrinavi3Class;
			tvitmfrinavi4Class = Tvitmfrinavi4Class;
			museumi2Class = Museumi2Class;
			museumi3Class = Museumi3Class;;
			dasasruliClass = DasasruliClass;
			
			sceneArray = new Array(satauriClass, museumiClass, telefoniClass, saatiClass, durbindiClass, tvitmfrinavi1Class, tvitmfrinavi2Class, tvitmfrinavi3Class, tvitmfrinavi4Class, museumi2Class, museumi3Class, dasasruliClass);
			//Main.button.visible = true;
			//////////////////////
			//next and back
			
			next = new Next();
			
			next.x = _stageWidth - next.width;
			next.y = _stageHeight - next.width;
			
			next.height = _stageHeight / 14;
			next.scaleX = next.scaleY;
			addChild(next);
			
			back = new Back();
			
			back.x = back.width;
			back.y = next.y;
			
			back.height = _stageHeight / 14;
			back.scaleX = next.scaleY;
			
			addChild(back);
			back.visible = false;
			
			next.visible = false;
			
			//Main._stage.addEventListener(TransformGestureEvent.GESTURE_SWIPE, swipe);
			next.addEventListener(MouseEvent.MOUSE_DOWN, funcNext);
			back.addEventListener(MouseEvent.MOUSE_DOWN, funcBack);
			
			callScene();
		}
		
		private function dataEventListener(e:DataEvent):void
		{
			
			if (e.data == "movrchi scenas")
			{
				if (currentIndex != sceneArray.length - 1)
				{
					next.visible = true;
				}
				if (currentIndex != 0)
				{
					back.visible = true;
				}
			}
		}
		
		private function callScene():void
		{
			
			if (isNextBack == "next")
			{
				currentIndex++;
				
			}
			if (isNextBack == "back")
			{
				currentIndex--;
				
			}
			
			if (currentIndex > sceneArray.length - 1)
			{
				currentIndex = sceneArray.length;
				next.visible = false;
			}
			if (currentIndex > 0)
			{
				back.visible = true;
			}
			if (currentIndex < 0)
			{
				currentIndex = 0;
			}
			
			var tempClass:Class = sceneArray[currentIndex];
			axlaRaScenacaa = new tempClass(_stageHeight, _stageWidth) as MovieClip;
			axlaRaScenacaa.addEventListener(DataEvent.DATA, dataEventListener);
			
			addChild(axlaRaScenacaa);
			axlaRaScenacaa.parent.setChildIndex(axlaRaScenacaa, 0);
			if (currentIndex == sceneArray.length - 1)
			{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"));
			}
		}
		
		private function funcNext(event:MouseEvent):void
		{
			isNextBack = "next";
			try
			{
				axlaRaScenacaa.gasvla();
				callScene();
			}
			catch (e:Error)
			{
				callScene();
			}
			
			next.visible = false;
			back.visible = false;
		
		}
		
		private function funcBack(event:MouseEvent):void
		{
			
			isNextBack = "back";
			try
			{
				axlaRaScenacaa.gasvla();
				callScene();
				
			}
			catch (e:Error)
			{
				callScene();
			}
			
			next.visible = false;
			back.visible = false;
		
		}
	
		//swipe
	/*private function swipe(event:TransformGestureEvent):void
	   {
	   //next
	   if (event.offsetX == -1)
	   {
	   try
	   {
	   axlaRaScenacaa.gasvla();
	   callScene();
	   }
	   catch (e:Error)
	   {
	
	   callScene();
	   }
	
	   isNextBack = "next";
	   next.visible = false;
	   back.visible = false;
	   }
	
	   //back
	   if (event.offsetX == 1)
	   {
	   isNextBack = "back";
	   try
	   {
	   axlaRaScenacaa.gasvla();
	   callScene();
	   }
	   catch(e:Error)
	   {
	   callScene();
	   }
	
	   next.visible = false;
	   back.visible = false;
	 }*/
	
	}

}

