import SwiftUI
import CoreData

struct RocketDetail: View
{
   var rocket: Rocket?

   var body: some View
   {
      ScrollView
      {
         TitleField( s: rocket?.family )
         LeftField( s: rocket?.variant )
      }
      .padding()
      .navigationBarTitle( "Rocket", displayMode: .inline )
   }
}

#if DEBUG
struct RocketPreview: PreviewProvider
{
   static var previews: some View
   {
      // TODO doesn't work
      let context = PersistenceController.preview.container.viewContext
      let rocket = getEntityByID( id: 2663,
                                  context: context,
                                  entityName: "Rocket") as? Rocket
      Text(rocket?.fullName ?? "")
      RocketDetail( rocket: rocket )
   }
}
#endif
