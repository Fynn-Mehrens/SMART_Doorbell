//
//  Image.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI
import Combine

// swiftlint:disable line_length

/// A SwiftUI Image extension to add direct Base64 support.
extension Image {
    /// Creates a new *Image* instance.
    ///
    /// - Parameter base64Encoded: The Base64 encoded image string.
    ///
    /// - Returns: The newly created *Image* instance.
    init(base64Encoded: String) {
        self.init(uiImage: UIImage(data: Data(base64Encoded: base64Encoded, options: .ignoreUnknownCharacters)!)!)
    }
}
/// A file private extension for a url session.
fileprivate extension URL {
    /// Returns an absolote string without query parameters.
    ///
    /// - Returns: A string.
    func absoluteStringWithoutQueryParams() -> String? {
        /// Contains the url components.
        if var urlcomponents = URLComponents(url: self, resolvingAgainstBaseURL: false) {
            urlcomponents.query = nil
            return urlcomponents.string
        }
        return nil
    }
}

/// The *NetworkImageCache*  keeps the images in the cache directory.
class NetworkImageCache: ObservableObject {
    /// Pending network image.
    @Published private var pending = Set<String>(minimumCapacity: 12)
    /// The shared url cache.
    private var urlCache = URLCache.shared
    /// The network image chache color scheme.
    private var schemeCache: [String: ColorScheme] = [:]

    /// Fetches the network image data and checks if we can find an image
    /// otherwise check if the requested missed image is pending.
    ///
    /// - Parameter url: The url string.
    /// - Returns: The network image data.
    func fetch(url: URL) -> NetworkImageData? {
        /// Requests the url.
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad)
        /// Retruns the url with an absolute string without query parameters.
        let urlString = url.absoluteStringWithoutQueryParams() ?? url.absoluteString

        guard let cached = urlCache.cachedResponse(for: request)?.data else {
            if !self.pending.contains(urlString) {
                self.pending.insert(urlString)

                #if targetEnvironment(simulator)
                if NetworkImage.debug {
                    print("[NetworkImage] Request image from: \(url.absoluteString)")
                }
                #endif

                URLSession.shared.dataTask(with: url) { data, response, _ in
                    if let data = data, let response = response {
                        DispatchQueue.main.async {
                            self.pending.remove(urlString)
                        }
                        self.urlCache.storeCachedResponse(CachedURLResponse(response: response,
                                                                            data: data), for: request)
                    }
                }
                .resume()
            }
            return nil
        }

        #if targetEnvironment(simulator)
        if NetworkImage.debug {
            print("[NetworkImage] Cached reponse for: \(url.absoluteString)")
        }
        #endif

        if self.schemeCache[urlString] == nil {
            self.schemeCache[urlString] = NetworkImageData.scheme(from: cached)

            #if targetEnvironment(simulator)
            if NetworkImage.debug {
                print("[NetworkImage] Computed color scheme for: \(url.absoluteString)")
            }
            #endif
        }

        return NetworkImageData(raw: cached, scheme: self.schemeCache[urlString])
    }
}

/// Represents the data returned from the network cache and its associated color scheme.
struct NetworkImageData: Equatable {
    /// The raw data of the network image.
    let raw: Data
    /// The color schemen of the natwork image.
    let scheme: ColorScheme

    /// Creates an instance of *NetworkImageData*.
    ///
    /// - Parameters:
    ///   - raw: Raw data.
    ///   - scheme: Color scheme.
    init(raw: Data, scheme: ColorScheme?) {
        self.raw = raw
        self.scheme = scheme == nil ? NetworkImageData.scheme(from: raw) : scheme!
    }

