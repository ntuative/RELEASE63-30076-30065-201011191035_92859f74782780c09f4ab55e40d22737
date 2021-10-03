package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2130:String;
      
      private var var_1922:int;
      
      private var var_1912:int;
      
      private var var_2118:String;
      
      private var var_2242:int;
      
      private var var_1739:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2130 = param1.readString();
         this.var_1922 = param1.readInteger();
         this.var_1912 = param1.readInteger();
         this.var_2118 = param1.readString();
         this.var_2242 = param1.readInteger();
         this.var_1739 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2130;
      }
      
      public function get unitPort() : int
      {
         return this.var_1922;
      }
      
      public function get worldId() : int
      {
         return this.var_1912;
      }
      
      public function get castLibs() : String
      {
         return this.var_2118;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2242;
      }
      
      public function get nodeId() : int
      {
         return this.var_1739;
      }
   }
}
