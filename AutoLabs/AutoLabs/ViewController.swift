//
//  ViewController.swift
//  AutoLabs
//
//  Created by Ali Kabel on 15.07.18.
//  Copyright © 2018 Ali Kabel. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?

    // MARK: - UIView Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func recordButtonClicked(_ sender: Any) {
        recordAndRecognizeSpeech()
    }
    
    // MARK:- Recording Methods
    
    func recordAndRecognizeSpeech() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat, block: { buffer, _ in
            self.request.append(buffer)
        })
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            // show alert view with error
            return print(error)
        }
        
        guard let myRecognizer = SFSpeechRecognizer() else { return }
        
        if !myRecognizer.isAvailable {
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
            if let result = result {
                let resultText = result.bestTranscription.formattedString
                print(resultText)
                self.cityLabel.text = resultText
            } else if let error = error {
                print(error)
            }
        })
    }
   


}

