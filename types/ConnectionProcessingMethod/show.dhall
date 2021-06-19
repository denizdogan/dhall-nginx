let type = ./type.dhall

let show =
      λ(value : type) →
        merge
          { select = "select"
          , poll = "poll"
          , kqueue = "kqueue"
          , epoll = "epoll"
          , devpoll = "/dev/poll"
          , eventport = "eventport"
          }
          value

in  show
