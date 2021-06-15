let ConnectionProcessingMethod = ../../../types/ConnectionProcessingMethod.dhall

let d = ../../../utils/directives.dhall

in      d.connectionProcessingMethod "use"
    //  { select = ConnectionProcessingMethod.select
        , poll = ConnectionProcessingMethod.poll
        , kqueue = ConnectionProcessingMethod.kqueue
        , epoll = ConnectionProcessingMethod.epoll
        , devpoll = ConnectionProcessingMethod.devpoll
        , eventport = ConnectionProcessingMethod.eventport
        }
