
[| :global

main
  | local |

  "NOTE: targets are not retained, and we need the scriptObject to be."
  self retain.

  but1 setTarget:self.
  but1 setAction:#doAction:.

  but2 setTarget:self.
  but2 setAction:#doAction:.

  ok := self respondsToSelector:#doAction:.
  Transcript showLine:('ok', ok description).

  Transcript showLine:('target', but1 target description).
  Transcript showLine:('action', but1 action description).

  self doAction:self.
  ^self
!

doAction:sender

  sender == but1
    ifTrue: [
      text1 setStringValue:'But 1 pressed'.
    ].

  sender == but2
    ifTrue: [
      text1 setStringValue:'But 2 pressed'.
    ].

  ^self

]

