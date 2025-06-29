variable "env" {
  type = string        # This is a string data type, which accepts plain text values.
  default = "Prod"     # Default value is set to "Prod".
}

variable "instance_count" {
  type = number        # This is a number data type, which accepts integer or float values.
  default = 3          # Default value is set to 3.
}

variable "enable_monitoring" {
  type = bool          # This is a boolean data type, which accepts true or false.
  default = false      # Default value is set to false.
}

variable "az" {
  type = list(string)  # This is a list data type, containing elements of type string.
  default = ["us-east-1a", "us-east-1b"]  # A list of Availability Zones as strings.
}

variable "sg" {
  type = set(string)   # This is a set data type, which contains unique string values.
  default = ["sg-722726262", "sg-722726236673"]  # A set of Security Group IDs as strings.
}

variable "tag" {
  type = map(string)   # This is a map data type with string keys and string values.
  default = {          # Maps are collections of key-value pairs.
    "Env" = "Dev"      
    "Owner" = "Dev"
  }
}

variable "s3_bucket" {
  type = string        # String data type, usually for storing names or identifiers.
  default = null       # Default value is null, indicating it's optional.
}

variable "instance_config" {
  type = object({      # This is an object data type, which allows grouping of multiple attributes.
    enable_monitoring = bool
    instance_type = string
    volume_size = number
  })
  default = {          # Default values for each attribute in the object.
    enable_monitoring = false
    instance_type = "t2.micro"
    volume_size = 8
  }
}

variable "resource_info" {
  type = tuple([string, number, bool])  # This is a tuple data type, which allows a fixed sequence of mixed types.
  default = ["t2.micro", 3, true]       # The tuple holds a specific order of values: string, number, and bool.
}
