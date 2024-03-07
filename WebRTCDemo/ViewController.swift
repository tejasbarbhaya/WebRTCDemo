//
//  ViewController.swift
//  WebRTCDemo
//
//  Created by Tejash Barbhaya on 06/03/24.
//

import UIKit
import WebRTCiOSSDK

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnPublish: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    var client:AntMediaClient =  AntMediaClient.init();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPlay.isHidden = true // Make this button enable / disabled based on your requirement
        btnPublish.isHidden = !btnPlay.isHidden
    }
    
    @IBAction func onPublish(_ sender: Any) {
        //MARK: To publish the live stream to other device
        client.setLocalView(container: containerView);
        client.setWebSocketServerUrl(url: "wss://test.antmedia.io:5443/WebRTCAppEE/websocket");
        client.publish(streamId: "stream1271286")
    }
    
    @IBAction func onPlay(_ sender: Any) {
        //MARK: To Receive / Play the live stream, published from other device
        client.setRemoteView(remoteContainer: containerView)
        client.setWebSocketServerUrl(url: "wss://test.antmedia.io:5443/WebRTCAppEE/websocket");
        client.play(streamId: "stream1271286")
    }
}

