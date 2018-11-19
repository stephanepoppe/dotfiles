#if ($TYPE_HINT == "int")
    #set($TYPE_HINT = "integer")
#elseif ($TYPE_HINT == "bool")
    #set($TYPE_HINT = "boolean")
#end