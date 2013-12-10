 

package  {

	import flash.display.MovieClip; 
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.*;
import flash.events.TimerEvent;



	public class shadowExam extends ResponsiveScene {
		
		private var m_activeShadow:int = -1;
		private var m_oldShadow:int;
		private var m_shadows:Array;
		private var m_things:Array;
		private var m_win:Boolean;
		private var tryCounter:int;

		

		public function shadowExam(){
			m_scene = zgarbi;
			tryCounter = 0;
		}
		
		override public function onReady():void {
			stop();
			var zgarbiSound:Sound = new Sound(new URLRequest("sounds/29.mp3")); 
			zgarbiSound.play();
			
			resizeHandler(null);
			setTimeout(onReady2, 2800);
		}
		
		 public function onReady2():void {
			 dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			  nextFrame();
			 m_scene = scene;
			resizeHandler(null);
			 trace("onReady");
			 
			setThings();
			setShadows();
			restart();
			  
			// m_scene.prev.addEventListener(MouseEvent.CLICK, onPrevNextClickListener)
			// m_scene.next.addEventListener(MouseEvent.CLICK, onPrevNextClickListener)
		}
		  
		function randRange(min:Number, max:Number):Number {
		    var randomNum:Number = Math.floor(Math.random() * (max - min)) + min;
		    return randomNum;
		}

		private function restart():void {
			
			tryCounter++;
			if (tryCounter == 8)
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
				return
			}
			
			m_win = false;
			m_oldShadow = m_activeShadow;
			do{
				m_activeShadow = randRange(0,m_things.length);
			}while(m_oldShadow == m_activeShadow)
			for( var i = 0; i < m_shadows.length; i++ ){
				m_shadows[i].alpha = (i==m_activeShadow)?true:false;
				m_things[i].filters = [];
				m_things[i].addEventListener(MouseEvent.CLICK, onThingClickListener)
			}
		}
		private function playSound(value:Boolean):void
		{
			var soundStrin:String = (value)?"correct.mp3":"error.mp3";
			var sound:Sound = new Sound(new URLRequest("sounds/"+soundStrin)); 
			sound.play();
		}
		private function setThings():void{
			m_things = [m_scene.human,
						m_scene.house,
						m_scene.dog,
						m_scene.tree,
						m_scene.cat,
						m_scene.chair];
		}
		private function setShadows():void{
			m_shadows = [m_scene.humanShadow,
						m_scene.houseShadow,
						m_scene.dogShadow,
						m_scene.treeShadow,
						m_scene.catShadow,
						m_scene.chairShadow];
		}


		private function onThingClickListener(event:Event):void {
			if(m_win) return;
			var n:int;
			trace(event.currentTarget.name);
			switch( event.currentTarget.name ){
				case "human": 	n = 0; break;
				case "house": 	n = 1; break;
				case "dog": 	n = 2; break;
				case "tree": 	n = 3; break;
				case "cat": 	n = 4; break;
				case "chair": 	n = 5; break;
			}

			if( n == m_activeShadow ){
				m_win = true;
				playSound(true);
				var dropShadow:DropShadowFilter = new DropShadowFilter(0, 0, 0x00FF00, 1, 10, 10, 2, 2, false, false, false);
				m_things[n].filters = [dropShadow];
				setTimeout(restart, 2000);
				
			}else {
				playSound(false)
				var dropShadow:DropShadowFilter = new DropShadowFilter(0, 0, 0xff0000, 1, 10, 10, 2, 2, false, false, false);
				m_things[n].filters = [dropShadow];
				
				
			}

		}

	}
	
}
