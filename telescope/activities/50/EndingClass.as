package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class EndingClass extends MovieClip
	{
		/////classes
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
		////////////////////////////////
		//buttons
		private var next:MovieClip;
		private var back:MovieClip;
		//
		private var bgForCoordinates:MovieClip;
		///
		private var sceneArray:Array;
		private var currentIndex:int;
		private var axlaRaScenacaa:MovieClip;
		private var isNextBack:String;
		
		public function EndingClass()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (bgForCoordinates)
			{
				removeChild(bgForCoordinates);
				bgForCoordinates = null;
			}
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addNextBack();
		}
		
		private function addNextBack():void
		{
			////////////////////
			bgForCoordinates = new BgForCoordinates();
			
			bgForCoordinates.x = Main._stage.stageWidth / 2;
			bgForCoordinates.y = Main._stage.stageHeight / 1.33
			
			bgForCoordinates.height = Main._stage.stageHeight / 3;
			bgForCoordinates.scaleX = bgForCoordinates.scaleY;
			
			addChild(bgForCoordinates);
			bgForCoordinates.alpha = 0;
			//bgForCoordinates.alpha = 0;
			//////////////////////
			//next and back
			next = new Next();
			
			next.x = bgForCoordinates.x + bgForCoordinates.width / 2 + next.width / 2;
			next.y = bgForCoordinates.y;
			
			next.height = Main._stage.stageHeight / 14;
			next.scaleX = next.scaleY;
			
			addChild(next);
			
			back = new Back();
			
			back.x = bgForCoordinates.x - bgForCoordinates.width / 2 - back.width / 2;
			back.y = bgForCoordinates.y;
			
			back.height = Main._stage.stageHeight / 14;
			back.scaleX = next.scaleY;
			
			addChild(back);
			///////////////
			next.addEventListener(MouseEvent.MOUSE_DOWN, funcNext);
			back.addEventListener(MouseEvent.MOUSE_DOWN, funcBack);
			
			initializeSceneArray();
		}
		
		private function initializeSceneArray():void
		{
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
			museumi3Class = Museumi3Class
			dasasruliClass = DasasruliClass;
			
			sceneArray = new Array(satauriClass, museumiClass, telefoniClass, saatiClass, durbindiClass, tvitmfrinavi1Class, tvitmfrinavi2Class, tvitmfrinavi3Class, tvitmfrinavi4Class,
			museumi2Class, museumi3Class, dasasruliClass);
			
			callScene();
		}
	}

}
