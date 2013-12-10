package  {

	import com.greensock.TweenMax;
	import flash.display.MovieClip;
    import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.*;
	import flash.events.TimerEvent;
	
	public class Main extends ResponsiveScene {

		public static const TILE:uint 		= 1; 	//00000001
		public static const PLANT1:uint 	= 2; 	//00000010
						//PLANT1 + TILE 	= 3 	//00000011
		public static const PLANT2:uint 	= 4; 	//00000100
						//PLANT2 + TILE 	= 5 	//00000101
		public static const TARGET:uint 	= 8; 	//00001000
		public static const BOX:uint 		= 16;	//00010000
						//BOX + TILE 		= 17 	//00010001
						//BOX + TARGET  	= 24 	//00011000
		public static const PLAYER:uint 	= 32;	//00100000
						//PLAYER + TILE 	= 33 	//00100001
						//PLAYER + TARGET  	= 40 	//00101000
		public static const MOVE_DURATION:Number = 0.2;
		public  var levels:Array=new Array();;
		private var currentLevel:uint=1;
		private var floor_container:Sprite;
		private var level_container:Sprite;
		private var player:player_mc;
		private var blockUI:Boolean;

		public function Main(){
			m_scene = zgarbi;
		}


		override public function onReady():void {
			stop();
			var zgarbiSound:Sound = new Sound(new URLRequest("sounds/14.mp3")); 
			zgarbiSound.play();
			
			resizeHandler(null);
			setTimeout(onReady2, 7000);
		}
		
		 public function onReady2():void {
			dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleTrue"));
			nextFrame();
			m_scene = scene;
			resizeHandler(null);
			setupLevels();
			drawLevel(currentLevel);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			m_scene.arrow_left.addEventListener(MouseEvent.CLICK,buttonClick);
			m_scene.arrow_up.addEventListener(MouseEvent.CLICK,buttonClick);
			m_scene.arrow_right.addEventListener(MouseEvent.CLICK,buttonClick);
			m_scene.arrow_down.addEventListener(MouseEvent.CLICK,buttonClick);
			m_scene.restart.addEventListener(MouseEvent.CLICK,buttonClick);
		}
	
		private function buttonClick(event:Event):void {
			if(blockUI) return;
			switch (event.currentTarget.name) {
				case "arrow_left": 	player.moveBy(currentLevel, 0,-1); break;
				case "arrow_up": 	player.moveBy(currentLevel,-1, 0); break;
				case "arrow_right": player.moveBy(currentLevel, 0, 1); break;
				case "arrow_down": 	player.moveBy(currentLevel, 1, 0); break;
				case "restart": 	restartLevel(currentLevel); break;
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void {
			if(blockUI) return;
			switch (e.keyCode) {
				case 65 : case 37 ://left
					player.moveBy(currentLevel,0,-1);
				break;
				case 87 : case 38 :// up
					player.moveBy(currentLevel,-1,0);
				break;
				case 68 : case 39 ://right
					player.moveBy(currentLevel,0,1);
				break;
				case 83 : case 40 ://down
					player.moveBy(currentLevel,1,0);
				break;
				case 82 ://r
					restartLevel(currentLevel);
				break;
			}
		}

		public function restartLevel(level:uint):void{
			currentLevel = level;
			m_scene.removeChild(floor_container);
			m_scene.removeChild(level_container);
			setupLevels(); 	
			drawLevel(currentLevel);
		}

		private function setupLevels():void {

			blockUI = false;
			levels[0]=new Array();
			levels[0][0]=[0,5,3,3,5,3,5,3,5,0];
			levels[0][1]=[0,3,1,17,1,1,1,1,3,0];
			levels[0][2]=[0,5,1,1,1,17,17,1,5,0];
			levels[0][3]=[0,3,1,1,1,8,1,1,3,0];
			levels[0][4]=[0,5,5,1,1,8,1,5,3,0];
			levels[0][5]=[0,0,3,1,1,8,1,5,0,0];
			levels[0][6]=[0,0,5,5,3,1,33,5,0,0];
			levels[0][7]=[0,0,0,0,5,5,5,5,0,0];

			levels[1]=new Array();
			levels[1][0]=[5,5,5,5,5,5,5,5,5,5];
			levels[1][1]=[3,1,1,1,1,1,1,1,1,3];
			levels[1][2]=[5,1,5,3,3,1,1,8,1,5];
			levels[1][3]=[3,1,1,17,1,17,1,24,1,5];
			levels[1][4]=[3,1,1,33,17,1,17,8,1,5];
			levels[1][5]=[3,1,3,1,3,3,8,8,1,5];
			levels[1][6]=[3,1,1,1,1,1,1,1,1,3];
			levels[1][7]=[5,3,3,3,5,5,3,3,3,5];

			levels[2]=new Array();
			levels[2][0]=[0,0,0,0,0,0,0,0,0,0];
			levels[2][1]=[0,3,5,3,5,0,0,0,0,0];
			levels[2][2]=[0,5,1,1,3,3,5,3,3,5];
			levels[2][3]=[0,3,1,8,1,1,17,1,1,5];
			levels[2][4]=[0,5,1,17,1,1,8,33,1,5];
			levels[2][5]=[0,3,3,5,1,1,3,3,5,0];
			levels[2][6]=[0,0,0,3,5,3,5,0,0,0];
			levels[2][7]=[0,0,0,0,0,0,0,0,0,0];
		}
		private function drawLevel(level:uint):void {
			floor_container = new Sprite();
			floor_container.x = m_scene.board.x+5;
			floor_container.y = m_scene.board.y+5;
			m_scene.addChild(floor_container);

			level_container = new Sprite();
			level_container.x = m_scene.board.x+5;
			level_container.y = m_scene.board.y+5;
			m_scene.addChild(level_container);

			for (var i:uint=0; i<levels[level].length; i++) {
				for (var j:uint=0; j<levels[level][i].length; j++) {
					var type:uint = levels[level][i][j];
					if( type == 0 ){
						//araferi
					}
					if(type & TILE){
						var tile:tiles_mc = new tiles_mc(TILE,i,j);
						floor_container.addChild(tile);
					}
					if(type & PLANT1){
						var tile:tiles_mc = new tiles_mc(PLANT1,i,j);
						floor_container.addChild(tile);
					}
					if(type & PLANT2){
						var tile:tiles_mc = new tiles_mc(PLANT2,i,j);
						floor_container.addChild(tile);
					}
					if(type & TARGET){
						var tile:tiles_mc = new tiles_mc(TARGET,i,j);
						floor_container.addChild(tile);
					}
					if(type & PLAYER){
						player = new player_mc(this,i,j);
						level_container.addChild(player);
					}
					if(type & BOX){
						var box:box_mc = new box_mc(type,i,j);
						level_container.addChild(box);
					}
				}
			}
		}


		public function movePlayer( curRow:int,curCol:int,row:int,col:int ):void{
			levels[currentLevel][curRow+row][curCol+col]^=PLAYER;
			levels[currentLevel][curRow][curCol]^=PLAYER;
		}

		public function moveBox( curRow:uint,curCol:uint,row:int,col:int ):void{
			// trace("box");
			var box:box_mc = level_container.getChildByName(curRow+"_"+curCol) as box_mc;
			// trace(box);
			levels[currentLevel][curRow+row][curCol+col]^=BOX;
			levels[currentLevel][curRow][curCol]^=BOX;
			box.move(levels[currentLevel][curRow+row][curCol+col],row,col);
		}

		public function isBox(row:uint,column:uint):Boolean {
			var type:uint=levels[currentLevel][row][column];
			// trace("type"+type);
			// trace("BOX"+BOX);
			// trace("type & BOX"+(type & BOX));
			return type & BOX;
		}

		public function isWalkable(row:uint,column:uint):Boolean {
			if( row >= levels[currentLevel].length || row<0 ||
				column >= levels[currentLevel][0].length || column<0)
			return false;

			var type:uint=levels[currentLevel][row][column];
			return type == TARGET || type == TILE;
		}
		public function checkSolved():void {
			var s:String=levels[currentLevel].toString();
			if(s.indexOf("17")!=-1||s.indexOf("8")!=-1) return;

			blockUI = true;
			if ( currentLevel + 1 == levels.length )
			{
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
				return trace("GAME OVER");
			}
			setTimeout(restartLevel, 1000,currentLevel+1);
		}
	}//END Main
}
