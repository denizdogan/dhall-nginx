let AddressType = ./variants/address/type.dhall

let PortType = ./variants/port/type.dhall

let UnixPathType = ./variants/unixPath/type.dhall

in  < Address : AddressType | Port : PortType | UnixPath : UnixPathType >
