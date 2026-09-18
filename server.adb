pragma Ada_2022;

package body Server is

   task body Worker is
      Pings : Natural := 0;
      Done  : Boolean := False;
   begin
      while not Done loop
         select
            accept Ping do
               Pings := Pings + 1;
            end Ping;
         or
            accept Get_Pings (Count : out Natural) do
               Count := Pings;
            end Get_Pings;
         or
            accept Shutdown do
               Done := True;
            end Shutdown;
         or
            delay 0.05;
            --  idle tick; keeps the loop responsive without busy-waiting forever
            null;
         end select;
      end loop;
   end Worker;

   function Try_Ping (W : in out Worker; Wait : Duration) return Boolean is
   begin
      select
         W.Ping;
         return True;
      or
         delay Wait;
         return False;
      end select;
   end Try_Ping;

end Server;
