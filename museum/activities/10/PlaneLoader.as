package 
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
   
	import flash.net.URLRequest;
	
	
	public class PlaneLoader extends Sprite
	{
		private var loader:Loader;
		private var plane:String;
		private var loadedContent:MovieClip;
		private var loaderURLRequest:URLRequest;
	
		public function PlaneLoader(plane:String)
		{
			this.plane = plane;

			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			if (loader)
			{
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaderHandler);
				loader = null;
			}
			if (loaderURLRequest)
			{
				loaderURLRequest = null;
			}
			if (loadedContent)
			{
				loadedContent.cacheAsBitmap = false;
				removeChild(loadedContent);
				loadedContent = null;
			}
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			loader = new Loader();
			loaderURLRequest=new URLRequest(plane)
			loader.load(loaderURLRequest);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderHandler);
			
		}
		
		private function loaderHandler(e:Event):void 
		{
			loadedContent = loader.content as MovieClip;
			loadedContent.cacheAsBitmap = true;
			addChild(loadedContent);
		}
		
		
	}
	
}