    /// Calculates based on the pixels of the image wether the image is light or dark to display the loading bar in the opposite color.
    ///
    /// - Parameter data: Gets the image data.
    ///
    /// - Returns: Light version of the color scheme.
    fileprivate static func scheme(from data: Data) -> ColorScheme {
        guard let image = CIImage(data: data) else {
            return .light
        }

        /// Contains extended verctors.
        let extentVec = CIVector(x: image.extent.origin.x,
                                 y: image.extent.origin.y,
                                 z: image.extent.size.width,
                                 w: image.extent.size.height * 0.05)

        /// Creates an CIFilter for an average image and returns the output image.
        guard let areaAverageFilter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: image, kCIInputExtentKey: extentVec]),
              let outputImage = areaAverageFilter.outputImage else {
            return .light
        }

        /// The bitmap of an 8-bit unsigned integer value typ.
        var bitmap = [UInt8](repeating: 0, count: 4)
        /// Renders image processing results and performs image analysis.
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return ((Float(bitmap[0]) * 0.2126) + (Float(bitmap[1]) * 0.7152) + (Float(bitmap[2]) * 0.0722)) > 199 ? .light : .dark
    }

    /// Returns a boolean value when the network image data raw is equal to the network image data scheme.
    static func == (lhs: NetworkImageData, rhs: NetworkImageData) -> Bool {
        return lhs.raw == rhs.raw && lhs.scheme == rhs.scheme
    }
}

/// Displays the *NetworkImage*.
struct NetworkImage: View {
    /// Uses the previously defined global network image cache instance.
    @EnvironmentObject private var cache: NetworkImageCache
    /// Base64 encoding that force unwraps the network image data to automatically unwarp the optional without having to check if its nil.
    @State private var base64: NetworkImageData!
    /// Url string.
    @Binding private var url: String
    /// The color schme.
    @Binding private var scheme: ColorScheme
    /// Placeholder data.
    private let placeholder: Data

    #if targetEnvironment(simulator)
    /// A boolean for debuging on the simulator.
    public static var debug = false
    #endif

    /// Creates a new *NetworkImage* instance.
    ///
    /// - Parameters:
    ///     - url: Defines the adress where the image is load from.
    ///     - placeholder: Defines the placeholder string for the image.
    ///     - scheme: Binding to detect the color scheme of the loaded image.
    ///
    /// - Returns: The newly created *NetworkImage* instance.
    init(_ url: Binding<String>, placeholder: String, scheme: Binding<ColorScheme>) {
        self._url = url
        self.placeholder = Data(base64Encoded: placeholder, options: .ignoreUnknownCharacters)!
        self._scheme = scheme
    }

    /// Represents a new *NetworkImage* instance.
    ///
    /// - Parameters:
    ///     - media: Represents the image.
    ///     - scheme: Scheme of type color scheme.
    ///
    /// - Returns: The newly created *NetworkImage* instance.
    init(_ media: MediaWithPlaceholder, scheme: Binding<ColorScheme> = .constant(.dark)) {
        self.init(.constant(media.url), placeholder: media.placeholder, scheme: scheme)
    }

    /// Creates a new *NetworkImage* instance.
    ///
    /// - Parameters:
    ///   - media: Represents the image.
    ///   - scheme: Scheme of type color scheme.
    init(_ media: Binding<MediaWithPlaceholder>, scheme: Binding<ColorScheme> = .constant(.dark)) {
        self.init(media.url, placeholder: media.wrappedValue.placeholder, scheme: scheme)
    }

    /// Retrieves the image from the network cache.
    private func refresh() {
        if !self.url.isEmpty {
            guard let url = URL(string: self.url), let res = self.cache.fetch(url: url), self.base64 != res else { return }
            self.base64 = res
            self.scheme = res.scheme
        }
    }

    /// Adds a fallback to the placeholder if its missing.
    var fallback: UIImage {
        UIImage(data: self.placeholder) ?? UIImage(data: Data(base64Encoded: MediaWithPlaceholder.black, options: .ignoreUnknownCharacters)!)!
    }

    /// The inner *NetworkImage* structure.
    var body: some View {
        Image(uiImage: UIImage(data: self.base64 == nil ? self.placeholder : self.base64.raw) ?? self.fallback)
            .resizable()
            .blur(radius: self.base64 == nil ? 25 : 0, opaque: true)
            .onAppear(perform: self.refresh)
            .onChange(of: self.url) { _ in
                self.refresh()
            }
            .onReceive(self.cache.objectWillChange) {
                self.refresh()
            }
    }
}

// swiftlint:enable line_length
