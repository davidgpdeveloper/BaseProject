//
//  PermissionTools.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit
import Photos

protocol PermissionProtocol {
    func passPermissionResult(value: Bool, from: String)
}

enum AttachmentType: String {
    case camera, video, photoLibrary
}

class PermissionTools {
    
    var delegatePermission: PermissionProtocol?
    
    func authorisationCamera() {
        // First we check if the device has a camera (otherwise will crash in Simulator - also, some iPod touch models do not have a camera).
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .authorized:
                print("cam authorized")
                delegatePermission?.passPermissionResult(value: true, from: AttachmentType.camera.rawValue)
            case .denied:
                print("cam denied")
                delegatePermission?.passPermissionResult(value: false, from: AttachmentType.camera.rawValue)
            case .notDetermined:
                print("cam notDetermined")
                AVCaptureDevice.requestAccess(for: .video) { (status) in
                    if status {
                        // cam access given
                        print("cam access given")
                        self.delegatePermission?.passPermissionResult(value: true, from: AttachmentType.camera.rawValue)
                    } else {
                        print("cam restriced manually")
                        self.delegatePermission?.passPermissionResult(value: false, from: AttachmentType.camera.rawValue)
                    }
                }
            default:
                print("cam default")
                delegatePermission?.passPermissionResult(value: false, from: AttachmentType.video.rawValue)
            }
        }
    }
    
    
    func authorisationPhotoGallery() {
        
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            self.delegatePermission?.passPermissionResult(value: true, from: AttachmentType.photoLibrary.rawValue)
        case .denied:
            print("photo galery permission denied")
            delegatePermission?.passPermissionResult(value: false, from: AttachmentType.photoLibrary.rawValue)
        case .notDetermined:
            print("Permission Not Determined")
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == PHAuthorizationStatus.authorized {
                    // photo library access given
                    print("access given")
                    self.delegatePermission?.passPermissionResult(value: true, from: AttachmentType.photoLibrary.rawValue)
                }else{
                    print("restriced manually")
                    self.delegatePermission?.passPermissionResult(value: false, from: AttachmentType.photoLibrary.rawValue)
                }
            })
        case .restricted:
            print("permission restricted")
            delegatePermission?.passPermissionResult(value: false, from: AttachmentType.photoLibrary.rawValue)
        default:
            delegatePermission?.passPermissionResult(value: false, from: AttachmentType.photoLibrary.rawValue)
            break
        }
    }
    
}

