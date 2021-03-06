import XCDBLD

/// The build options used for building `xcodebuild` command.
public struct BuildOptions {
	/// The Xcode configuration to build.
	public var configuration: String
	/// The platforms to build for.
	public var platforms: Set<Platform>
	/// The toolchain to build with.
	public var toolchain: String?
	/// The path to the custom derived data folder.
	public var derivedDataPath: String?
	/// Whether to skip building if valid cached builds exist.
	public var cacheBuilds: Bool
	/// Whether to use downloaded binaries if possible.
	public var useBinaries: Bool
    /// Skip archive when build Device SDK
    public var skipArchive: Bool
    /// Custom name for Cartfiles
    public var cartfile: String?
    
	public init(
		configuration: String,
		platforms: Set<Platform> = [],
		toolchain: String? = nil,
		derivedDataPath: String? = nil,
		cacheBuilds: Bool = true,
		useBinaries: Bool = true,
        skipArchive: Bool = false,
        cartfile: String? = nil
	) {
		self.configuration = configuration
		self.platforms = platforms
		self.toolchain = toolchain
		self.derivedDataPath = derivedDataPath
		self.cacheBuilds = cacheBuilds
		self.useBinaries = useBinaries
        self.skipArchive = skipArchive
        self.cartfile = cartfile
        if let cartfile = cartfile {
            Constants.Project.configure(with: cartfile)
        }
	}
}
