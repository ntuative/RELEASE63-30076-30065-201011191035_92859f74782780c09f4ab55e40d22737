package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1987:int;
      
      private var var_1984:int;
      
      private var var_1988:String;
      
      private var var_1985:int;
      
      private var var_1986:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_1987 = param1;
         this.var_1984 = param2;
         this.var_1988 = param3;
         this.var_1985 = param4;
         this.var_1986 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1987,this.var_1984,this.var_1988,this.var_1985,int(this.var_1986)];
      }
      
      public function dispose() : void
      {
      }
   }
}
