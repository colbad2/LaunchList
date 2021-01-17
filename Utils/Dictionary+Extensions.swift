// Copyright © 2021 Bradford Holcombe. All rights reserved.

extension Dictionary where Value: Equatable
{
   func key( forValue value: Value ) -> Key?
   {
      return first { $0.1 == value }?.0
   }
}
