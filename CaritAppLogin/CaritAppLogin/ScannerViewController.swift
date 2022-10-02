//
//  ScannerViewController.swift
//  CaritAppLogin
//
//  Created by Jose Gabriel Ramon Castro on 02/10/22.
//

import UIKit
import AVFoundation



class ScannerViewController: UIViewController {
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrame:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QRScanner()

        
        // Do any additional setup after loading the view.
    }
    
    private func QRScanner(){
        
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: .video, position: .back )
        
        guard let captureDevice = discoverySession.devices.first
        else{
            
            print("No se detecto dispositivo")
            return
        }
        
        do {
         
            let input =  try AVCaptureDeviceInput(device:captureDevice)
            captureSession.addInput(input)
            
            let videoMetaDataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(videoMetaDataOutput)
            
            videoMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            videoMetaDataOutput.metadataObjectTypes = [.qr]
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session:captureSession)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            

            qrCodeFrame = UIView()
            
            if qrCodeFrame == qrCodeFrame {
                qrCodeFrame.layer.borderColor = UIColor.yellow.cgColor
                qrCodeFrame.layer.borderWidth = 4.0
                
                view.addSubview(qrCodeFrame)
                view.bringSubviewToFront(qrCodeFrame)
            }
            
            captureSession.startRunning()
            
        }catch{
            
            print(error)
            return
        }
            
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ScannerViewController:AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects.count == 0{
            
            qrCodeFrame.frame = .zero
            print("No se encontro codigo")
            return
        }
        /*
            MetadadataObject es el valor que va a tener al leer el codigo
         */
        
        let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObject.type == .qr {
            
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObject)
            qrCodeFrame.frame = barCodeObject!.bounds
            
            
            if metadataObject.stringValue != nil {
                print("Code value is == \(String(describing: metadataObject.stringValue))")
            }
            
            
        }
    }
}
