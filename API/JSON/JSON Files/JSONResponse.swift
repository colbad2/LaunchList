// Copyright © 2021 Bradford Holcombe. All rights reserved.

protocol JSONResponse
{
   var totalCount: Int64? { get }
}

/**
 Base protocol for all JSON classes.
 */
public protocol JSONElement
{
   /**
    Creates a JSON class from a JSON structure.
    */
   init?( _ json: Any? )
}
