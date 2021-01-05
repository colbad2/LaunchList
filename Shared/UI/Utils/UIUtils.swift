import SwiftUI

public func missionName( _ launch: Launch? ) -> String
{
   guard let launch = launch else { return "" }
   if let missionName = launch.mission?.name { return missionName }
   let parts = launch.name?.components( separatedBy: "|" )
   let missionPart = parts?.last

   return missionPart?.trimmingCharacters( in: .whitespacesAndNewlines ) ?? launch.name ?? ""
}


struct ScrollManagerView: UIViewRepresentable {

    @Binding var indexPathToSetVisible: IndexPath?

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }

   func updateUIView(_ uiView: UIView, context: Context) {
           guard let indexPath = indexPathToSetVisible else { return }
           let superview = uiView.findViewController()?.view

           if let tableView = superview?.subview(of: UITableView.self) {
               if tableView.numberOfSections > indexPath.section &&
                   tableView.numberOfRows(inSection: indexPath.section) > indexPath.row {
                   tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
               }
           }

           DispatchQueue.main.async {
               self.indexPathToSetVisible = nil
           }
       }
}

extension UIView {

    func subview<T>(of type: T.Type) -> T? {
        return subviews.compactMap { $0 as? T ?? $0.subview(of: type) }.first
    }

    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
