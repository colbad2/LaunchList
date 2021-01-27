// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct ScrollManagerView: UIViewRepresentable
{
   @Binding var indexPathToSetVisible: IndexPath?

   func makeUIView( context: Context ) -> UIView
   {
      return UIView()
   }

   func updateUIView( _ uiView: UIView, context: Context )
   {
      guard let indexPath = indexPathToSetVisible else { return }
      let superview: UIView? = uiView.findViewController()?.view

      if let tableView: UITableView = superview?.subview( of: UITableView.self )
      {
         if tableView.numberOfSections > indexPath.section &&
               tableView.numberOfRows( inSection: indexPath.section ) > indexPath.row
         {
            tableView.scrollToRow( at: indexPath, at: .middle, animated: true )
         }
      }

      DispatchQueue.main.async {
         self.indexPathToSetVisible = nil
      }
   }
}

extension UIView
{
   func subview<T>( of type: T.Type ) -> T?
   {
      return subviews.compactMap { $0 as? T ?? $0.subview( of: type ) }.first
   }

   func findViewController() -> UIViewController?
   {
      if let nextResponder: UIViewController = self.next as? UIViewController
      {
         return nextResponder
      }
      else if let nextResponder: UIView = self.next as? UIView
      {
         return nextResponder.findViewController()
      }
      else
      {
         return nil
      }
   }
}
