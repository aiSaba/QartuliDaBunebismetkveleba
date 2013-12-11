package
{
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class Controller extends MovieClip
	{
		private var swlLoader:Loader;
		private var swlLoaderURLRequest:URLRequest;
		private var loadedContent:MovieClip;
		
		//stage h and w
		private var stageH:Number;
		private var stageW:Number;
		
		public function Controller(stageH:Number, stageW:Number)
		{
			this.stageH = stageH;
			this.stageW = stageW;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			loadSwf();
		}
		private function loadSwf():void
		{
			swlLoader = new Loader();
			swlLoaderURLRequest = new URLRequest("Untitled-1.swf");
			swlLoader.load(swlLoaderURLRequest);
			
			swlLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			swlLoader.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, errorHandler);
		}
		
		private function errorHandler(e:Event):void 
		{
			trace("Loading Error");
		}
		
		private function onCompleteHandler(e:Event):void 
		{
			
			loadedContent = swlLoader.content as MovieClip;

			//loadedContent.x = stageW / 2;
			//loadedContent.y = stageH / 2;
			
			//loadedContent.width = stageW;
			//loadedContent.scaleX = loadedContent.scaleY;
			
			addChild(loadedContent);
			
			trace("swf loaded");
		
		}
	}

}
