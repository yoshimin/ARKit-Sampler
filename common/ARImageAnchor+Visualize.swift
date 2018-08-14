//
//  ARImageAnchor+Visualize.swift
//  ARKit-Sampler
//
//  Created by SHINGAI YOSHIMI on 2018/08/14.
//  Copyright © 2018年 Shuichi Tsutsumi. All rights reserved.
//

import Foundation
import ARKit

extension ARImageAnchor {
    func addPlaneNode(on node: SCNNode, contents: Any) {
        let geometry = SCNPlane(width: referenceImage.physicalSize.width, height: referenceImage.physicalSize.height)
        let planeNode = addChildNode(on: node, geometry: geometry, contents: contents)
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2.0, 1, 0, 0)
    }

    func updatePlaneNode(on node: SCNNode) {
        DispatchQueue.main.async(execute: {
            guard let plane = self.findPlaneNode(on: node)?.geometry as? SCNPlane else {
                return
            }

            let physicalWidth = self.referenceImage.physicalSize.width
            let physicalHeight = self.referenceImage.physicalSize.height

            if plane.width == physicalWidth && plane.height == physicalHeight {
                return
            }

            plane.width = physicalWidth
            plane.height = physicalHeight
        })
    }
}
