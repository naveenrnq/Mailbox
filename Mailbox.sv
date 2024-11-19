// Mailbol for sending data between the classes

class generator;

 int data = 12;
 mailbox mbx;

  task run();
    mbx.put(data); // Inside put we can send single data member as well as transaction class
    $display("[GEN] : SENT DATA: %0d", data);
  endtask

endclass


class driver;

  int datac = 0; // first we need to define data container that will be receiving our data It should be of the same type as it was previously defined
  
 mailbox mbx; // again define the same mailbox

  task run(); 
    mbx.get(datac);
    $display("[DRV]: RCVD Data : %0d", datac);
  endtask

endclass

// We have not defines that mbx of these two classes are of common mailbox.


// We have to define that in tb top

// Since it is a parameterized class so we need to add constructor to it


module tb;

  generator gen;
  driver drv;

  mailbox mbx;

 initial begin
   gen = new();
   drv = new();
   mbx = new();

   // Define common passage of mailboxes
   gen.mbx = mbx;
   drv.mbx = mbx;


   gen.run();
   drv.run();
 end 





endmodule
