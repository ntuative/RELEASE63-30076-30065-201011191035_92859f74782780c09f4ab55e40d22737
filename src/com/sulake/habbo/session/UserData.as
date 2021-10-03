package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_806:String = "";
      
      private var var_574:String = "";
      
      private var var_1998:String = "";
      
      private var var_1999:int;
      
      private var var_1997:int = 0;
      
      private var var_1994:String = "";
      
      private var var_1996:int = 0;
      
      private var var_1995:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_1999;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_1999 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_806;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_806 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_574;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_574 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_1998;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_1998 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_1997;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_1997 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_1994;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_1994 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_1996;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_1996 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_1995;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_1995 = param1;
      }
   }
}
