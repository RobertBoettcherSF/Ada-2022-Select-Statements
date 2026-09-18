pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Server;

procedure Tests is
   W : Server.Worker;
   N : Natural;
   Ok : Boolean;
begin
   Ok := Server.Try_Ping (W, 1.0);
   Assert (Ok);
   Ok := Server.Try_Ping (W, 1.0);
   Assert (Ok);
   W.Get_Pings (N);
   Assert (N = 2);
   Put_Line ("PASS selective accept Ping / Get_Pings");

   --  Timed entry call form already exercised by Try_Ping.
   Put_Line ("PASS timed entry call (select/delay)");

   W.Shutdown;
   Put_Line ("PASS Shutdown accept");

   Put_Line ("All Select Statements topic tests passed.");
end Tests;
