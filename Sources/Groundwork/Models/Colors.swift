import UIKit

public struct BackgroundColor: ColorPalette {
    public var light: UIColor
    public var dark: UIColor
    
    public init(light: UIColor, dark: UIColor? = nil) {
        self.light = light
        self.dark = dark ?? light
    }
}

public struct TintColor: ColorPalette {
    public var light: UIColor
    public var dark: UIColor
    
    public init(light: UIColor, dark: UIColor? = nil) {
        self.light = light
        self.dark = dark ?? light
    }
}

public struct TextColor: ColorPalette {
    public var light: UIColor
    public var dark: UIColor
    
    public init(light: UIColor, dark: UIColor? = nil) {
        self.light = light
        self.dark = dark ?? light
    }
}

public struct SystemColor: ColorPalette {
    public var light: UIColor
    public var dark: UIColor
    
    public init(light: UIColor, dark: UIColor? = nil) {
        self.light = light
        self.dark = dark ?? light
    }
}

public struct BorderColor: ColorPalette {
    public var light: UIColor
    public var dark: UIColor
    
    public init(light: UIColor, dark: UIColor? = nil) {
        self.light = light
        self.dark = dark ?? light
    }
}
