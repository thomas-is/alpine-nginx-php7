
<https://gitweb.torproject.org/torspec.git/tree/control-spec.txt>

```text
3.7. SIGNAL

  Sent from the client to the server. The syntax is:

     "SIGNAL" SP Signal CRLF

      Signal = "RELOAD" / "SHUTDOWN" / "DUMP" / "DEBUG" / "HALT" /
              "HUP" / "INT" / "USR1" / "USR2" / "TERM" / "NEWNYM" /
              "CLEARDNSCACHE" / "HEARTBEAT" / "ACTIVE" / "DORMANT"
```
