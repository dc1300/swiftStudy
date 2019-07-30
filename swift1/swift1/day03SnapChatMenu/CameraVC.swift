//
//  CameraVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/30.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit
import AVKit

class CameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    lazy var cameraView: UIView = {
        let cameraView : UIView = UIView.init(frame: self.view.frame)
        return cameraView;
    }()
    
    lazy var tempImageView: UIImageView = {
        let tempImageView : UIImageView = UIImageView.init(frame: self.view.frame)
        return tempImageView;
    }()
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.backgroundImageView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession.init()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        let backCamera = AVCaptureDevice.devices(for: AVMediaType.video).first
        var error : NSError?
        var input : AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput.init(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
//        if (error == nil && captureSession?.canAddInput(input) != nil) {
//            captureSession?.addInput(input)
//            stillImageOutput = AVCaptureInput
//            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecType.jpeg]
//            if let stillImageOutputTemp = stillImageOutput{
//                captureSession?.addOutput(stillImageOutput)
//                
//            }
//        }
    }
}
