package  {
	import flash.display.MovieClip;
	import com.greensock.*; 
	import com.greensock.easing.*;
	
	public class box_mc extends MovieClip {

		private var curRow:uint;
		private var curCol:uint;
		public function box_mc(type:uint,row:uint,col:uint) {
			curRow = row;
			curCol = col;
			x=curCol*76;
			y=curRow*76;
			name=curRow+"_"+curCol;
			if(type & Main.TARGET)
				gotoAndStop(1);
			else
				gotoAndStop(5);
		}

		private function setframePosition(row:int,col:int,type:uint) {
			var extra:int = (type & Main.TARGET) ? 0 : 4 ;
			var frame:int = 0;
			if(row == -1) frame = 1; // up
			if(row ==  1) frame = 3; //right
			if(col ==  1) frame = 2; //right
			if(col == -1) frame = 4; //left
			gotoAndStop(frame + extra);
		}
		public function move(type:uint,row:int,col:int):void {
			curRow+=row;
			curCol+=col;
			name=curRow+"_"+curCol;
			setframePosition(row,col,type);
			TweenMax.to(this, Main.MOVE_DURATION, {y:curRow*76,x:curCol*76, ease:Linear.easeIn});
		}
 

	}
}
