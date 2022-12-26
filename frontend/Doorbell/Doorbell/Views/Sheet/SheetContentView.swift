//
//  SheetContentView.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI
import MapKit
/*
 struct SheetContentView: View {
 /// The shared state of all custom sheets.
 @EnvironmentObject var sheetState: SheetState
 /// Reference to the divice size category class.
 @Environment(\.deviceSizeClass) var category
 /// The location search auto-completion results.
 @State private var completions: [MKLocalSearchCompletion] = []
 /// Defines wether a content is focused.
 @State private var focused = false
 
 /// Defines the inner *SheetContentView*.
 ///
 /// - Since Sprint 8
 var body: some View {
 if self.focused {
 VStack(alignment: .leading) {
 TripFocusView()
 }
 .configureSheet(state: self.sheetState) { sheet in
 if self.focused {
 sheet.dismissable = true
 sheet.expanded = false
 sheet.indicator = false
 sheet.locked = true
 }
 }
 .onSheetDismiss(state: self.sheetState) {
 self.focused = false
 }
 } else {
 VStack(alignment: .leading) {
 LocationSearchBarView(completions: self.$completions)
 .padding()
 
 if self.completions.isEmpty {
 PreplannedTripSectionView(focused: self.$focused)
 .padding()
 
 YourTripSectionView(focused: self.$focused)
 .padding()
 }
 
 List {
 ForEach(self.completions, id: \.self) { completion in
 VStack(alignment: .leading) {
 Text(completion.title)
 .onAppear {
 let geoCoder = CLGeocoder()
 geoCoder.geocodeAddressString(completion.subtitle) { (placemarks, _) in
 guard let placemarks = placemarks,
 let location = placemarks.first?.location
 else { return }
 print("COORDS: \(location.coordinate)")
 }
 }
 Text(completion.subtitle)
 .font(.subheadline)
 .foregroundColor(.gray)
 }
 }
 .listRowBackground(Color.clear)
 }
 .modifier(TransparentListBackground())
 }
 .configureSheet(state: self.sheetState) { sheet in
 if !self.focused {
 sheet.expanded = true
 if self.category != .ultraLarge {
 sheet.maxHeightThreshold = 0.6
 }
 }
 }
 }
 }
 }
 
 /// *SheetContentView* previews for color schemes *.light* and *.dark*.
 ///
 /// - Since: Sprint 8
 struct SheetContentView_Previews: PreviewProvider {
 /// The group of views displayed as the preview.
 ///
 /// - Since: Sprint 8
 static var previews: some View {
 Group {
 SheetContentView()
 .previewLayout(PreviewLayout.sizeThatFits)
 .previewDisplayName("Light Color Scheme")
 
 SheetContentView()
 .previewLayout(PreviewLayout.sizeThatFits)
 .previewDisplayName("Dark Color Scheme")
 .preferredColorScheme(.dark)
 }
 }
 }
 */
