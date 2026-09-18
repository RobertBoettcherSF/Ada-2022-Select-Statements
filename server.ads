--  Ada 2022 topic: selective accept (select / or / else / delay).
pragma Ada_2022;

package Server is

   task type Worker is
      entry Ping;
      entry Get_Pings (Count : out Natural);
      entry Shutdown;
   end Worker;

   --  Call Ping if the worker accepts quickly; otherwise return False.
   function Try_Ping (W : in out Worker; Wait : Duration) return Boolean;

end Server;
