let ConnectionProcessingMethod =
      ../../../types/ConnectionProcessingMethod/type.dhall

let d = ../../../utils/directives.dhall

in      d.connectionProcessingMethod "use"
    /\  { select = ConnectionProcessingMethod.select
        , poll = ConnectionProcessingMethod.poll
        , kqueue = ConnectionProcessingMethod.kqueue
        , epoll = ConnectionProcessingMethod.epoll
        , devpoll = ConnectionProcessingMethod.devpoll
        , eventport = ConnectionProcessingMethod.eventport
        }
