package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_2554:Number = 0;
      
      private var var_2552:Number = 0;
      
      private var var_2553:Number = 0;
      
      private var var_2550:Number = 0;
      
      private var var_246:int = 0;
      
      private var var_2252:int = 0;
      
      private var var_281:Array;
      
      private var var_2551:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_281 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_155 = param3;
         this.var_156 = param4;
         this.var_2554 = param5;
         this.var_246 = param6;
         this.var_2252 = param7;
         this.var_2552 = param8;
         this.var_2553 = param9;
         this.var_2550 = param10;
         this.var_2551 = param11;
         this.var_281 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_155;
      }
      
      public function get z() : Number
      {
         return this.var_156;
      }
      
      public function get localZ() : Number
      {
         return this.var_2554;
      }
      
      public function get targetX() : Number
      {
         return this.var_2552;
      }
      
      public function get targetY() : Number
      {
         return this.var_2553;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2550;
      }
      
      public function get dir() : int
      {
         return this.var_246;
      }
      
      public function get dirHead() : int
      {
         return this.var_2252;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2551;
      }
      
      public function get actions() : Array
      {
         return this.var_281.slice();
      }
   }
}
