package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1007:Boolean;
      
      private var var_2005:int;
      
      private var var_2009:String;
      
      private var var_320:int;
      
      private var var_2010:int;
      
      private var var_2008:String;
      
      private var var_2006:String;
      
      private var var_2007:String;
      
      private var var_741:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_741 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1007 = false;
            return;
         }
         this.var_1007 = true;
         this.var_2005 = int(_loc2_);
         this.var_2009 = param1.readString();
         this.var_320 = int(param1.readString());
         this.var_2010 = param1.readInteger();
         this.var_2008 = param1.readString();
         this.var_2006 = param1.readString();
         this.var_2007 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_741.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_741 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2005;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2009;
      }
      
      public function get flatId() : int
      {
         return this.var_320;
      }
      
      public function get eventType() : int
      {
         return this.var_2010;
      }
      
      public function get eventName() : String
      {
         return this.var_2008;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2006;
      }
      
      public function get creationTime() : String
      {
         return this.var_2007;
      }
      
      public function get tags() : Array
      {
         return this.var_741;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1007;
      }
   }
}
