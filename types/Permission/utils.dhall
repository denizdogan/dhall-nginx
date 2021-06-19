let RWX/utils = ../RWX/utils.dhall

let all = RWX/utils.all

let none = RWX/utils.none

let rw = RWX/utils.rw

let rx = RWX/utils.rx

let _600 = { user = rw, group = none, all = none }

let _700 = { user = all, group = none, all = none }

let _755 = { user = all, group = rx, all = rx }

let _777 = { user = all, group = all, all }

in  { _600, _700, _755, _777 }
