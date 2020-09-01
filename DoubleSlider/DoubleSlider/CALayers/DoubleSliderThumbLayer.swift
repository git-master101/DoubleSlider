//
//  DoubleSliderThumbLayer.swift
//  DoubleSlider
//
//  Created by josh on 2018/03/30.
//  Copyright © 2018年 yhkaplan. All rights reserved.
//

import QuartzCore

// DoubleSliderThumbLayer represents the each of the draggable
// thumb layers that indicate the minimum and maximum values
// in the range
// I decided not to make this class open because it is very small,
// meaning that developers could make their own custom CALayer
// subclass in the same amount of time as it would take to subclass
// this one
public class DoubleSliderThumbLayer: CALayer, DoubleSliderLayer {
    weak var doubleSlider: DoubleSlider?

    var isHighlighted: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }

    public override func draw(in ctx: CGContext) {
        guard let slider = doubleSlider else { return }

        let thumbFrame = bounds.insetBy(dx: 8, dy: 8)
        let cornerRadius = thumbFrame.height * slider.roundedness / 2.0
        let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)

        // Fill with shadow
        let shadowColor = Colors.defaultWhite.cgColor
        ctx.setFillColor(slider.thumbTintColor.cgColor)
        ctx.addPath(thumbPath.cgPath)
        ctx.fillPath()

        // Outline
        ctx.setStrokeColor(shadowColor)
        ctx.setLineWidth(2)
        ctx.addPath(thumbPath.cgPath)
        ctx.strokePath()

    }
}
