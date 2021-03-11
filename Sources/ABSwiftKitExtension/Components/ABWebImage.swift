import SwiftUI
import Combine

#if os(iOS)
public struct ABWebImage : View {
    @ObservedObject var imageModel: ImageModel
    public init(url: URL) {
        imageModel = ImageModel(url: url)
    }
    public var body: some View {
        Group {
            imageModel
                .image
                .map { Image(uiImage:$0).resizable() }
                ?? Image(systemName: "photo.fill").resizable()
        }
        .foregroundColor(.secondary)
    }
}

class ImageCache {
    enum Error: Swift.Error {
        case dataConversionFailed
        case sessionError(Swift.Error)
    }
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    private init() { }
    static func image(for url: URL) -> AnyPublisher<UIImage?, ImageCache.Error> {
        guard let image = self.shared.cache.object(forKey: url as NSURL) else {
            return URLSession
                .shared
                .dataTaskPublisher(for: url)
                .tryMap { (tuple) -> UIImage in
                    let (data, _) = tuple
                    guard let image = UIImage(data: data) else {
                        throw Error.dataConversionFailed
                    }
                    self.shared.cache.setObject(image, forKey: url as NSURL)
                    return image
                }
                .mapError({ error in Error.sessionError(error) })
                .eraseToAnyPublisher()
        }
        return Just(image)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

class ImageModel: ObservableObject {
    @Published var image: UIImage? = nil
    var cacheSubscription: AnyCancellable?
    init(url: URL) {
        cacheSubscription = ImageCache
            .image(for: url)
            .replaceError(with: nil)
            .receive(on: RunLoop.main, options: .none)
            .assign(to: \.image, on: self)
    }
}
#endif

#if os(macOS)
public struct ABWebImage : View {
    @ObservedObject var imageModel: ImageModel
    public init(url: URL) {
        imageModel = ImageModel(url: url)
    }
    public var body: some View {
        Group {
            if #available(macOS 11.0, *) {
                imageModel
                    .image
                    .map { Image(nsImage:$0).resizable() }
                    ?? Image(systemName: "photo.fill").resizable()
            } else {
                imageModel
                    .image
                    .map { Image(nsImage:$0).resizable() }
            }
        }
        .foregroundColor(.secondary)
    }
}

class ImageCache {
    enum Error: Swift.Error {
        case dataConversionFailed
        case sessionError(Swift.Error)
    }
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, NSImage>()
    private init() { }
    static func image(for url: URL) -> AnyPublisher<NSImage?, ImageCache.Error> {
        guard let image = self.shared.cache.object(forKey: url as NSURL) else {
            return URLSession
                .shared
                .dataTaskPublisher(for: url)
                .tryMap { (tuple) -> NSImage in
                    let (data, _) = tuple
                    guard let image = NSImage(data: data) else {
                        throw Error.dataConversionFailed
                    }
                    self.shared.cache.setObject(image, forKey: url as NSURL)
                    return image
                }
                .mapError({ error in Error.sessionError(error) })
                .eraseToAnyPublisher()
        }
        return Just(image)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

class ImageModel: ObservableObject {
    @Published var image: NSImage? = nil
    var cacheSubscription: AnyCancellable?
    init(url: URL) {
        cacheSubscription = ImageCache
            .image(for: url)
            .replaceError(with: nil)
            .receive(on: RunLoop.main, options: .none)
            .assign(to: \.image, on: self)
    }
}
#endif
