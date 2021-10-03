package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1562:int = 0;
      
      public static const const_1444:int = 1;
      
      public static const const_1430:int = 2;
      
      public static const const_1590:int = 3;
      
      public static const const_1737:int = 4;
      
      public static const const_1578:int = 5;
      
      public static const const_1366:int = 10;
      
      public static const const_1731:int = 11;
      
      public static const const_1601:int = 12;
      
      public static const const_1744:int = 13;
      
      public static const const_1733:int = 16;
      
      public static const const_1621:int = 17;
      
      public static const const_1753:int = 18;
      
      public static const const_1729:int = 19;
      
      public static const const_1691:int = 20;
      
      public static const const_1722:int = 22;
      
      public static const const_1715:int = 23;
      
      public static const const_1543:int = 24;
      
      public static const const_1608:int = 25;
      
      public static const const_1741:int = 26;
      
      public static const const_1606:int = 27;
      
      public static const const_1573:int = 28;
      
      public static const const_1583:int = 29;
      
      public static const const_1549:int = 100;
      
      public static const const_1748:int = 101;
      
      public static const const_1738:int = 102;
      
      public static const const_1566:int = 103;
      
      public static const const_1607:int = 104;
      
      public static const const_1582:int = 105;
      
      public static const const_1575:int = 106;
      
      public static const const_1680:int = 107;
      
      public static const const_1728:int = 108;
      
      public static const const_1637:int = 109;
      
      public static const const_1551:int = 110;
      
      public static const const_1659:int = 111;
      
      public static const const_1734:int = 112;
      
      public static const const_1752:int = 113;
      
      public static const const_1742:int = 114;
      
      public static const const_1651:int = 115;
      
      public static const const_1596:int = 116;
      
      public static const const_1756:int = 117;
      
      public static const const_1647:int = 118;
      
      public static const const_1664:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1444:
            case const_1366:
               return "banned";
            case const_1430:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
