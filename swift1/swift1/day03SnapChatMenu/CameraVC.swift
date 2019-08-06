//
//  CameraVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/30.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit
import AVKit

class CameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,AVCapturePhotoCaptureDelegate  {
    lazy var cameraView: UIView = {
        let cameraView : UIView = UIView.init(frame: self.view.frame)
        return cameraView;
    }()
    
    lazy var tempImageView: UIImageView = {
        let tempImageView : UIImageView = UIImageView.init(frame: self.view.frame)
        return tempImageView;
    }()
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCapturePhotoOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tempImageView.isUserInteractionEnabled = true
        view.addSubview(self.cameraView)
        view.addSubview(self.tempImageView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession.init()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        captureSession!.automaticallyConfiguresCaptureDeviceForWideColor = true
        let device = AVCaptureDevice.default(for: .video)
        guard device != nil else { return }
        var error : NSError?
        var input:AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput.init(device: device!)
            
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            captureSession?.addInput(input)
            stillImageOutput = AVCapturePhotoOutput.init()
            if let stillImageOutputTemp = stillImageOutput {
                if captureSession?.canAddOutput(stillImageOutputTemp) != nil {
                    captureSession?.addOutput(stillImageOutputTemp)
                    if let captureSessionTemp = captureSession {
                        previewLayer = AVCaptureVideoPreviewLayer.init(session: captureSessionTemp)
                        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
                        previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                        cameraView.layer.addSublayer(previewLayer!)
                        captureSession?.commitConfiguration()
                        captureSession?.startRunning()
                    }
                }
            }
        }
        
    }
    func didPressTakePhoto(){
        if let videoConnection = stillImageOutput?.connection(with: AVMediaType.video) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            let settings = AVCapturePhotoSettings()
            if settings.availablePreviewPhotoPixelFormatTypes.count > 0 {
                settings.previewPhotoFormat = [ kCVPixelBufferPixelFormatTypeKey as String : settings.availablePreviewPhotoPixelFormatTypes.first!]
            }
            stillImageOutput!.capturePhoto(with: settings, delegate: self)
        

        }
    }
    func photoOutput(_ captureOutput: AVCapturePhotoOutput,  didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?,  previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings:  AVCaptureResolvedPhotoSettings, bracketSettings:   AVCaptureBracketedStillImageSettings?, error: Error?) {
        if let error = error {
            print("-----error occure : \(error.localizedDescription)")
        }
        if let sampleBuffer = photoSampleBuffer {
            let previewBuffer = previewPhotoSampleBuffer

            let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer)!
            
            print(UIImage.init(data: dataImage)?.size as Any)
            
            let dataProvider = CGDataProvider.init(data: dataImage as CFData)
            let cgImageRef: CGImage! = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage.init(cgImage: cgImageRef, scale: 1.0, orientation: UIImage.Orientation.right)
            self.tempImageView.image = image;
            self.tempImageView.isHidden = false
        }
        
    }
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother(){
        if didTakePhoto == true{
            tempImageView.isHidden = true
            didTakePhoto = false
            
        }
        else{
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }
}
