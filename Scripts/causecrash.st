"Demonstrate a coredump!!"

[|

main
  Transcript showLine:'This script does not retain self, but registers it as a target for an NSButton.'.
  Transcript showLine:'It will cause a crash when the button is pressed!'.
  
  but1 setTarget:self.
  but1 setAction:#down:.
  ^self
!

down1:sender
  "Method that receives a message from But1"
  Transcript showLine:'user pressed But1'.
  ^self

]

